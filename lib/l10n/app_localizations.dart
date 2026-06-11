import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_it.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('az'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('it'),
    Locale('ja'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dorodango'**
  String get appTitle;

  /// No description provided for @appSubtitle.
  ///
  /// In en, this message translates to:
  /// **'The art of polishing earth'**
  String get appSubtitle;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(String message);

  /// No description provided for @soilSourceHint.
  ///
  /// In en, this message translates to:
  /// **'Where did you find your soil? (optional)'**
  String get soilSourceHint;

  /// No description provided for @startNewBuild.
  ///
  /// In en, this message translates to:
  /// **'Start New Build'**
  String get startNewBuild;

  /// No description provided for @viewBuildLog.
  ///
  /// In en, this message translates to:
  /// **'View Build Log'**
  String get viewBuildLog;

  /// No description provided for @buildLog.
  ///
  /// In en, this message translates to:
  /// **'Build Log'**
  String get buildLog;

  /// No description provided for @buildDetail.
  ///
  /// In en, this message translates to:
  /// **'Build Detail'**
  String get buildDetail;

  /// No description provided for @noBuildsYet.
  ///
  /// In en, this message translates to:
  /// **'No builds yet'**
  String get noBuildsYet;

  /// No description provided for @startFirstDorodango.
  ///
  /// In en, this message translates to:
  /// **'Start your first dorodango!'**
  String get startFirstDorodango;

  /// No description provided for @noStagesRecorded.
  ///
  /// In en, this message translates to:
  /// **'No stages recorded.'**
  String get noStagesRecorded;

  /// No description provided for @unknownSoil.
  ///
  /// In en, this message translates to:
  /// **'Unknown soil'**
  String get unknownSoil;

  /// No description provided for @statusComplete.
  ///
  /// In en, this message translates to:
  /// **'Complete'**
  String get statusComplete;

  /// No description provided for @statusInProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get statusInProgress;

  /// No description provided for @statusAbandoned.
  ///
  /// In en, this message translates to:
  /// **'Abandoned'**
  String get statusAbandoned;

  /// No description provided for @buildCompleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Dorodango\nis Complete'**
  String get buildCompleteTitle;

  /// No description provided for @buildCompleteBody.
  ///
  /// In en, this message translates to:
  /// **'From raw earth to mirror shine.\nStore it in a cool, dry place — it will\ncontinue to harden over the coming weeks.'**
  String get buildCompleteBody;

  /// No description provided for @startAnotherBuild.
  ///
  /// In en, this message translates to:
  /// **'Start Another Build'**
  String get startAnotherBuild;

  /// No description provided for @nextStage.
  ///
  /// In en, this message translates to:
  /// **'Next Stage'**
  String get nextStage;

  /// No description provided for @completeBuild.
  ///
  /// In en, this message translates to:
  /// **'Complete Build'**
  String get completeBuild;

  /// No description provided for @tapToSpeak.
  ///
  /// In en, this message translates to:
  /// **'Tap to speak'**
  String get tapToSpeak;

  /// No description provided for @captureProgress.
  ///
  /// In en, this message translates to:
  /// **'Capture your progress'**
  String get captureProgress;

  /// No description provided for @captureSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Take a photo to save in your build log.'**
  String get captureSubtitle;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @chooseFromGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from Gallery'**
  String get chooseFromGallery;

  /// No description provided for @suggestedDuration.
  ///
  /// In en, this message translates to:
  /// **'Suggested: ~{duration}'**
  String suggestedDuration(String duration);

  /// No description provided for @durationHours.
  ///
  /// In en, this message translates to:
  /// **'{hours}h'**
  String durationHours(int hours);

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{minutes}min'**
  String durationMinutes(int minutes);

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @systemDefault.
  ///
  /// In en, this message translates to:
  /// **'System Default'**
  String get systemDefault;

  /// No description provided for @stageCoreForming.
  ///
  /// In en, this message translates to:
  /// **'Core Forming'**
  String get stageCoreForming;

  /// No description provided for @stageDrying.
  ///
  /// In en, this message translates to:
  /// **'Drying'**
  String get stageDrying;

  /// No description provided for @stageDustingCapping.
  ///
  /// In en, this message translates to:
  /// **'Dusting & Capping'**
  String get stageDustingCapping;

  /// No description provided for @stagePolishing.
  ///
  /// In en, this message translates to:
  /// **'Polishing'**
  String get stagePolishing;

  /// No description provided for @stageFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished'**
  String get stageFinished;

  /// No description provided for @coreFormingSummary.
  ///
  /// In en, this message translates to:
  /// **'Gather soil and compress it into a tight sphere.'**
  String get coreFormingSummary;

  /// No description provided for @coreFormingStep1.
  ///
  /// In en, this message translates to:
  /// **'Find soil with a mix of clay and fine sand — avoid pure clay or sandy soil.'**
  String get coreFormingStep1;

  /// No description provided for @coreFormingStep2.
  ///
  /// In en, this message translates to:
  /// **'Add water gradually until the soil holds together when squeezed.'**
  String get coreFormingStep2;

  /// No description provided for @coreFormingStep3.
  ///
  /// In en, this message translates to:
  /// **'Form a rough ball about the size of a tennis ball.'**
  String get coreFormingStep3;

  /// No description provided for @coreFormingStep4.
  ///
  /// In en, this message translates to:
  /// **'Squeeze and compact firmly, rotating constantly to keep it round.'**
  String get coreFormingStep4;

  /// No description provided for @coreFormingStep5.
  ///
  /// In en, this message translates to:
  /// **'Continue compressing for 15–20 minutes until the core feels solid.'**
  String get coreFormingStep5;

  /// No description provided for @coreFormingTip.
  ///
  /// In en, this message translates to:
  /// **'The core should feel dense and heavy for its size. If it crumbles, add a tiny bit more water.'**
  String get coreFormingTip;

  /// No description provided for @coreFormingMistake.
  ///
  /// In en, this message translates to:
  /// **'Too much water makes the core sticky and hard to shape. Start drier than you think.'**
  String get coreFormingMistake;

  /// No description provided for @coreFormingVoice.
  ///
  /// In en, this message translates to:
  /// **'Time to form your core. Find soil with a good mix of clay and fine sand. Add water gradually and squeeze it into a tight ball, about tennis ball sized. Keep rotating and compressing for fifteen to twenty minutes until it feels solid and dense.'**
  String get coreFormingVoice;

  /// No description provided for @dryingSummary.
  ///
  /// In en, this message translates to:
  /// **'Let moisture migrate to the surface while maintaining shape.'**
  String get dryingSummary;

  /// No description provided for @dryingStep1.
  ///
  /// In en, this message translates to:
  /// **'Place the sphere on a soft surface or hold it gently.'**
  String get dryingStep1;

  /// No description provided for @dryingStep2.
  ///
  /// In en, this message translates to:
  /// **'Wait 20–30 minutes for moisture to migrate to the surface.'**
  String get dryingStep2;

  /// No description provided for @dryingStep3.
  ///
  /// In en, this message translates to:
  /// **'When the surface feels damp, gently brush off any loose material.'**
  String get dryingStep3;

  /// No description provided for @dryingStep4.
  ///
  /// In en, this message translates to:
  /// **'Repeat the drying cycle — this stage may take several hours.'**
  String get dryingStep4;

  /// No description provided for @dryingStep5.
  ///
  /// In en, this message translates to:
  /// **'The sphere is ready for dusting when the surface no longer feels wet.'**
  String get dryingStep5;

  /// No description provided for @dryingTip.
  ///
  /// In en, this message translates to:
  /// **'Patience is everything here. Rushing to the next stage will cause cracks.'**
  String get dryingTip;

  /// No description provided for @dryingMistake.
  ///
  /// In en, this message translates to:
  /// **'Letting it dry too fast in direct sun causes surface cracks. Dry slowly in shade.'**
  String get dryingMistake;

  /// No description provided for @dryingVoice.
  ///
  /// In en, this message translates to:
  /// **'Now we dry. Place your sphere down gently and wait twenty to thirty minutes for moisture to reach the surface. When it feels damp, brush off loose material. Repeat this cycle. The sphere is ready for dusting when the surface no longer feels wet. This takes patience — usually several hours.'**
  String get dryingVoice;

  /// No description provided for @dustingCappingSummary.
  ///
  /// In en, this message translates to:
  /// **'Apply layers of fine dry soil to build a smooth outer shell.'**
  String get dustingCappingSummary;

  /// No description provided for @dustingCappingStep1.
  ///
  /// In en, this message translates to:
  /// **'Sift soil through a fine mesh to get ultra-fine dry powder.'**
  String get dustingCappingStep1;

  /// No description provided for @dustingCappingStep2.
  ///
  /// In en, this message translates to:
  /// **'Sprinkle a thin layer of powder over the sphere.'**
  String get dustingCappingStep2;

  /// No description provided for @dustingCappingStep3.
  ///
  /// In en, this message translates to:
  /// **'Gently rub the powder into the surface using your palm or thumb.'**
  String get dustingCappingStep3;

  /// No description provided for @dustingCappingStep4.
  ///
  /// In en, this message translates to:
  /// **'Let it rest for 10–15 minutes between coats.'**
  String get dustingCappingStep4;

  /// No description provided for @dustingCappingStep5.
  ///
  /// In en, this message translates to:
  /// **'Apply 5–10 coats until the surface is uniformly smooth.'**
  String get dustingCappingStep5;

  /// No description provided for @dustingCappingTip.
  ///
  /// In en, this message translates to:
  /// **'The finer the dust, the better the final shine. Use the finest particles you can find.'**
  String get dustingCappingTip;

  /// No description provided for @dustingCappingMistake.
  ///
  /// In en, this message translates to:
  /// **'Applying dust too thick causes flaking. Thin, even layers are the key.'**
  String get dustingCappingMistake;

  /// No description provided for @dustingCappingVoice.
  ///
  /// In en, this message translates to:
  /// **'Time to dust and cap. Sift your soil to get the finest powder possible. Sprinkle a thin layer over the sphere and gently rub it in with your palm. Rest ten to fifteen minutes between coats. Apply five to ten coats until the surface is uniformly smooth.'**
  String get dustingCappingVoice;

  /// No description provided for @polishingSummary.
  ///
  /// In en, this message translates to:
  /// **'Burnish the surface to bring out a natural shine.'**
  String get polishingSummary;

  /// No description provided for @polishingStep1.
  ///
  /// In en, this message translates to:
  /// **'Make sure the surface is completely dry to the touch.'**
  String get polishingStep1;

  /// No description provided for @polishingStep2.
  ///
  /// In en, this message translates to:
  /// **'Using a smooth surface (plastic bag, glass jar, or soft cloth), gently rub the sphere.'**
  String get polishingStep2;

  /// No description provided for @polishingStep3.
  ///
  /// In en, this message translates to:
  /// **'Apply light, consistent pressure in circular motions.'**
  String get polishingStep3;

  /// No description provided for @polishingStep4.
  ///
  /// In en, this message translates to:
  /// **'Work the entire surface, rotating frequently for even shine.'**
  String get polishingStep4;

  /// No description provided for @polishingStep5.
  ///
  /// In en, this message translates to:
  /// **'Continue for 30–60 minutes. The shine develops gradually.'**
  String get polishingStep5;

  /// No description provided for @polishingTip.
  ///
  /// In en, this message translates to:
  /// **'Less pressure is more. Let the tool glide — forcing it can gouge the surface.'**
  String get polishingTip;

  /// No description provided for @polishingMistake.
  ///
  /// In en, this message translates to:
  /// **'Polishing before fully dry embeds moisture and causes dull spots.'**
  String get polishingMistake;

  /// No description provided for @polishingVoice.
  ///
  /// In en, this message translates to:
  /// **'Time to polish. Make sure the surface is completely dry. Using a smooth surface like a plastic bag or glass jar, gently rub the sphere in circular motions. Keep the pressure light and consistent. Work the entire surface for thirty to sixty minutes. The shine will develop gradually.'**
  String get polishingVoice;

  /// No description provided for @finishedSummary.
  ///
  /// In en, this message translates to:
  /// **'Your dorodango is complete. Admire your work!'**
  String get finishedSummary;

  /// No description provided for @finishedStep1.
  ///
  /// In en, this message translates to:
  /// **'Take a final photo of your finished sphere.'**
  String get finishedStep1;

  /// No description provided for @finishedStep2.
  ///
  /// In en, this message translates to:
  /// **'Store it in a cool, dry place away from direct sunlight.'**
  String get finishedStep2;

  /// No description provided for @finishedStep3.
  ///
  /// In en, this message translates to:
  /// **'The sphere will continue to harden over the coming weeks.'**
  String get finishedStep3;

  /// No description provided for @finishedStep4.
  ///
  /// In en, this message translates to:
  /// **'Handle with care — the polished surface can be fragile.'**
  String get finishedStep4;

  /// No description provided for @finishedTip.
  ///
  /// In en, this message translates to:
  /// **'Display it on a soft surface. Some makers create wooden stands.'**
  String get finishedTip;

  /// No description provided for @finishedMistake.
  ///
  /// In en, this message translates to:
  /// **'Dropping it! Handle gently. The polished shell is thin.'**
  String get finishedMistake;

  /// No description provided for @finishedVoice.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your dorodango is complete. Take a final photo and store it in a cool, dry place. It will continue to harden over the coming weeks. Handle with care and enjoy your creation.'**
  String get finishedVoice;

  /// No description provided for @helpResponse.
  ///
  /// In en, this message translates to:
  /// **'You are on stage {order} of 5: {title}. {summary}'**
  String helpResponse(int order, String title, String summary);

  /// No description provided for @dryingTimeResponse.
  ///
  /// In en, this message translates to:
  /// **'Drying typically takes two to four hours. Be patient and check every twenty to thirty minutes.'**
  String get dryingTimeResponse;

  /// No description provided for @dryingTimeNotOnStage.
  ///
  /// In en, this message translates to:
  /// **'You are not currently on the drying stage. The drying stage comes after core forming.'**
  String get dryingTimeNotOnStage;

  /// No description provided for @whatWentWrongResponse.
  ///
  /// In en, this message translates to:
  /// **'Common mistake at this stage: {mistake}'**
  String whatWentWrongResponse(String mistake);

  /// No description provided for @diagnoseStubResponse.
  ///
  /// In en, this message translates to:
  /// **'Photo diagnosis will be available in a future update. For now, check the common mistakes listed for your current stage.'**
  String get diagnoseStubResponse;

  /// No description provided for @alreadyComplete.
  ///
  /// In en, this message translates to:
  /// **'Your dorodango is already complete!'**
  String get alreadyComplete;

  /// No description provided for @voiceUnknownCommand.
  ///
  /// In en, this message translates to:
  /// **'I didn\'t understand that. Try saying next, repeat, help, or what went wrong.'**
  String get voiceUnknownCommand;

  /// No description provided for @continueBuild.
  ///
  /// In en, this message translates to:
  /// **'Continue Build'**
  String get continueBuild;

  /// No description provided for @stageProgress.
  ///
  /// In en, this message translates to:
  /// **'Stage {order}/5 — {stageName}'**
  String stageProgress(int order, String stageName);

  /// No description provided for @reflections.
  ///
  /// In en, this message translates to:
  /// **'Reflections'**
  String get reflections;

  /// No description provided for @readMore.
  ///
  /// In en, this message translates to:
  /// **'Read more'**
  String get readMore;

  /// No description provided for @listenLabel.
  ///
  /// In en, this message translates to:
  /// **'Listen'**
  String get listenLabel;

  /// No description provided for @sourcePrefix.
  ///
  /// In en, this message translates to:
  /// **'Source: '**
  String get sourcePrefix;

  /// No description provided for @estimatedReadTime.
  ///
  /// In en, this message translates to:
  /// **'~{minutes} min read'**
  String estimatedReadTime(int minutes);

  /// No description provided for @analyzingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Analyzing your photo...'**
  String get analyzingPhoto;

  /// No description provided for @diagnosisError.
  ///
  /// In en, this message translates to:
  /// **'Could not analyze photo. Tap to retry.'**
  String get diagnosisError;

  /// No description provided for @photoUnclear.
  ///
  /// In en, this message translates to:
  /// **'Photo unclear'**
  String get photoUnclear;

  /// No description provided for @detectSoil.
  ///
  /// In en, this message translates to:
  /// **'Detect soil from my location'**
  String get detectSoil;

  /// No description provided for @soilDetecting.
  ///
  /// In en, this message translates to:
  /// **'Reading your local soil…'**
  String get soilDetecting;

  /// No description provided for @soilTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'Local soil type'**
  String get soilTypeLabel;

  /// No description provided for @soilClay.
  ///
  /// In en, this message translates to:
  /// **'Clay'**
  String get soilClay;

  /// No description provided for @soilSand.
  ///
  /// In en, this message translates to:
  /// **'Sand'**
  String get soilSand;

  /// No description provided for @soilSilt.
  ///
  /// In en, this message translates to:
  /// **'Silt'**
  String get soilSilt;

  /// No description provided for @soilSuitabilityGood.
  ///
  /// In en, this message translates to:
  /// **'Rich in clay — it should hold together and take a fine shine.'**
  String get soilSuitabilityGood;

  /// No description provided for @soilSuitabilityOkay.
  ///
  /// In en, this message translates to:
  /// **'Moderate clay — sieve it fine and compress firmly.'**
  String get soilSuitabilityOkay;

  /// No description provided for @soilSuitabilitySandy.
  ///
  /// In en, this message translates to:
  /// **'Sandy — it may crumble. Mix in clay-rich soil if you can.'**
  String get soilSuitabilitySandy;

  /// No description provided for @soilLocationDenied.
  ///
  /// In en, this message translates to:
  /// **'Location unavailable. Allow location access to detect your soil.'**
  String get soilLocationDenied;

  /// No description provided for @soilLookupFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t read soil data for this location.'**
  String get soilLookupFailed;

  /// No description provided for @soilMap.
  ///
  /// In en, this message translates to:
  /// **'Soil map'**
  String get soilMap;

  /// No description provided for @soilMapHint.
  ///
  /// In en, this message translates to:
  /// **'Tap the map to inspect the soil'**
  String get soilMapHint;

  /// No description provided for @predictResult.
  ///
  /// In en, this message translates to:
  /// **'Predict my dorodango'**
  String get predictResult;

  /// No description provided for @predictingResult.
  ///
  /// In en, this message translates to:
  /// **'Consulting the AI coach…'**
  String get predictingResult;

  /// No description provided for @predictionTitle.
  ///
  /// In en, this message translates to:
  /// **'AI prediction'**
  String get predictionTitle;

  /// No description provided for @predictionFailed.
  ///
  /// In en, this message translates to:
  /// **'Prediction failed. Try again.'**
  String get predictionFailed;

  /// No description provided for @outOfCredits.
  ///
  /// In en, this message translates to:
  /// **'Out of credits.'**
  String get outOfCredits;

  /// No description provided for @hunt.
  ///
  /// In en, this message translates to:
  /// **'Dorodango Hunt'**
  String get hunt;

  /// No description provided for @plantDorodango.
  ///
  /// In en, this message translates to:
  /// **'Plant this dorodango'**
  String get plantDorodango;

  /// No description provided for @plantExplainer.
  ///
  /// In en, this message translates to:
  /// **'Hide your finished dorodango somewhere public. Hunters nearby will be notified — and one of them might find it.'**
  String get plantExplainer;

  /// No description provided for @plantHintHint.
  ///
  /// In en, this message translates to:
  /// **'Leave a hint for hunters (optional)'**
  String get plantHintHint;

  /// No description provided for @plantItHere.
  ///
  /// In en, this message translates to:
  /// **'Plant it here'**
  String get plantItHere;

  /// No description provided for @planting.
  ///
  /// In en, this message translates to:
  /// **'Planting…'**
  String get planting;

  /// No description provided for @planted.
  ///
  /// In en, this message translates to:
  /// **'Planted! Nearby hunters will hear about it.'**
  String get planted;

  /// No description provided for @plantFailed.
  ///
  /// In en, this message translates to:
  /// **'That didn\'t work. Try again.'**
  String get plantFailed;

  /// No description provided for @noPlantsNearby.
  ///
  /// In en, this message translates to:
  /// **'No dorodango planted nearby yet. Be the first!'**
  String get noPlantsNearby;

  /// No description provided for @foundIt.
  ///
  /// In en, this message translates to:
  /// **'I found it!'**
  String get foundIt;

  /// No description provided for @metersAway.
  ///
  /// In en, this message translates to:
  /// **'{distance} m away'**
  String metersAway(int distance);

  /// No description provided for @getCloser.
  ///
  /// In en, this message translates to:
  /// **'Get closer to claim it'**
  String get getCloser;

  /// No description provided for @foundCongrats.
  ///
  /// In en, this message translates to:
  /// **'You found a dorodango!'**
  String get foundCongrats;

  /// No description provided for @hintLabel.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get hintLabel;

  /// No description provided for @huntLocationNeeded.
  ///
  /// In en, this message translates to:
  /// **'Allow location access to join the hunt.'**
  String get huntLocationNeeded;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'az',
    'de',
    'en',
    'es',
    'fr',
    'it',
    'ja',
    'pt',
    'ru',
    'tr',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
