import {onDocumentCreated} from "firebase-functions/v2/firestore";
import * as admin from "firebase-admin";
import {geohashEncode, geohashCoverage, distanceKm} from "./geohash";

const NOTIFY_RADIUS_KM = 5;
// Precision-5 cells (~4.9 km) + neighbors cover the notify radius.
const QUERY_PRECISION = 5;

/**
 * When a dorodango is planted, push a notification to every user whose
 * last known location is within NOTIFY_RADIUS_KM (except the planter).
 */
export const notifyNearbyHunters = onDocumentCreated(
  {
    region: "us-east4",
    document: "plants/{plantId}",
  },
  async (event) => {
    const plant = event.data?.data();
    if (!plant) return;

    const ownerUid = plant.ownerUid as string;
    const lat = plant.latitude as number;
    const lng = plant.longitude as number;
    if (typeof lat !== "number" || typeof lng !== "number") return;

    const db = admin.firestore();
    const centerCell = geohashEncode(lat, lng, QUERY_PRECISION);
    const cells = geohashCoverage(centerCell);

    const snapshots = await Promise.all(
      cells.map((cell) =>
        db
          .collection("users")
          .where("lastGeohash", ">=", cell)
          .where("lastGeohash", "<", cell + "~")
          .get()
      )
    );

    const tokens: string[] = [];
    const seen = new Set<string>();
    for (const snapshot of snapshots) {
      for (const doc of snapshot.docs) {
        if (seen.has(doc.id) || doc.id === ownerUid) continue;
        seen.add(doc.id);
        const data = doc.data();
        const token = data.fcmToken as string | undefined;
        const userLat = data.lastLat as number | undefined;
        const userLng = data.lastLng as number | undefined;
        if (!token || userLat === undefined || userLng === undefined) continue;
        if (distanceKm(lat, lng, userLat, userLng) <= NOTIFY_RADIUS_KM) {
          tokens.push(token);
        }
      }
    }

    if (tokens.length === 0) {
      console.log("No nearby hunters to notify.");
      return;
    }

    const response = await admin.messaging().sendEachForMulticast({
      tokens,
      notification: {
        title: "A dorodango was planted near you!",
        body: plant.hint ?
          `Hint: ${plant.hint}` :
          "Open the hunt map and go find it.",
      },
      data: {
        type: "plant",
        plantId: event.params.plantId,
      },
    });
    console.log(
      `Notified ${response.successCount}/${tokens.length} nearby hunters.`
    );

    // Prune tokens that are no longer valid.
    const staleTokens: string[] = [];
    response.responses.forEach((res, i) => {
      if (
        res.error?.code === "messaging/registration-token-not-registered"
      ) {
        staleTokens.push(tokens[i]);
      }
    });
    if (staleTokens.length > 0) {
      const staleDocs = await db
        .collection("users")
        .where("fcmToken", "in", staleTokens.slice(0, 10))
        .get();
      await Promise.all(
        staleDocs.docs.map((doc) =>
          doc.ref.update({fcmToken: admin.firestore.FieldValue.delete()})
        )
      );
    }
  }
);
