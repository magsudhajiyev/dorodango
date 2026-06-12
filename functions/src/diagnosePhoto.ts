import {onCall, HttpsError} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import * as admin from "firebase-admin";
import Anthropic from "@anthropic-ai/sdk";
import {DiagnosePhotoRequest} from "./types";
import {buildObservationPrompt, buildDiagnosisPrompt} from "./diagnosisPrompts";

const anthropicApiKey = defineSecret("ANTHROPIC_API_KEY");

const stageKeyToOrder: Record<string, number> = {
  core_forming: 1,
  drying: 2,
  dusting_capping: 3,
  polishing: 4,
  finished: 5,
};

export const diagnosePhoto = onCall(
  {
    region: "us-east4",
    invoker: "public",
    timeoutSeconds: 90,
    memory: "512MiB",
    secrets: [anthropicApiKey],
  },
  async (request) => {
    // 1. Auth check
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Must be signed in.");
    }
    const uid = request.auth.uid;

    // 2. Validate input
    const data = request.data as DiagnosePhotoRequest;
    if (!data.buildId || typeof data.buildId !== "string") {
      throw new HttpsError("invalid-argument", "buildId is required.");
    }
    if (!data.stageKey || typeof data.stageKey !== "string") {
      throw new HttpsError("invalid-argument", "stageKey is required.");
    }
    if (!data.photoUrl || typeof data.photoUrl !== "string") {
      throw new HttpsError("invalid-argument", "photoUrl is required.");
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

    // 4. Fetch image and convert to base64
    try {
      console.log("Step 4: Fetching image from:", data.photoUrl.substring(0, 80) + "...");
      const imageResponse = await fetch(data.photoUrl);
      if (!imageResponse.ok) {
        throw new Error(`Image fetch failed: ${imageResponse.status} ${imageResponse.statusText}`);
      }
      const imageBuffer = await imageResponse.arrayBuffer();
      const base64Image = Buffer.from(imageBuffer).toString("base64");
      console.log("Step 4: Image fetched, base64 length:", base64Image.length);

      const client = new Anthropic({
        apiKey: anthropicApiKey.value().trim(),
        timeout: 60000,
      });

      // 5. Pass 1: Observe
      console.log("Step 5: Calling Claude for observation...");
      const observeResponse = await client.messages.create({
        model: "claude-haiku-4-5-20251001",
        max_tokens: 300,
        system: buildObservationPrompt(data.stageKey),
        messages: [
          {
            role: "user",
            content: [
              {
                type: "image",
                source: {
                  type: "base64",
                  media_type: "image/jpeg",
                  data: base64Image,
                },
              },
              {
                type: "text",
                text: "Describe what you observe.",
              },
            ],
          },
        ],
      });

      const observationText =
        observeResponse.content[0].type === "text"
          ? observeResponse.content[0].text
          : "";
      console.log("Step 5: Observation complete:", observationText.substring(0, 100) + "...");

      // 6. Pass 2: Diagnose
      console.log("Step 6: Calling Claude for diagnosis...");
      const diagnoseResponse = await client.messages.create({
        model: "claude-haiku-4-5-20251001",
        max_tokens: 400,
        system: buildDiagnosisPrompt(data.stageKey, observationText),
        messages: [
          {
            role: "user",
            content:
              "Based on the observation, provide your diagnosis.",
          },
        ],
      });

      const diagnosisText =
        diagnoseResponse.content[0].type === "text"
          ? diagnoseResponse.content[0].text
          : "";
      console.log("Step 6: Diagnosis complete:", diagnosisText.substring(0, 100) + "...");

      // 7. Write diagnosis to Firestore
      const stageOrder = stageKeyToOrder[data.stageKey] ?? 1;
      console.log("Step 7: Writing to Firestore stage doc:", stageOrder);
      await db
        .collection("users")
        .doc(uid)
        .collection("builds")
        .doc(data.buildId)
        .collection("stages")
        .doc(stageOrder.toString())
        .update({diagnosis: diagnosisText});

      console.log("Step 8: Returning success");
      // 8. Return
      return {
        diagnosis: diagnosisText,
        creditsRemaining,
      };
    } catch (apiError) {
      // 9. Refund credit on failure
      const errObj = apiError as Error;
      console.error("Diagnosis failed at some step. Error:", errObj.message);
      console.error("Error name:", errObj.name);
      if ("status" in errObj) console.error("Status:", (errObj as Record<string, unknown>).status);
      if ("cause" in errObj) console.error("Cause:", errObj.cause);
      try {
        await db.runTransaction(async (tx) => {
          const userDoc = await tx.get(userRef);
          const currentCredits =
            (userDoc.data()?.credits as number) ?? 0;
          tx.update(userRef, {credits: currentCredits + 1});
        });
        console.log("Credit refunded successfully");
      } catch (_refundErr) {
        console.error("Credit refund failed:", _refundErr);
      }
      throw new HttpsError("internal", "Photo diagnosis failed.");
    }
  }
);
