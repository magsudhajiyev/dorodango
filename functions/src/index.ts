import * as admin from "firebase-admin";
import {onCall, HttpsError} from "firebase-functions/v2/https";

admin.initializeApp();

// Re-export sendMessage
export {sendMessage} from "./sendMessage";

// Re-export diagnosePhoto
export {diagnosePhoto} from "./diagnosePhoto";

// getCredits callable
export const getCredits = onCall(
  {region: "us-east4"},
  async (request) => {
    if (!request.auth) {
      throw new HttpsError("unauthenticated", "Must be signed in.");
    }
    const uid = request.auth.uid;
    const doc = await admin
      .firestore()
      .collection("users")
      .doc(uid)
      .get();
    const credits = (doc.data()?.credits as number) ?? 0;
    return {credits};
  }
);
