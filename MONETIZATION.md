# Dorodango — Monetization Plan

## Principles

1. **Never gate the craft.** The guided build, drying timer, build log,
   reflections, basic voice commands, soil map, and the entire hunt loop stay
   free. The hunt is the growth engine — paywalling it would kill the network
   effect that makes everything else more valuable.
2. **Charge where our costs are variable.** Every AI interaction (voice coach
   turn, photo diagnosis, dorodango prediction) costs us real inference money.
   Credits align revenue with cost 1:1.
3. **Monetize identity, not advantage.** Like Pokémon GO, the social layer
   sells cosmetics and convenience — never the ability to play.

## The three revenue streams

### 1. Credit packs (consumable IAP) — ship first
The existing credit system already meters all AI features (1 credit per
interaction, 10 free on signup). Sell refills:

| Pack | Price | Per credit |
|---|---|---|
| Handful — 25 credits | $1.99 | $0.080 |
| Pouch — 100 credits | $5.99 | $0.060 |
| Crate — 300 credits | $12.99 | $0.043 |

Paywall placement (highest-intent moments):
- The out-of-credits voice fallback ("Out of credits. Switching to basic commands.")
- The AI prediction button when balance is 0
- The credit badge on the stage screen

### 2. "Dorodango+" membership (subscription) — ship second
**$3.99/month or $24.99/year.** Perks:
- 100 credits granted monthly (auto, scheduled function)
- Hands-free voice coach without per-turn credit anxiety (fair-use cap, e.g.
  300 turns/mo, enforced server-side)
- Hunt perks: custom ball finishes on planted dorodangos, larger notification
  radius (10 km), collection badges & streaks
- Early access to new features

Why a sub on top of credits: credits monetize bursts; the subscription
captures the habitual builder and smooths revenue. The monthly credit grant
makes the math obviously favorable vs. packs for anyone building weekly.

### 3. Cosmetic finishes (one-time IAPs) — ship third
The Collection page and hunt markers make appearance valuable. Sell ball
finishes (lacquer tints, mineral flecks, seasonal glazes) at $0.99–$2.99,
applied to planted dorodangos and collection trophies. Near-zero COGS,
strong fit with the collectible loop, and visible to other players — the
classic social-game flywheel.

## Implementation (RevenueCat)

**Phase 1 — credit packs (~1 week)**
1. `purchases_flutter` SDK; products configured in App Store / Play Console
   and mapped in RevenueCat.
2. RevenueCat webhook → new Cloud Function `grantPurchase`: validates the
   event signature, credits the user document atomically (same transaction
   pattern as deduction), idempotent on event id. Never grant client-side.
3. Paywall sheet (credits balance, three packs, restore purchases) +
   placements above.

**Phase 2 — subscription (~1 week)**
1. RevenueCat entitlement `plus`; mirror to `users/{uid}.plusUntil` via the
   same webhook function.
2. Scheduled function (monthly) grants the credit allowance to active subs.
3. Server checks: `sendMessage`/`diagnosePhoto`/`predictDorodango` consult the
   entitlement for fair-use metering instead of hard credit gating.

**Phase 3 — cosmetics**
1. `finish` field on plant docs + user inventory subcollection; render via a
   `tint` parameter on `DorodangoBall`.

## KPIs to watch
- Credit burn per weekly-active builder (target: free 10 exhausted within
  2–3 builds → natural conversion moment)
- Pack → sub upgrade rate; D30 sub retention
- Hunt participation rate of payers vs. non-payers (cosmetics health check)

## Explicitly rejected
- **Ads** — destroys the meditative brand; CPMs wouldn't cover AI costs.
- **Paywalling stages or the hunt** — kills retention and the growth loop.
- **Unlimited-AI tier without caps** — inference costs make it a loss leader
  that the heaviest 1% would abuse.
