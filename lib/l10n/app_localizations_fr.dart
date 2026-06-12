// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'L\'art de polir la terre';

  @override
  String get retry => 'Réessayer';

  @override
  String get skip => 'Passer';

  @override
  String error(String message) {
    return 'Erreur : $message';
  }

  @override
  String get soilSourceHint => 'Où avez-vous trouvé votre terre ? (optionnel)';

  @override
  String get startNewBuild => 'Nouveau projet';

  @override
  String get viewBuildLog => 'Voir le journal';

  @override
  String get buildLog => 'Journal';

  @override
  String get buildDetail => 'Détail du projet';

  @override
  String get noBuildsYet => 'Aucun projet';

  @override
  String get startFirstDorodango => 'Commencez votre premier dorodango !';

  @override
  String get noStagesRecorded => 'Aucune étape enregistrée.';

  @override
  String get unknownSoil => 'Terre inconnue';

  @override
  String get statusComplete => 'Terminé';

  @override
  String get statusInProgress => 'En cours';

  @override
  String get statusAbandoned => 'Abandonné';

  @override
  String get buildCompleteTitle => 'Votre Dorodango\nest terminé';

  @override
  String get buildCompleteBody =>
      'De la terre brute au miroir.\nConservez-le dans un endroit frais et sec —\nil continuera à durcir au fil des semaines.';

  @override
  String get startAnotherBuild => 'Nouveau projet';

  @override
  String get nextStage => 'Étape suivante';

  @override
  String get completeBuild => 'Terminer le projet';

  @override
  String get tapToSpeak => 'Appuyez pour parler';

  @override
  String get captureProgress => 'Capturez votre progrès';

  @override
  String get captureSubtitle => 'Prenez une photo pour votre journal.';

  @override
  String get takePhoto => 'Prendre une photo';

  @override
  String get chooseFromGallery => 'Choisir depuis la galerie';

  @override
  String suggestedDuration(String duration) {
    return 'Suggéré : ~$duration';
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
  String get settings => 'Paramètres';

  @override
  String get language => 'Langue';

  @override
  String get systemDefault => 'Par défaut du système';

  @override
  String get stageCoreForming => 'Formation du noyau';

  @override
  String get stageDrying => 'Séchage';

  @override
  String get stageDustingCapping => 'Poudrage et coiffage';

  @override
  String get stagePolishing => 'Polissage';

  @override
  String get stageFinished => 'Terminé';

  @override
  String get coreFormingSummary =>
      'Rassemblez la terre et compressez-la en une sphère compacte.';

  @override
  String get coreFormingStep1 =>
      'Trouvez un sol avec un mélange d\'argile et de sable fin — évitez l\'argile pure ou le sable.';

  @override
  String get coreFormingStep2 =>
      'Ajoutez de l\'eau progressivement jusqu\'à ce que la terre tienne quand on la serre.';

  @override
  String get coreFormingStep3 =>
      'Formez une boule approximative de la taille d\'une balle de tennis.';

  @override
  String get coreFormingStep4 =>
      'Serrez et compactez fermement en tournant constamment pour garder la forme ronde.';

  @override
  String get coreFormingStep5 =>
      'Continuez à comprimer pendant 15–20 minutes jusqu\'à ce que le noyau soit solide.';

  @override
  String get coreFormingTip =>
      'Le noyau doit être dense et lourd pour sa taille. S\'il s\'émiette, ajoutez un peu plus d\'eau.';

  @override
  String get coreFormingMistake =>
      'Trop d\'eau rend le noyau collant et difficile à modeler. Commencez plus sec que prévu.';

  @override
  String get coreFormingVoice =>
      'C\'est le moment de former votre noyau. Trouvez un sol avec un bon mélange d\'argile et de sable fin. Ajoutez de l\'eau progressivement et pressez-le en une boule compacte, de la taille d\'une balle de tennis. Continuez à tourner et comprimer pendant quinze à vingt minutes jusqu\'à ce qu\'il soit solide et dense.';

  @override
  String get dryingSummary =>
      'Laissez l\'humidité migrer vers la surface tout en maintenant la forme.';

  @override
  String get dryingStep1 =>
      'Placez la sphère sur une surface douce ou tenez-la délicatement.';

  @override
  String get dryingStep2 =>
      'Attendez 20–30 minutes que l\'humidité migre vers la surface.';

  @override
  String get dryingStep3 =>
      'Quand la surface est humide, brossez doucement le matériau détaché.';

  @override
  String get dryingStep4 =>
      'Répétez le cycle — cette étape peut prendre plusieurs heures.';

  @override
  String get dryingStep5 =>
      'La sphère est prête pour le poudrage quand la surface n\'est plus humide.';

  @override
  String get dryingTip =>
      'La patience est essentielle. Se précipiter causera des fissures.';

  @override
  String get dryingMistake =>
      'Un séchage trop rapide au soleil direct cause des fissures. Séchez lentement à l\'ombre.';

  @override
  String get dryingVoice =>
      'Maintenant, séchons. Posez votre sphère délicatement et attendez vingt à trente minutes que l\'humidité atteigne la surface. Quand elle est humide, brossez le matériau détaché. Répétez ce cycle. La sphère est prête pour le poudrage quand la surface n\'est plus humide. Cela demande de la patience — généralement plusieurs heures.';

  @override
  String get dustingCappingSummary =>
      'Appliquez des couches de terre fine et sèche pour créer une coque lisse.';

  @override
  String get dustingCappingStep1 =>
      'Tamisez la terre à travers un tamis fin pour obtenir une poudre ultra-fine.';

  @override
  String get dustingCappingStep2 =>
      'Saupoudrez une fine couche de poudre sur la sphère.';

  @override
  String get dustingCappingStep3 =>
      'Frottez doucement la poudre dans la surface avec votre paume ou pouce.';

  @override
  String get dustingCappingStep4 =>
      'Laissez reposer 10–15 minutes entre les couches.';

  @override
  String get dustingCappingStep5 =>
      'Appliquez 5–10 couches jusqu\'à ce que la surface soit uniformément lisse.';

  @override
  String get dustingCappingTip =>
      'Plus la poudre est fine, meilleur sera le résultat. Utilisez les particules les plus fines possible.';

  @override
  String get dustingCappingMistake =>
      'Appliquer trop épais cause des écaillements. Des couches fines et régulières sont essentielles.';

  @override
  String get dustingCappingVoice =>
      'C\'est le moment du poudrage et du coiffage. Tamisez votre terre pour obtenir la poudre la plus fine possible. Saupoudrez une fine couche sur la sphère et frottez-la doucement avec votre paume. Reposez dix à quinze minutes entre les couches. Appliquez cinq à dix couches jusqu\'à ce que la surface soit uniformément lisse.';

  @override
  String get polishingSummary =>
      'Brunissez la surface pour faire apparaître un éclat naturel.';

  @override
  String get polishingStep1 =>
      'Assurez-vous que la surface est complètement sèche au toucher.';

  @override
  String get polishingStep2 =>
      'Avec une surface lisse (sac plastique, bocal en verre ou tissu doux), frottez doucement la sphère.';

  @override
  String get polishingStep3 =>
      'Appliquez une pression légère et constante en mouvements circulaires.';

  @override
  String get polishingStep4 =>
      'Travaillez toute la surface en tournant fréquemment pour un éclat uniforme.';

  @override
  String get polishingStep5 =>
      'Continuez pendant 30–60 minutes. L\'éclat se développe progressivement.';

  @override
  String get polishingTip =>
      'Moins de pression est mieux. Laissez glisser l\'outil — forcer peut creuser la surface.';

  @override
  String get polishingMistake =>
      'Polir avant séchage complet emprisonne l\'humidité et crée des taches ternes.';

  @override
  String get polishingVoice =>
      'C\'est le moment de polir. Assurez-vous que la surface est complètement sèche. Avec une surface lisse comme un sac plastique ou un bocal en verre, frottez doucement la sphère en mouvements circulaires. Gardez la pression légère et constante. Travaillez toute la surface pendant trente à soixante minutes. L\'éclat se développera progressivement.';

  @override
  String get finishedSummary =>
      'Votre dorodango est terminé. Admirez votre travail !';

  @override
  String get finishedStep1 =>
      'Prenez une dernière photo de votre sphère terminée.';

  @override
  String get finishedStep2 =>
      'Conservez-la dans un endroit frais et sec, à l\'abri du soleil.';

  @override
  String get finishedStep3 =>
      'La sphère continuera à durcir au fil des semaines.';

  @override
  String get finishedStep4 =>
      'Manipulez avec soin — la surface polie peut être fragile.';

  @override
  String get finishedTip =>
      'Exposez-la sur une surface douce. Certains créateurs fabriquent des supports en bois.';

  @override
  String get finishedMistake =>
      'La faire tomber ! Manipulez délicatement. La coque polie est fine.';

  @override
  String get finishedVoice =>
      'Félicitations ! Votre dorodango est terminé. Prenez une dernière photo et conservez-le dans un endroit frais et sec. Il continuera à durcir au fil des semaines. Manipulez-le avec soin et profitez de votre création.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Vous êtes à l\'étape $order sur 5 : $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Le séchage prend généralement deux à quatre heures. Soyez patient et vérifiez toutes les vingt à trente minutes.';

  @override
  String get dryingTimeNotOnStage =>
      'Vous n\'êtes pas actuellement à l\'étape de séchage. Le séchage vient après la formation du noyau.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Erreur courante à cette étape : $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Le diagnostic photo sera disponible dans une future mise à jour. Pour l\'instant, consultez les erreurs courantes de votre étape.';

  @override
  String get alreadyComplete => 'Votre dorodango est déjà terminé !';

  @override
  String get voiceUnknownCommand =>
      'Je n\'ai pas compris. Essayez de dire suivant, répéter, aide ou problème.';

  @override
  String get continueBuild => 'Reprendre le projet';

  @override
  String stageProgress(int order, String stageName) {
    return 'Étape $order/5 — $stageName';
  }

  @override
  String get reflections => 'Réflexions';

  @override
  String get readMore => 'Lire la suite';

  @override
  String get listenLabel => 'Écouter';

  @override
  String get sourcePrefix => 'Source : ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes min de lecture';
  }

  @override
  String get analyzingPhoto => 'Analyse de votre photo...';

  @override
  String get diagnosisError =>
      'Impossible d\'analyser la photo. Appuyez pour réessayer.';

  @override
  String get photoUnclear => 'Photo floue';

  @override
  String get detectSoil => 'Détecter la terre à ma position';

  @override
  String get soilDetecting => 'Lecture de la terre locale…';

  @override
  String get soilTypeLabel => 'Type de terre locale';

  @override
  String get soilClay => 'Argile';

  @override
  String get soilSand => 'Sable';

  @override
  String get soilSilt => 'Limon';

  @override
  String get soilSuitabilityGood =>
      'Riche en argile — elle se tiendra bien et prendra un beau brillant.';

  @override
  String get soilSuitabilityOkay =>
      'Argile modérée — tamisez-la finement et compressez fermement.';

  @override
  String get soilSuitabilitySandy =>
      'Sablonneuse — elle peut s\'effriter. Mélangez de la terre argileuse si possible.';

  @override
  String get soilLocationDenied =>
      'Position indisponible. Autorisez l\'accès à la position pour détecter votre terre.';

  @override
  String get soilLookupFailed =>
      'Impossible de lire les données du sol pour cette position.';

  @override
  String get soilMap => 'Carte des sols';

  @override
  String get soilMapHint => 'Touchez la carte pour examiner la terre';

  @override
  String get predictResult => 'Prédire mon dorodango';

  @override
  String get predictingResult => 'Consultation du coach IA…';

  @override
  String get predictionTitle => 'Prédiction IA';

  @override
  String get predictionFailed => 'Échec de la prédiction. Réessayez.';

  @override
  String get outOfCredits => 'Plus de crédits.';

  @override
  String get hunt => 'Chasse au dorodango';

  @override
  String get plantDorodango => 'Planter ce dorodango';

  @override
  String get plantExplainer =>
      'Cachez votre dorodango terminé dans un lieu public. Les chasseurs à proximité seront prévenus — quelqu\'un le trouvera peut-être.';

  @override
  String get plantHintHint => 'Laissez un indice aux chasseurs (optionnel)';

  @override
  String get plantItHere => 'Le planter ici';

  @override
  String get planting => 'Plantation…';

  @override
  String get planted => 'Planté ! Les chasseurs à proximité seront prévenus.';

  @override
  String get plantFailed => 'Ça n\'a pas fonctionné. Réessayez.';

  @override
  String get noPlantsNearby =>
      'Aucun dorodango planté à proximité pour l\'instant. Soyez le premier !';

  @override
  String get foundIt => 'Je l\'ai trouvé !';

  @override
  String metersAway(int distance) {
    return 'À $distance m';
  }

  @override
  String get getCloser => 'Approchez-vous pour le réclamer';

  @override
  String get foundCongrats => 'Vous avez trouvé un dorodango !';

  @override
  String get hintLabel => 'Indice';

  @override
  String get huntLocationNeeded =>
      'Autorisez l\'accès à la position pour rejoindre la chasse.';

  @override
  String get myCollection => 'Ma collection';

  @override
  String collectionCount(int count) {
    return '$count trouvés';
  }

  @override
  String get collectionEmpty =>
      'Rien ici pour l\'instant — trouvez votre premier dorodango !';

  @override
  String foundOnDate(String date) {
    return 'Trouvé le $date';
  }

  @override
  String get goHunting => 'Partir à la chasse';

  @override
  String get handsFreeHint => 'Mains libres — dites « stop » pour terminer';

  @override
  String get voiceGoodbye =>
      'Bon polissage ! Touchez l\'orbe quand vous aurez besoin de moi.';

  @override
  String get profile => 'Profil';

  @override
  String get guestUser => 'Artisan invité';

  @override
  String creditsBalance(int count) {
    return '$count crédits';
  }

  @override
  String get buyCredits => 'Obtenir des crédits';

  @override
  String get statsBuilds => 'Dorodangos';

  @override
  String get statsPlanted => 'Plantés';

  @override
  String get statsFound => 'Trouvés';

  @override
  String get paywallTitle => 'Crédits du coach IA';

  @override
  String get paywallSubtitle =>
      'Les crédits alimentent le coach vocal, le diagnostic photo et les prédictions — 1 crédit par interaction.';

  @override
  String get paywallUnavailable =>
      'Les achats ne sont pas encore disponibles dans cette version.';

  @override
  String get restorePurchases => 'Restaurer les achats';

  @override
  String get purchaseSuccess => 'Crédits ajoutés. Bonne création !';

  @override
  String get purchaseFailed =>
      'L\'achat n\'a pas abouti. Vous n\'avez pas été débité.';

  @override
  String get packBestValue => 'Meilleur prix';

  @override
  String get welcomeBegin => 'Commencer';

  @override
  String welcomeFreeCredits(int count) {
    return '$count crédits gratuits de coach IA inclus';
  }

  @override
  String get welcomeFeatureGuide =>
      'Un guide serein, étape par étape, de la boue au brillant miroir';

  @override
  String get welcomeFeatureCoach =>
      'Un coach IA mains libres pendant que vos mains sont dans l\'argile';

  @override
  String get welcomeFeatureHunt =>
      'Plantez votre dorodango terminé et chassez ceux à proximité';

  @override
  String get logout => 'Se déconnecter';

  @override
  String get logoutWarning =>
      'En vous déconnectant d\'un compte invité, vous perdez vos dorodangos, crédits et votre collection. Continuer ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get signInTitle => 'Se connecter';

  @override
  String get registerTitle => 'Créer un compte';

  @override
  String get emailHint => 'E-mail';

  @override
  String get passwordHint => 'Mot de passe';

  @override
  String get authToggleToRegister => 'Nouveau ici ? Créez un compte';

  @override
  String get authToggleToLogin => 'Déjà un compte ? Connectez-vous';

  @override
  String get continueAsGuest => 'Continuer en tant qu\'invité';

  @override
  String get authErrorInvalidCredentials => 'E-mail ou mot de passe incorrect.';

  @override
  String get authErrorEmailInUse => 'Un compte existe déjà avec cet e-mail.';

  @override
  String get authErrorWeakPassword =>
      'Le mot de passe doit contenir au moins 6 caractères.';

  @override
  String get authErrorGeneric => 'Échec de la connexion. Veuillez réessayer.';

  @override
  String get wakeWordTooltip => 'Mot d\'activation « Hey Doro »';

  @override
  String get sayHeyDoro => 'Dites « Hey Doro » quand vous avez besoin de moi';

  @override
  String get wakeAck => 'Oui ?';
}
