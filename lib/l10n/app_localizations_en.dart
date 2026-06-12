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

  @override
  String get soilMap => 'Soil map';

  @override
  String get soilMapHint => 'Tap the map to inspect the soil';

  @override
  String get predictResult => 'Predict my dorodango';

  @override
  String get predictingResult => 'Consulting the AI coach…';

  @override
  String get predictionTitle => 'AI prediction';

  @override
  String get predictionFailed => 'Prediction failed. Try again.';

  @override
  String get outOfCredits => 'Out of credits.';

  @override
  String get hunt => 'Dorodango Hunt';

  @override
  String get plantDorodango => 'Plant this dorodango';

  @override
  String get plantExplainer =>
      'Hide your finished dorodango somewhere public. Hunters nearby will be notified — and one of them might find it.';

  @override
  String get plantHintHint => 'Leave a hint for hunters (optional)';

  @override
  String get plantItHere => 'Plant it here';

  @override
  String get planting => 'Planting…';

  @override
  String get planted => 'Planted! Nearby hunters will hear about it.';

  @override
  String get plantFailed => 'That didn\'t work. Try again.';

  @override
  String get noPlantsNearby => 'No dorodango planted nearby yet. Be the first!';

  @override
  String get foundIt => 'I found it!';

  @override
  String metersAway(int distance) {
    return '$distance m away';
  }

  @override
  String get getCloser => 'Get closer to claim it';

  @override
  String get foundCongrats => 'You found a dorodango!';

  @override
  String get hintLabel => 'Hint';

  @override
  String get huntLocationNeeded => 'Allow location access to join the hunt.';

  @override
  String get myCollection => 'My Collection';

  @override
  String collectionCount(int count) {
    return '$count found';
  }

  @override
  String get collectionEmpty =>
      'Nothing here yet — go find your first dorodango!';

  @override
  String foundOnDate(String date) {
    return 'Found on $date';
  }

  @override
  String get goHunting => 'Go hunting';

  @override
  String get handsFreeHint => 'Hands-free — say \"stop\" to end';

  @override
  String get voiceGoodbye =>
      'Happy polishing. Tap the orb when you need me again.';

  @override
  String get profile => 'Profile';

  @override
  String get guestUser => 'Guest builder';

  @override
  String creditsBalance(int count) {
    return '$count credits';
  }

  @override
  String get buyCredits => 'Get credits';

  @override
  String get statsBuilds => 'Builds';

  @override
  String get statsPlanted => 'Planted';

  @override
  String get statsFound => 'Found';

  @override
  String get paywallTitle => 'AI Coach credits';

  @override
  String get paywallSubtitle =>
      'Credits power the voice coach, photo diagnosis, and predictions — 1 credit per interaction.';

  @override
  String get paywallUnavailable =>
      'Purchases aren\'t available in this build yet.';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get purchaseSuccess => 'Credits added. Happy building!';

  @override
  String get purchaseFailed =>
      'The purchase didn\'t complete. You weren\'t charged.';

  @override
  String get packBestValue => 'Best value';

  @override
  String get welcomeBegin => 'Begin';

  @override
  String welcomeFreeCredits(int count) {
    return '$count free AI coach credits included';
  }

  @override
  String get welcomeFeatureGuide =>
      'A calm, step-by-step guide from mud to mirror shine';

  @override
  String get welcomeFeatureCoach =>
      'A hands-free AI coach while your hands are in the clay';

  @override
  String get welcomeFeatureHunt =>
      'Plant your finished dorodango and hunt ones nearby';

  @override
  String get logout => 'Log out';

  @override
  String get logoutWarning =>
      'Logging out of a guest account loses your builds, credits and collection. Continue?';

  @override
  String get cancel => 'Cancel';

  @override
  String get signInTitle => 'Log in';

  @override
  String get registerTitle => 'Create account';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get authToggleToRegister => 'New here? Create an account';

  @override
  String get authToggleToLogin => 'Already have an account? Log in';

  @override
  String get continueAsGuest => 'Continue as a guest';

  @override
  String get authErrorInvalidCredentials => 'Email or password is incorrect.';

  @override
  String get authErrorEmailInUse =>
      'An account with this email already exists.';

  @override
  String get authErrorWeakPassword =>
      'The password must be at least 6 characters.';

  @override
  String get authErrorGeneric => 'Sign-in failed. Please try again.';

  @override
  String get wakeWordTooltip => '\"Hey Doro\" wake word';

  @override
  String get sayHeyDoro => 'Say \"Hey Doro\" when you need me';

  @override
  String get wakeAck => 'Yes?';

  @override
  String get themeDorodangoOrigins => 'Dorodango Origins';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Soil';

  @override
  String get themePatience => 'Patience';

  @override
  String get reflectionOrigins1Title => 'Children of the Schoolyard';

  @override
  String get reflectionOrigins1Body =>
      'Hikaru dorodango emerged from Japanese schoolyards, where children discovered that ordinary mud could be transformed into something extraordinary through patience alone. Professor Fumio Kayo of Kyoto University of Education documented this tradition in the late 1990s, finding that nearly every region of Japan had children independently developing the technique. No one taught them — they learned from each other, passing the knowledge sideways rather than down. There is something profound in this: the desire to transform raw earth into a mirror is not learned but discovered.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Kyoto University of Education';

  @override
  String get reflectionOrigins2Title => 'The Word Itself';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru means \"to shine\" or \"shining.\" Dorodango breaks into doro (mud) and dango (dumpling). A shining mud dumpling — the name is disarmingly humble for something that can achieve a mirror finish. This humility is intentional in Japanese naming. The most extraordinary things are often given the simplest names, because the object speaks for itself. When you hold a finished dorodango, no one needs to explain what it is. The sphere of polished earth communicates directly, beyond language, a testament to what patience and attention can draw from the most ordinary material.';

  @override
  String get reflectionOrigins2Source => 'Japanese etymology';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner and the West';

  @override
  String get reflectionOrigins3Body =>
      'American artist Bruce Gardner encountered dorodango while researching Japanese craft traditions and became one of the first Western practitioners to document the process in detail. His work helped bridge cultures, showing that the appeal of transforming earth is universal. Gardner noted that Western students often struggle most with the drying stage — not because of technique, but because of impatience. The sphere asks you to wait, and in that waiting, something shifts. You stop trying to force the material and start listening to it. This lesson, Gardner observed, is the real gift of the practice.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'Earth as Mirror';

  @override
  String get reflectionOrigins4Body =>
      'The final stage of a dorodango achieves something almost paradoxical: earth becomes a mirror. The dullest material in our world — dirt — reflects light when given enough patient attention. Ancient Japanese philosophy finds no contradiction here. The potential for brilliance was always present in the soil; the maker simply revealed what was already there. This is a recurring idea in Japanese aesthetics: the craftsperson does not impose beauty upon material but coaxes it out. Your hands have been in conversation with this earth, and the shine is the earth answering back.';

  @override
  String get reflectionOrigins4Source => 'Japanese aesthetic philosophy';

  @override
  String get reflectionWabi1Title => 'The Beauty of Imperfection';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi is the Japanese aesthetic rooted in the acceptance of imperfection and transience. A cracked tea bowl, a weathered wooden beam, moss growing between stones — these are not flaws but signatures of time and use. Your dorodango will not be a perfect sphere. It will carry the unique imprint of your hands, the particular composition of your soil, the humidity of the day you made it. These variations are not errors to be corrected but the very things that make your sphere yours alone. No two dorodango are alike, and this is precisely the point.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers';

  @override
  String get reflectionWabi2Title => 'Nothing Lasts';

  @override
  String get reflectionWabi2Body =>
      'One of the three pillars of wabi-sabi is impermanence — nothing lasts, nothing is finished, nothing is perfect. Your dorodango, even when complete, is still changing. It will continue to harden for weeks. Over months and years, its surface may develop subtle shifts in tone. If dropped, it will break, and the cross-section will reveal the layers of your work like geological strata. This impermanence does not diminish the object; it deepens it. You are not building something eternal. You are building something that exists beautifully in time, just as you do.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Poverty of Means, Richness of Result';

  @override
  String get reflectionWabi3Body =>
      'Wabi originally described the loneliness of living in nature, far from society. Over centuries it evolved to appreciate the beauty of simplicity and poverty of means. Dorodango is perhaps the purest expression of this: your material is dirt and water. No expensive tools, no specialized equipment, no rare ingredients. The richness of the result comes entirely from your attention. In a world that often equates expense with quality, there is something quietly radical about making a beautiful object from earth beneath your feet. The material cost is zero. The investment is presence.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, The Book of Tea';

  @override
  String get reflectionWabi4Title => 'Seeing What Is Already There';

  @override
  String get reflectionWabi4Body =>
      'The wabi-sabi master does not create beauty so much as reveal it. A garden designer sees the existing landscape before placing a single stone. A tea master chooses the bowl that suits the season, not the most ornate one. When you polish your dorodango, you are not painting beauty onto mud — you are drawing out the latent shine that the soil particles already possessed. The alignment of tiny mineral grains, compressed and smoothed, naturally reflects light. You did not add the shine. You removed everything that was hiding it. This is the wabi-sabi way: not addition but subtraction, not decoration but revelation.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, The Beauty of Everyday Things';

  @override
  String get reflectionMa1Title => 'The Space Between';

  @override
  String get reflectionMa1Body =>
      'Ma (間) is the Japanese concept of negative space — the pause between notes that gives music its shape, the emptiness of a room that makes it usable, the silence in conversation that allows meaning to land. In dorodango, the drying stage is pure ma. Nothing visible is happening, yet everything is changing beneath the surface. Moisture migrates outward through capillary action, particles settle and bond. The sphere is working even when your hands are not. Learning to trust this invisible process — to value the waiting as much as the doing — is one of the deepest lessons the practice offers.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Space-Time in Japan';

  @override
  String get reflectionMa2Title => 'Emptiness Is Not Nothing';

  @override
  String get reflectionMa2Body =>
      'In Western thinking, empty space is often seen as absence — something to be filled. In Japanese aesthetics, emptiness is presence. The tokonoma alcove in a traditional room holds only one scroll and one flower because the space around them is what gives them power. Right now your dorodango is resting, and this rest is not wasted time. The pause between your actions lets the material respond. It is a dialogue: you shape, then you listen. You compress, then you wait. The sphere teaches that productivity and stillness are not opposites but partners, each making the other meaningful.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Chapter 11), via Japanese interpretation';

  @override
  String get reflectionKintsugi1Title => 'Gold in the Cracks';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi is the art of repairing broken pottery with lacquer mixed with gold. Rather than hiding the damage, the repair becomes the most beautiful part of the object. Its history dates to the fifteenth century, when a Japanese shogun sent a cracked tea bowl to China for repair and was disappointed by the ugly metal staples he received back. Japanese craftsmen developed a more beautiful solution. If your dorodango develops a crack during drying, you face a kintsugi moment: you can abandon it, or you can work with the crack, incorporating it into the sphere\'s story. Some of the most striking dorodango carry visible history in their surfaces.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics';

  @override
  String get reflectionKintsugi2Title => 'Stronger at the Broken Places';

  @override
  String get reflectionKintsugi2Body =>
      'The philosophy of kintsugi extends far beyond ceramics. It suggests that breakage and repair are part of an object\'s history, not something to disguise. Applied to dorodango, this means that the imperfections you encounter — a small dent from handling, an uneven patch of dusting, a subtle color variation from different soil layers — are not failures. They are chapters. Each mark records a moment of the making process. Master dorodango practitioners often say they can read a sphere\'s entire story from its surface, the way a geologist reads the history of the earth in exposed rock.';

  @override
  String get reflectionKintsugi2Source => 'Japanese craft philosophy';

  @override
  String get reflectionShokunin1Title => 'The Craftsman\'s Spirit';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin means artisan or craftsman in Japanese, but it carries a deeper meaning than its English translation suggests. Shokunin katagi — the craftsman\'s spirit — describes a devotion to one\'s craft that goes beyond skill into moral territory. The shokunin feels a social obligation to work their best for the benefit of others. Even when making something for yourself, you work as though someone else\'s life depends on the quality. This intensity of focus, applied to a simple mud sphere, transforms what could be a trivial activity into a meditation on what it means to care deeply about the quality of your work.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanese Woodworking Tools';

  @override
  String get reflectionShokunin2Title => 'Ten Thousand Hours of Earth';

  @override
  String get reflectionShokunin2Body =>
      'In traditional Japanese crafts, mastery is measured not in years but in repetitions. A sushi chef spends years just learning to prepare rice. A sword polisher completes a ten-year apprenticeship before working independently. Dorodango follows a compressed version of this arc: within hours, you cycle through frustration, boredom, flow, and satisfaction. Each sphere you make teaches something the previous one could not. The second sphere\'s core will be denser. The third sphere\'s dusting will be more even. By the fifth, your hands will know things your mind cannot articulate. This is the shokunin path — knowledge that lives in the body.';

  @override
  String get reflectionShokunin2Source => 'Japanese apprenticeship tradition';

  @override
  String get reflectionShokunin3Title => 'The Dust Speaks';

  @override
  String get reflectionShokunin3Body =>
      'A skilled dusting practitioner can feel the difference between soil particles of different sizes through their fingertips. The finest particles — those that pass through a 200-mesh sieve — create the smoothest surface and the deepest shine. But the shokunin approach is not just about using the finest dust; it is about understanding why. Smaller particles pack more tightly, leaving fewer gaps for light to scatter. Each dusting layer adds perhaps twenty microns of material. Five to ten layers build a shell thinner than a playing card, yet strong enough to burnish to a mirror. Attention at this scale is the essence of craftsmanship.';

  @override
  String get reflectionShokunin3Source => 'Material science of dorodango';

  @override
  String get reflectionShokunin4Title => 'The Polisher\'s Touch';

  @override
  String get reflectionShokunin4Body =>
      'Japanese sword polishers, or togishi, spend decades perfecting the art of revealing a blade\'s true character. They work through a series of increasingly fine stones, each one removing less material and revealing more detail. The final stage uses a fingertip-sized stone that glides across the steel with almost no pressure. Polishing dorodango follows the same principle: as the surface becomes finer, your touch must become lighter. Heavy pressure on a smooth surface will gouge, not polish. The last stage of finishing barely grazes the surface at all. Mastery here is measured in what you learn to withhold, not what you apply.';

  @override
  String get reflectionShokunin4Source =>
      'Japanese sword polishing tradition (togishi)';

  @override
  String get reflectionSoil1Title => 'A World Beneath Your Feet';

  @override
  String get reflectionSoil1Body =>
      'A single teaspoon of healthy soil contains more microorganisms than there are people on Earth. Bacteria, fungi, protozoa, and nematodes form a living web that has been building for thousands of years. The soil you gathered for your dorodango carries this history. The mineral composition reflects the bedrock below, weathered over geological time. The color tells a story: reds and oranges indicate iron oxides, dark browns suggest rich organic matter, grays point to clay deposits. Every dorodango is a portrait of the specific place it came from — a small sphere holding the deep story of its landscape.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Dirt: The Erosion of Civilizations';

  @override
  String get reflectionSoil2Title => 'Clay Remembers';

  @override
  String get reflectionSoil2Body =>
      'Clay is remarkable among soil components because of its memory. Clay particles are flat and plate-like, and when compressed, they align in parallel layers — much like shuffling a deck of cards and pressing it flat. This alignment is what gives your dorodango its strength and its potential for shine. The particles, once aligned, resist returning to disorder. They remember the pressure of your hands. This is not metaphor; it is physics. Every compression during core forming permanently rearranges millions of particles into a stronger configuration. The sphere literally takes the shape of your care.';

  @override
  String get reflectionSoil2Source => 'Soil science, clay mineralogy';

  @override
  String get reflectionPatience1Title => 'The Slow Reveal';

  @override
  String get reflectionPatience1Body =>
      'Modern life optimizes for speed. Instant delivery, real-time updates, immediate results. Dorodango resists all of this. The drying stage alone takes hours, and there is no way to rush it without damaging the sphere. This enforced patience is not a bug but a feature. Researchers studying flow states have found that slow, repetitive manual tasks — knitting, woodcarving, pottery — activate the default mode network in the brain, the same network associated with creativity and self-reflection. Your dorodango is not just drying right now; your mind may be doing some of its most interesting work in this unhurried space.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'What the Hands Know';

  @override
  String get reflectionPatience2Body =>
      'There is a Japanese proverb: \"The hands learn before the mind understands.\" Watch a child making dorodango for the first time, and you will see this in action. Before they can explain what they are doing, their hands are adjusting pressure, rotating speed, and moisture instinctively. This tactile intelligence — developed over millions of years of human evolution — is one of our most undervalued capacities. In an age of screens and abstraction, dorodango is a return to the fundamental human activity of shaping the physical world with your hands. It is not a step backward but a reconnection with something essential.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, The Hand';

  @override
  String get voiceOutOfCredits =>
      'You\'re out of AI credits. I can still respond to commands like next, repeat, and help.';

  @override
  String get voiceError => 'Something went wrong. Tap the orb to try again.';

  @override
  String get voiceConnectionLost =>
      'I lost the connection. Check your internet and tap the orb.';
}
