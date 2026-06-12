import * as functionsV1 from "firebase-functions/v1";
import * as admin from "firebase-admin";

const SIGNUP_CREDITS = 10;

/**
 * Server-side guarantee that every new account starts with the free
 * AI-coach credits, regardless of what the client does. Idempotent with
 * the client-side seeding: whoever runs first wins, the other is a no-op.
 */
export const onUserCreated = functionsV1
  .region("us-east4")
  .auth.user()
  .onCreate(async (user) => {
    const db = admin.firestore();
    const userRef = db.collection("users").doc(user.uid);
    await db.runTransaction(async (tx) => {
      const doc = await tx.get(userRef);
      if (doc.exists) return;
      tx.set(userRef, {
        credits: SIGNUP_CREDITS,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
        ...(user.email ? {email: user.email} : {}),
      });
    });
    console.log(`Seeded ${SIGNUP_CREDITS} credits for new user ${user.uid}.`);
  });
