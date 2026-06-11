import {onCall, HttpsError} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import * as admin from "firebase-admin";
import Anthropic from "@anthropic-ai/sdk";
import {PredictDorodangoRequest} from "./types";

const anthropicApiKey = defineSecret("ANTHROPIC_API_KEY");

const PREDICTION_SYSTEM_PROMPT = `You are an expert hikaru dorodango maker — \
the Japanese craft of polishing balls of mud into shining spheres. Given soil \
data for a location, predict how a dorodango made from that soil will turn out.

Soil guidance: clay binds the sphere and produces the final shine; some silt \
helps the capping layer; high sand content makes the core crumble and the \
surface pit. Around 20-40% clay is ideal. WRB soil classes hint at workability \
(e.g. Vertisols are clay-rich but crack while drying; Arenosols are sandy and \
difficult; Cambisols and Luvisols are usually workable).

Respond in plain text, no markdown, under 130 words, with exactly these four \
short sections in this order, each on its own lines:
Outlook: one sentence on the likely result (shine potential and durability).
Difficulty: easy / moderate / hard, with a brief reason.
Watch out for: the single biggest risk while building with this soil.
Tip: one concrete preparation step to improve the result.

Be honest but encouraging, in the calm, craftsmanlike tone of a patient \
teacher. If the data suggests poor soil, say so plainly and focus the tip on \
how to amend it.`;

function buildUserPrompt(data: PredictDorodangoRequest): string {
  const lines: string[] = ["Soil data for my location:"];
  if (data.wrbClass) {
    lines.push(`- WRB soil class: ${data.wrbClass}`);
  }
  if (typeof data.clayPct === "number") {
    lines.push(`- Topsoil clay: ${data.clayPct.toFixed(1)}%`);
  }
  if (typeof data.sandPct === "number") {
    lines.push(`- Topsoil sand: ${data.sandPct.toFixed(1)}%`);
  }
  if (typeof data.siltPct === "number") {
    lines.push(`- Topsoil silt: ${data.siltPct.toFixed(1)}%`);
  }
  lines.push(
    "Predict the result of a hikaru dorodango made from this soil."
  );
  return lines.join("\n");
}

export const predictDorodango = onCall(
  {
    region: "us-east4",
    timeoutSeconds: 60,
    secrets: [anthropicApiKey],
  },
  async (request) => {
    // 1. Auth check
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Must be signed in.");
    }
    const uid = request.auth.uid;

    // 2. Validate input
    const data = request.data as PredictDorodangoRequest;
    const hasClass = typeof data.wrbClass === "string" && data.wrbClass.length > 0;
    const hasComposition =
      typeof data.clayPct === "number" &&
      typeof data.sandPct === "number" &&
      typeof data.siltPct === "number";
    if (!hasClass && !hasComposition) {
      throw new HttpsError(
        "invalid-argument",
        "wrbClass or clay/sand/silt percentages are required."
      );
    }
    const pctFields = [data.clayPct, data.sandPct, data.siltPct];
    for (const pct of pctFields) {
      if (pct !== undefined && (typeof pct !== "number" || pct < 0 || pct > 100)) {
        throw new HttpsError("invalid-argument", "Percentages must be 0-100.");
      }
    }

    const db = admin.firestore();
    const userRef = db.collection("users").doc(uid);

    // 3. Atomic credit deduction
    let creditsRemaining: number;
    try {
      creditsRemaining = await db.runTransaction(async (tx) => {
        const userDoc = await tx.get(userRef);
        if (!userDoc.exists) {
          throw new HttpsError("not-found", "User not found.");
        }
        const credits = (userDoc.data()?.credits as number) ?? 0;
        if (credits <= 0) {
          throw new HttpsError(
            "resource-exhausted",
            "No credits remaining."
          );
        }
        const newCredits = credits - 1;
        tx.update(userRef, {credits: newCredits});
        return newCredits;
      });
    } catch (e) {
      if (e instanceof HttpsError) throw e;
      throw new HttpsError("internal", "Credit deduction failed.");
    }

    // 4. Call Claude
    try {
      const client = new Anthropic({
        apiKey: anthropicApiKey.value().trim(),
        timeout: 45000,
      });

      const response = await client.messages.create({
        model: "claude-opus-4-8",
        max_tokens: 500,
        system: PREDICTION_SYSTEM_PROMPT,
        messages: [
          {
            role: "user",
            content: buildUserPrompt(data),
          },
        ],
      });

      const prediction =
        response.content[0].type === "text" ? response.content[0].text : "";
      if (!prediction) {
        throw new Error("Empty prediction from model.");
      }

      return {
        prediction,
        creditsRemaining,
      };
    } catch (apiError) {
      // 5. Refund credit on failure
      console.error("Prediction failed:", (apiError as Error).message);
      try {
        await db.runTransaction(async (tx) => {
          const userDoc = await tx.get(userRef);
          const currentCredits =
            (userDoc.data()?.credits as number) ?? 0;
          tx.update(userRef, {credits: currentCredits + 1});
        });
      } catch (refundErr) {
        console.error("Credit refund failed:", refundErr);
      }
      throw new HttpsError("internal", "Prediction failed.");
    }
  }
);
