const observationFocus: Record<string, string> = {
  core_forming:
    "Shape roundness, surface cracks, moisture level, size relative to hand.",
  drying:
    "Crack presence and severity, surface texture (leather-hard vs bone-dry), color uniformity.",
  dusting_capping:
    "Pore visibility, dust layer uniformity, surface smoothness, flaking.",
  polishing:
    "Shine presence, evenness of shine, remaining dull patches, surface scratches.",
  finished:
    "Overall reflection quality, symmetry, surface uniformity.",
};

export function buildObservationPrompt(stageKey: string): string {
  const focus = observationFocus[stageKey] ?? observationFocus["core_forming"];
  return `You are analyzing a photo of a hikaru dorodango (polished earth sphere) during the "${stageKey}" stage.

Objectively describe what you observe in the image. No advice, no judgement — only factual visual observations.

Focus areas for this stage: ${focus}

Provide 3-5 sentences of structured observation. Describe shape, surface texture, moisture appearance, and any visible defects.`;
}

const diagnosisRubric: Record<string, string> = {
  core_forming:
    "Common issues: too wet (glossy/sticky surface), too dry (crumbling), irregular shape, too small or too large, deep cracks.",
  drying:
    "Common issues: surface cracking, drying too fast (many fine cracks), not firm enough (still deforms), uneven drying (one side darker).",
  dusting_capping:
    "Common issues: dust layer too thick or flaking off, pores still visible, uneven dust coverage, surface not smooth enough.",
  polishing:
    "Common issues: uneven shine, visible scratches, persistent dull patches, over-polishing one area while neglecting others.",
  finished:
    "This is the completed stage. Celebrate the achievement. Note any final imperfections worth knowing about, but keep the tone positive.",
};

export function buildDiagnosisPrompt(
  stageKey: string,
  observation: string
): string {
  const rubric = diagnosisRubric[stageKey] ?? diagnosisRubric["core_forming"];
  return `You are a hikaru dorodango coach diagnosing a sphere at the "${stageKey}" stage.

Here is the objective observation of the photo:
"${observation}"

Stage-specific failure rubric: ${rubric}

Instructions:
1. Identify the top 1-2 issues, or confirm good progress if none.
2. Assign a confidence level: "high", "medium", or "low".
3. If confidence is "low", respond ONLY with: "Photo unclear — try again with better lighting."
4. For each issue, provide one concrete recovery action.

Output format: plain text, 2-4 sentences. Use a recovery-first, encouraging tone. Do not use bullet points or markdown (this will be read aloud). Start with the most important finding.`;
}
