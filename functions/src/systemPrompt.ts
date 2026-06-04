import {BuildData, StageData} from "./types";

const STAGE_KNOWLEDGE: Record<string, {
  name: string;
  goal: string;
  steps: string[];
  tips: string;
  commonMistake: string;
  suggestedDuration: string;
}> = {
  core_forming: {
    name: "Core Forming",
    goal: "Create a solid, round core from moist soil.",
    steps: [
      "Grab a handful of moist soil and squeeze it into a rough ball.",
      "Press and rotate, squeezing out excess moisture.",
      "Gently tap the surface to close cracks and smooth bumps.",
      "Keep rotating and pressing until the ball holds its shape without crumbling.",
      "Aim for a sphere slightly larger than a golf ball.",
    ],
    tips: "If the soil crumbles, add a tiny bit of water. If it's too sticky, let it air-dry for a minute before continuing.",
    commonMistake: "Using soil that is too wet — the core won't hold its shape and will crack during drying.",
    suggestedDuration: "20 minutes",
  },
  drying: {
    name: "Drying",
    goal: "Slowly dry the core so it firms up without cracking.",
    steps: [
      "Place the ball on a soft cloth in a cool, shaded spot.",
      "Every 20-30 minutes, pick it up and gently rotate it in your hands.",
      "If you see small cracks, lightly press them closed with your thumb.",
      "The surface should feel leather-hard, not bone-dry.",
      "Total drying time is usually 2-4 hours depending on humidity.",
    ],
    tips: "Avoid direct sunlight or heat — slow drying prevents cracks. A plastic bag can slow things down if it's drying too fast.",
    commonMistake: "Drying too fast (direct sun or heater) — causes deep cracks that are impossible to fix later.",
    suggestedDuration: "3 hours",
  },
  dusting_capping: {
    name: "Dusting & Capping",
    goal: "Apply fine dust layers to fill pores and create a smooth, polishable surface.",
    steps: [
      "Sift your soil through a fine mesh to get ultra-fine dust.",
      "Sprinkle a thin layer of dust onto the ball's surface.",
      "Gently rub the dust in with your palm using light, circular motions.",
      "Repeat dusting and rubbing 10-20 times, letting it rest briefly between rounds.",
      "The surface should look uniform and feel silky-smooth, with no visible pores.",
    ],
    tips: "Less is more — thin dust layers bond better than thick ones. If dust isn't sticking, the surface may be too dry; breathe on it gently to add moisture.",
    commonMistake: "Applying dust too thickly — it flakes off instead of bonding, leaving an uneven surface.",
    suggestedDuration: "2 hours",
  },
  polishing: {
    name: "Polishing",
    goal: "Burnish the capped surface to a glossy shine.",
    steps: [
      "Use a soft cloth or the inside of a plastic bag.",
      "Press firmly and rub in small circles across the entire surface.",
      "Rotate the ball frequently to polish evenly.",
      "Continue for 30-45 minutes — the shine develops gradually.",
      "The surface should reflect light when held at an angle.",
    ],
    tips: "Patience is key — the shine comes from compressing the dust particles, not from rubbing faster. Consistent, firm pressure works better than speed.",
    commonMistake: "Rubbing too hard in one spot — creates shiny patches surrounded by dull areas instead of an even finish.",
    suggestedDuration: "45 minutes",
  },
  finished: {
    name: "Finished",
    goal: "Your dorodango is complete! Admire and preserve your work.",
    steps: [
      "Display your dorodango on a soft surface away from direct sunlight.",
      "Handle with clean, dry hands to preserve the shine.",
      "You can continue polishing over days and weeks for an even deeper shine.",
      "Take a photo to capture the final result!",
    ],
    tips: "The shine can continue to improve with occasional gentle polishing over weeks.",
    commonMistake: "Dropping or bumping the finished sphere — the polished surface is thin and chips easily.",
    suggestedDuration: "",
  },
};

function formatDuration(seconds: number): string {
  const hours = Math.floor(seconds / 3600);
  const minutes = Math.floor((seconds % 3600) / 60);
  if (hours > 0 && minutes > 0) return `${hours}h ${minutes}m`;
  if (hours > 0) return `${hours}h`;
  return `${minutes}m`;
}

export function buildSystemPrompt(
  build: BuildData,
  stages: StageData[],
  currentStage: string
): string {
  const soilSource = build.soilSource ?? "unknown";

  // Build stage history summary
  const stageHistory = stages
    .map((s) => {
      const info = STAGE_KNOWLEDGE[s.stage];
      const name = info?.name ?? s.stage;
      const duration = s.durationSec
        ? ` (${formatDuration(s.durationSec)})`
        : " (in progress)";
      return `- ${name}${duration}`;
    })
    .join("\n");

  // Current stage info
  const currentInfo = STAGE_KNOWLEDGE[currentStage];
  const currentStageName = currentInfo?.name ?? currentStage;

  // Full knowledge block
  const knowledgeBlock = Object.entries(STAGE_KNOWLEDGE)
    .map(([, info]) => {
      return [
        `## ${info.name}`,
        `Goal: ${info.goal}`,
        `Steps:\n${info.steps.map((s, i) => `  ${i + 1}. ${s}`).join("\n")}`,
        `Tip: ${info.tips}`,
        `Common mistake: ${info.commonMistake}`,
        info.suggestedDuration
          ? `Suggested duration: ${info.suggestedDuration}`
          : "",
      ]
        .filter(Boolean)
        .join("\n");
    })
    .join("\n\n");

  return `You are a master dorodango coach — an expert in the Japanese art of hikaru dorodango (polishing earth into mirror-like spheres). You are patient, encouraging, and deeply knowledgeable.

RESPONSE STYLE:
- Keep responses to 2-3 sentences. This is a voice interface — the user will hear your response spoken aloud.
- Be warm but concise. No bullet points or formatting — just natural speech.
- Ask a clarifying question when the user's issue is ambiguous.

THE USER'S BUILD:
- Soil source: ${soilSource}
- Current stage: ${currentStageName}
- Stage history:
${stageHistory}

DORODANGO KNOWLEDGE:
${knowledgeBlock}

RULES:
- Never tell the user to skip a stage or jump ahead.
- Stay on the topic of dorodango. If asked about unrelated things, gently redirect.
- If the user seems stuck or frustrated, offer encouragement and a specific next action.
- Refer to what you know about their build (soil source, time spent, current stage) to personalize advice.`;
}
