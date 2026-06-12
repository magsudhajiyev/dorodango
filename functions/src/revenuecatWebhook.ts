import {onRequest} from "firebase-functions/v2/https";
import {defineSecret} from "firebase-functions/params";
import * as admin from "firebase-admin";

const webhookSecret = defineSecret("REVENUECAT_WEBHOOK_SECRET");

/** Store product id -> credits granted. Must match the client paywall. */
const CREDIT_PRODUCTS: Record<string, number> = {
  "credits_25": 25,
  "credits_100": 100,
  "credits_300": 300,
};

/** Event types that represent a completed consumable purchase. */
const PURCHASE_EVENTS = new Set([
  "NON_RENEWING_PURCHASE",
  "INITIAL_PURCHASE",
]);

/**
 * RevenueCat webhook: the ONLY path that grants purchased credits.
 * Configure the same secret as the Authorization header value in the
 * RevenueCat dashboard (Webhooks -> Authorization header).
 *
 * Idempotent per event id, so RevenueCat retries are safe.
 */
export const revenuecatWebhook = onRequest(
  {
    region: "us-east4",
    secrets: [webhookSecret],
  },
  async (req, res) => {
    if (req.method !== "POST") {
      res.status(405).send("Method not allowed");
      return;
    }

    const auth = req.get("Authorization") ?? "";
    const expected = webhookSecret.value().trim();
    if (!expected || auth !== `Bearer ${expected}`) {
      console.warn("Webhook rejected: bad authorization header.");
      res.status(401).send("Unauthorized");
      return;
    }

    const event = req.body?.event;
    if (!event || typeof event !== "object") {
      res.status(400).send("Missing event");
      return;
    }

    const eventType = event.type as string;
    if (!PURCHASE_EVENTS.has(eventType)) {
      // Renewals, cancellations etc. — nothing to grant (yet).
      res.status(200).send("Ignored");
      return;
    }

    const uid = event.app_user_id as string | undefined;
    // Strip any platform prefix RevenueCat may include (e.g. "play:credits_100").
    const rawProductId = (event.product_id as string | undefined) ?? "";
    const productId = rawProductId.includes(":") ?
      rawProductId.split(":").pop() ?? rawProductId :
      rawProductId;
    const eventId = event.id as string | undefined;
    const credits = CREDIT_PRODUCTS[productId];

    if (!uid || !eventId) {
      res.status(400).send("Missing app_user_id or event id");
      return;
    }
    if (credits === undefined) {
      console.warn(`Unknown product: ${rawProductId}`);
      res.status(200).send("Unknown product, ignored");
      return;
    }

    const db = admin.firestore();
    const userRef = db.collection("users").doc(uid);
    const receiptRef = userRef.collection("purchases").doc(eventId);

    try {
      await db.runTransaction(async (tx) => {
        const receipt = await tx.get(receiptRef);
        if (receipt.exists) {
          // Retry of an already-granted event.
          return;
        }
        const userDoc = await tx.get(userRef);
        const current = (userDoc.data()?.credits as number) ?? 0;
        tx.set(userRef, {credits: current + credits}, {merge: true});
        tx.set(receiptRef, {
          productId,
          credits,
          eventType,
          grantedAt: admin.firestore.FieldValue.serverTimestamp(),
        });
      });
      console.log(`Granted ${credits} credits to ${uid} (${eventId}).`);
      res.status(200).send("OK");
    } catch (e) {
      console.error("Grant failed:", e);
      // Non-2xx makes RevenueCat retry — safe thanks to idempotency.
      res.status(500).send("Grant failed");
    }
  }
);
