/**
 * Minimal geohash implementation, mirroring lib/core/utils/geohash.dart.
 */

const BASE32 = "0123456789bcdefghjkmnpqrstuvwxyz";

export function geohashEncode(
  latitude: number,
  longitude: number,
  precision = 9
): string {
  let latLo = -90, latHi = 90, lonLo = -180, lonHi = 180;
  let hash = "";
  let isEven = true;
  let bit = 0;
  let ch = 0;

  while (hash.length < precision) {
    if (isEven) {
      const mid = (lonLo + lonHi) / 2;
      if (longitude >= mid) {
        ch = (ch << 1) + 1;
        lonLo = mid;
      } else {
        ch = ch << 1;
        lonHi = mid;
      }
    } else {
      const mid = (latLo + latHi) / 2;
      if (latitude >= mid) {
        ch = (ch << 1) + 1;
        latLo = mid;
      } else {
        ch = ch << 1;
        latHi = mid;
      }
    }
    isEven = !isEven;
    if (++bit === 5) {
      hash += BASE32[ch];
      bit = 0;
      ch = 0;
    }
  }
  return hash;
}

function bounds(geohash: string): {
  latLo: number; latHi: number; lonLo: number; lonHi: number;
} {
  let latLo = -90, latHi = 90, lonLo = -180, lonHi = 180;
  let isEven = true;

  for (const char of geohash) {
    const cd = BASE32.indexOf(char);
    for (let mask = 16; mask > 0; mask >>= 1) {
      if (isEven) {
        const mid = (lonLo + lonHi) / 2;
        if (cd & mask) lonLo = mid;
        else lonHi = mid;
      } else {
        const mid = (latLo + latHi) / 2;
        if (cd & mask) latLo = mid;
        else latHi = mid;
      }
      isEven = !isEven;
    }
  }
  return {latLo, latHi, lonLo, lonHi};
}

/** The cell itself plus its 8 neighbors, at the same precision. */
export function geohashCoverage(geohash: string): string[] {
  const b = bounds(geohash);
  const latCenter = (b.latLo + b.latHi) / 2;
  const lonCenter = (b.lonLo + b.lonHi) / 2;
  const dLat = b.latHi - b.latLo;
  const dLon = b.lonHi - b.lonLo;

  const cells = new Set<string>();
  for (let dy = -1; dy <= 1; dy++) {
    for (let dx = -1; dx <= 1; dx++) {
      const lat = Math.max(-89.999999,
        Math.min(89.999999, latCenter + dy * dLat));
      let lon = lonCenter + dx * dLon;
      lon = ((lon + 180) % 360 + 360) % 360 - 180;
      cells.add(geohashEncode(lat, lon, geohash.length));
    }
  }
  return [...cells];
}

/** Haversine distance in kilometers. */
export function distanceKm(
  lat1: number, lon1: number, lat2: number, lon2: number
): number {
  const toRad = (deg: number) => (deg * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return 6371 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}
