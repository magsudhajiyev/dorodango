import * as admin from "firebase-admin";
import {onCall, HttpsError} from "firebase-functions/v2/https";

admin.initializeApp();

// Re-export sendMessage
export {sendMessage} from "./sendMessage";

// Re-export diagnosePhoto
export {diagnosePhoto} from "./diagnosePhoto";

// Re-export predictDorodango
export {predictDorodango} from "./predictDorodango";

// Re-export notifyNearbyHunters
export {notifyNearbyHunters} from "./notifyNearbyHunters";

// Re-export revenuecatWebhook
export {revenuecatWebhook} from "./revenuecatWebhook";

// Re-export onUserCreated
export {onUserCreated} from "./onUserCreated";

// getCredits callable — self-healing: accounts that never received their
// signup bonus (e.g. created while a rules bug denied the client seed)
// get it granted here.
export const getCredits = onCall(
  {region: "us-east4"},
  async (request) => {
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Must be signed in.");
    }
    const uid = request.auth.uid;
    const userRef = admin.firestore().collection("users").doc(uid);
    const doc = await userRef.get();
    if (!doc.exists) {
      await userRef.set({
        credits: 10,
        createdAt: admin.firestore.FieldValue.serverTimestamp(),
      });
      return {credits: 10};
    }
    const credits = (doc.data()?.credits as number) ?? 0;
    return {credits};
  }
);
