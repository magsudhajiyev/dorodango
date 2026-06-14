# Wake-word models ("Hey Doro")

This directory holds the Picovoice Porcupine keyword files that power the
"Hey Doro" wake word. They are **not** committed — each developer adds them.

## One-time setup

1. Create a free account at https://console.picovoice.ai
2. Copy your **AccessKey** from the console.
3. Console → **Porcupine** → train a wake word with the phrase **"Hey Doro"**.
   - Pick platform **Android**, download the `.ppn`, rename it to
     `hey_doro_android.ppn`, and place it in this folder.
   - (Optional, for iOS) repeat with platform **iOS** → `hey_doro_ios.ppn`.
4. Run the app with the key:

   ```
   flutter run --dart-define=PICOVOICE_ACCESS_KEY=YOUR_ACCESS_KEY
   ```

Without the key or model the app still runs — the "Hey Doro" toggle simply
reports that it needs setup, and tapping the orb to talk continues to work.
