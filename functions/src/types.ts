export interface ChatMessage {
  role: "user" | "assistant";
  content: string;
}

export interface PredictDorodangoRequest {
  wrbClass?: string;
  clayPct?: number;
  sandPct?: number;
  siltPct?: number;
}

export interface PredictDorodangoResponse {
  prediction: string;
  creditsRemaining: number;
}


export interface SendMessageRequest {
  message: string;
  buildId: string;
  conversationHistory: ChatMessage[];
  languageCode?: string;
}

export interface SendMessageResponse {
  message: string;
  creditsRemaining: number;
}

export interface GetCreditsResponse {
  credits: number;
}

export interface BuildData {
  startedAt: FirebaseFirestore.Timestamp;
  status: string;
  soilSource?: string;
}

export interface StageData {
  stage: string;
  enteredAt: FirebaseFirestore.Timestamp;
  durationSec?: number;
  photoUrl?: string;
  diagnosis?: string;
}

export interface DiagnosePhotoRequest {
  buildId: string;
  stageKey: string;
  photoUrl: string;
}

export interface DiagnosePhotoResponse {
  diagnosis: string;
  creditsRemaining: number;
}
