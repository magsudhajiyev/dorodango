// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'The art of polishing earth';

  @override
  String get retry => 'Retry';

  @override
  String get skip => 'Skip';

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String get soilSourceHint => 'Where did you find your soil? (optional)';

  @override
  String get startNewBuild => 'Start New Build';

  @override
  String get viewBuildLog => 'View Build Log';

  @override
  String get buildLog => 'Build Log';

  @override
  String get buildDetail => 'Build Detail';

  @override
  String get noBuildsYet => 'No builds yet';

  @override
  String get startFirstDorodango => 'Start your first dorodango!';

  @override
  String get noStagesRecorded => 'No stages recorded.';

  @override
  String get unknownSoil => 'Unknown soil';

  @override
  String get statusComplete => 'Complete';

  @override
  String get statusInProgress => 'In Progress';

  @override
  String get statusAbandoned => 'Abandoned';

  @override
  String get buildCompleteTitle => 'Your Dorodango\nis Complete';

  @override
  String get buildCompleteBody =>
      'From raw earth to mirror shine.\nStore it in a cool, dry place — it will\ncontinue to harden over the coming weeks.';

  @override
  String get startAnotherBuild => 'Start Another Build';

  @override
  String get nextStage => 'Next Stage';

  @override
  String get completeBuild => 'Complete Build';

  @override
  String get tapToSpeak => 'Tap to speak';

  @override
  String get captureProgress => 'Capture your progress';

  @override
  String get captureSubtitle => 'Take a photo to save in your build log.';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromGallery => 'Choose from Gallery';

  @override
  String suggestedDuration(String duration) {
    return 'Suggested: ~$duration';
  }

  @override
  String durationHours(int hours) {
    return '${hours}h';
  }

  @override
  String durationMinutes(int minutes) {
    return '${minutes}min';
  }

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get systemDefault => 'System Default';

  @override
  String get stageCoreForming => 'Core Forming';

  @override
  String get stageDrying => 'Drying';

  @override
  String get stageDustingCapping => 'Dusting & Capping';

  @override
  String get stagePolishing => 'Polishing';

  @override
  String get stageFinished => 'Finished';

  @override
  String get coreFormingSummary =>
      'Gather soil and compress it into a tight sphere.';

  @override
  String get coreFormingStep1 =>
      'Find soil with a mix of clay and fine sand — avoid pure clay or sandy soil.';

  @override
  String get coreFormingStep2 =>
      'Add water gradually until the soil holds together when squeezed.';

  @override
  String get coreFormingStep3 =>
      'Form a rough ball about the size of a tennis ball.';

  @override
  String get coreFormingStep4 =>
      'Squeeze and compact firmly, rotating constantly to keep it round.';

  @override
  String get coreFormingStep5 =>
      'Continue compressing for 15–20 minutes until the core feels solid.';

  @override
  String get coreFormingTip =>
      'The core should feel dense and heavy for its size. If it crumbles, add a tiny bit more water.';

  @override
  String get coreFormingMistake =>
      'Too much water makes the core sticky and hard to shape. Start drier than you think.';

  @override
  String get coreFormingVoice =>
      'Time to form your core. Find soil with a good mix of clay and fine sand. Add water gradually and squeeze it into a tight ball, about tennis ball sized. Keep rotating and compressing for fifteen to twenty minutes until it feels solid and dense.';

  @override
  String get dryingSummary =>
      'Let moisture migrate to the surface while maintaining shape.';

  @override
  String get dryingStep1 =>
      'Place the sphere on a soft surface or hold it gently.';

  @override
  String get dryingStep2 =>
      'Wait 20–30 minutes for moisture to migrate to the surface.';

  @override
  String get dryingStep3 =>
      'When the surface feels damp, gently brush off any loose material.';

  @override
  String get dryingStep4 =>
      'Repeat the drying cycle — this stage may take several hours.';

  @override
  String get dryingStep5 =>
      'The sphere is ready for dusting when the surface no longer feels wet.';

  @override
  String get dryingTip =>
      'Patience is everything here. Rushing to the next stage will cause cracks.';

  @override
  String get dryingMistake =>
      'Letting it dry too fast in direct sun causes surface cracks. Dry slowly in shade.';

  @override
  String get dryingVoice =>
      'Now we dry. Place your sphere down gently and wait twenty to thirty minutes for moisture to reach the surface. When it feels damp, brush off loose material. Repeat this cycle. The sphere is ready for dusting when the surface no longer feels wet. This takes patience — usually several hours.';

  @override
  String get dustingCappingSummary =>
      'Apply layers of fine dry soil to build a smooth outer shell.';

  @override
  String get dustingCappingStep1 =>
      'Sift soil through a fine mesh to get ultra-fine dry powder.';

  @override
  String get dustingCappingStep2 =>
      'Sprinkle a thin layer of powder over the sphere.';

  @override
  String get dustingCappingStep3 =>
      'Gently rub the powder into the surface using your palm or thumb.';

  @override
  String get dustingCappingStep4 =>
      'Let it rest for 10–15 minutes between coats.';

  @override
  String get dustingCappingStep5 =>
      'Apply 5–10 coats until the surface is uniformly smooth.';

  @override
  String get dustingCappingTip =>
      'The finer the dust, the better the final shine. Use the finest particles you can find.';

  @override
  String get dustingCappingMistake =>
      'Applying dust too thick causes flaking. Thin, even layers are the key.';

  @override
  String get dustingCappingVoice =>
      'Time to dust and cap. Sift your soil to get the finest powder possible. Sprinkle a thin layer over the sphere and gently rub it in with your palm. Rest ten to fifteen minutes between coats. Apply five to ten coats until the surface is uniformly smooth.';

  @override
  String get polishingSummary =>
      'Burnish the surface to bring out a natural shine.';

  @override
  String get polishingStep1 =>
      'Make sure the surface is completely dry to the touch.';

  @override
  String get polishingStep2 =>
      'Using a smooth surface (plastic bag, glass jar, or soft cloth), gently rub the sphere.';

  @override
  String get polishingStep3 =>
      'Apply light, consistent pressure in circular motions.';

  @override
  String get polishingStep4 =>
      'Work the entire surface, rotating frequently for even shine.';

  @override
  String get polishingStep5 =>
      'Continue for 30–60 minutes. The shine develops gradually.';

  @override
  String get polishingTip =>
      'Less pressure is more. Let the tool glide — forcing it can gouge the surface.';

  @override
  String get polishingMistake =>
      'Polishing before fully dry embeds moisture and causes dull spots.';

  @override
  String get polishingVoice =>
      'Time to polish. Make sure the surface is completely dry. Using a smooth surface like a plastic bag or glass jar, gently rub the sphere in circular motions. Keep the pressure light and consistent. Work the entire surface for thirty to sixty minutes. The shine will develop gradually.';

  @override
  String get finishedSummary => 'Your dorodango is complete. Admire your work!';

  @override
  String get finishedStep1 => 'Take a final photo of your finished sphere.';

  @override
  String get finishedStep2 =>
      'Store it in a cool, dry place away from direct sunlight.';

  @override
  String get finishedStep3 =>
      'The sphere will continue to harden over the coming weeks.';

  @override
  String get finishedStep4 =>
      'Handle with care — the polished surface can be fragile.';

  @override
  String get finishedTip =>
      'Display it on a soft surface. Some makers create wooden stands.';

  @override
  String get finishedMistake =>
      'Dropping it! Handle gently. The polished shell is thin.';

  @override
  String get finishedVoice =>
      'Congratulations! Your dorodango is complete. Take a final photo and store it in a cool, dry place. It will continue to harden over the coming weeks. Handle with care and enjoy your creation.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'You are on stage $order of 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Drying typically takes two to four hours. Be patient and check every twenty to thirty minutes.';

  @override
  String get dryingTimeNotOnStage =>
      'You are not currently on the drying stage. The drying stage comes after core forming.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Common mistake at this stage: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Photo diagnosis will be available in a future update. For now, check the common mistakes listed for your current stage.';

  @override
  String get alreadyComplete => 'Your dorodango is already complete!';

  @override
  String get voiceUnknownCommand =>
      'I didn\'t understand that. Try saying next, repeat, help, or what went wrong.';

  @override
  String get continueBuild => 'Continue Build';

  @override
  String stageProgress(int order, String stageName) {
    return 'Stage $order/5 — $stageName';
  }

  @override
  String get reflections => 'Reflections';

  @override
  String get readMore => 'Read more';

  @override
  String get listenLabel => 'Listen';

  @override
  String get sourcePrefix => 'Source: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes min read';
  }

  @override
  String get analyzingPhoto => 'Analyzing your photo...';

  @override
  String get diagnosisError => 'Could not analyze photo. Tap to retry.';

  @override
  String get photoUnclear => 'Photo unclear';

  @override
  String get detectSoil => 'Detect soil from my location';

  @override
  String get soilDetecting => 'Reading your local soil…';

  @override
  String get soilTypeLabel => 'Local soil type';

  @override
  String get soilClay => 'Clay';

  @override
  String get soilSand => 'Sand';

  @override
  String get soilSilt => 'Silt';

  @override
  String get soilSuitabilityGood =>
      'Rich in clay — it should hold together and take a fine shine.';

  @override
  String get soilSuitabilityOkay =>
      'Moderate clay — sieve it fine and compress firmly.';

  @override
  String get soilSuitabilitySandy =>
      'Sandy — it may crumble. Mix in clay-rich soil if you can.';

  @override
  String get soilLocationDenied =>
      'Location unavailable. Allow location access to detect your soil.';

  @override
  String get soilLookupFailed => 'Couldn\'t read soil data for this location.';
}
