import {onCall, HttpsError} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import * as admin from "firebase-admin";
import Anthropic from "@anthropic-ai/sdk";
import {SendMessageRequest, BuildData, StageData} from "./types";
import {buildSystemPrompt} from "./systemPrompt";

const anthropicApiKey = defineSecret("ANTHROPIC_API_KEY");

const LANGUAGE_NAMES: Record<string, string> = {
  en: "English",
  az: "Azerbaijani",
  de: "German",
  es: "Spanish",
  fr: "French",
  it: "Italian",
  ja: "Japanese",
  pt: "Portuguese",
  ru: "Russian",
  tr: "Turkish",
};

export const sendMessage = onCall(
  {
    region: "us-east4",
    invoker: "public",
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
    const data = request.data as SendMessageRequest;
    if (!data.message || typeof data.message !== "string") {
      throw new HttpsError("invalid-argument", "message is required.");
    }
    if (!data.buildId || typeof data.buildId !== "string") {
      throw new HttpsError("invalid-argument", "buildId is required.");
    }
    const conversationHistory = data.conversationHistory ?? [];

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

    // 4. Fetch build data for system prompt
    const buildDoc = await db
      .collection("users")
      .doc(uid)
      .collection("builds")
      .doc(data.buildId)
      .get();
    if (!buildDoc.exists) {
      throw new HttpsError("not-found", "Build not found.");
    }
    const buildData = buildDoc.data() as BuildData;

    const stagesSnap = await db
      .collection("users")
      .doc(uid)
      .collection("builds")
      .doc(data.buildId)
      .collection("stages")
      .orderBy("enteredAt")
      .get();
    const stages = stagesSnap.docs.map((d) => d.data() as StageData);

    // Current stage = last stage entry
    const currentStage =
      stages.length > 0
        ? stages[stages.length - 1].stage
        : "core_forming";

    let systemPrompt = buildSystemPrompt(buildData, stages, currentStage);
    const language = LANGUAGE_NAMES[data.languageCode ?? ""];
    if (language && language !== "English") {
      systemPrompt +=
        `\n\nIMPORTANT: The user speaks ${language}. ` +
        `Always respond in ${language}.`;
    }

    // 5. Call Claude
    try {
      const client = new Anthropic({apiKey: anthropicApiKey.value().trim()});

      const messages = [
        ...conversationHistory.map((m) => ({
          role: m.role as "user" | "assistant",
          content: m.content,
        })),
        {role: "user" as const, content: data.message},
      ];

      const response = await client.messages.create({
        model: "claude-sonnet-4-6",
        max_tokens: 500,
        system: systemPrompt,
        messages,
      });

      const assistantMessage =
        response.content[0].type === "text"
          ? response.content[0].text
          : "";

      // 6. Return response
      return {
        message: assistantMessage,
        creditsRemaining,
      };
    } catch (apiError) {
      // 7. Refund credit on Claude failure
      try {
        await db.runTransaction(async (tx) => {
          const userDoc = await tx.get(userRef);
          const currentCredits =
            (userDoc.data()?.credits as number) ?? 0;
          tx.update(userRef, {credits: currentCredits + 1});
        });
      } catch (_refundErr) {
        // Log but don't mask the original error
        console.error("Credit refund failed:", _refundErr);
      }
      console.error("Claude API error:", apiError);
      throw new HttpsError("internal", "AI response failed.");
    }
  }
);
