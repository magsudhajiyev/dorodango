// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'Die Kunst, Erde zu polieren';

  @override
  String get retry => 'Erneut versuchen';

  @override
  String get skip => 'Überspringen';

  @override
  String error(String message) {
    return 'Fehler: $message';
  }

  @override
  String get soilSourceHint => 'Wo haben Sie Ihre Erde gefunden? (optional)';

  @override
  String get startNewBuild => 'Neues Projekt starten';

  @override
  String get viewBuildLog => 'Protokoll ansehen';

  @override
  String get buildLog => 'Protokoll';

  @override
  String get buildDetail => 'Projektdetail';

  @override
  String get noBuildsYet => 'Noch keine Projekte';

  @override
  String get startFirstDorodango => 'Starten Sie Ihr erstes Dorodango!';

  @override
  String get noStagesRecorded => 'Keine Stufen aufgezeichnet.';

  @override
  String get unknownSoil => 'Unbekannte Erde';

  @override
  String get statusComplete => 'Fertig';

  @override
  String get statusInProgress => 'In Arbeit';

  @override
  String get statusAbandoned => 'Abgebrochen';

  @override
  String get buildCompleteTitle => 'Ihr Dorodango\nist fertig';

  @override
  String get buildCompleteBody =>
      'Von roher Erde zum Spiegel.\nBewahren Sie es an einem kühlen, trockenen Ort auf —\nes wird in den kommenden Wochen weiter aushärten.';

  @override
  String get startAnotherBuild => 'Neues Projekt starten';

  @override
  String get nextStage => 'Nächste Stufe';

  @override
  String get completeBuild => 'Projekt abschließen';

  @override
  String get tapToSpeak => 'Tippen zum Sprechen';

  @override
  String get captureProgress => 'Fortschritt festhalten';

  @override
  String get captureSubtitle => 'Machen Sie ein Foto für Ihr Protokoll.';

  @override
  String get takePhoto => 'Foto aufnehmen';

  @override
  String get chooseFromGallery => 'Aus Galerie wählen';

  @override
  String suggestedDuration(String duration) {
    return 'Empfohlen: ~$duration';
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
  String get settings => 'Einstellungen';

  @override
  String get language => 'Sprache';

  @override
  String get systemDefault => 'Systemstandard';

  @override
  String get stageCoreForming => 'Kernbildung';

  @override
  String get stageDrying => 'Trocknung';

  @override
  String get stageDustingCapping => 'Bestäubung & Abdeckung';

  @override
  String get stagePolishing => 'Polieren';

  @override
  String get stageFinished => 'Fertig';

  @override
  String get coreFormingSummary =>
      'Erde sammeln und zu einer festen Kugel verdichten.';

  @override
  String get coreFormingStep1 =>
      'Finden Sie Erde mit einer Mischung aus Ton und feinem Sand — vermeiden Sie reinen Ton oder Sand.';

  @override
  String get coreFormingStep2 =>
      'Fügen Sie schrittweise Wasser hinzu, bis die Erde beim Zusammendrücken hält.';

  @override
  String get coreFormingStep3 =>
      'Formen Sie eine grobe Kugel etwa in Tennisballgröße.';

  @override
  String get coreFormingStep4 =>
      'Drücken und verdichten Sie fest, dabei ständig drehen, um die runde Form zu halten.';

  @override
  String get coreFormingStep5 =>
      'Komprimieren Sie 15–20 Minuten weiter, bis sich der Kern fest anfühlt.';

  @override
  String get coreFormingTip =>
      'Der Kern sollte sich dicht und schwer für seine Größe anfühlen. Wenn er bröckelt, etwas mehr Wasser hinzufügen.';

  @override
  String get coreFormingMistake =>
      'Zu viel Wasser macht den Kern klebrig und schwer formbar. Beginnen Sie trockener als gedacht.';

  @override
  String get coreFormingVoice =>
      'Zeit, Ihren Kern zu formen. Finden Sie Erde mit einer guten Mischung aus Ton und feinem Sand. Fügen Sie schrittweise Wasser hinzu und drücken Sie sie zu einer festen Kugel, etwa in Tennisballgröße. Drehen und komprimieren Sie fünfzehn bis zwanzig Minuten, bis sie sich fest und dicht anfühlt.';

  @override
  String get dryingSummary =>
      'Feuchtigkeit zur Oberfläche wandern lassen, dabei die Form beibehalten.';

  @override
  String get dryingStep1 =>
      'Legen Sie die Kugel auf eine weiche Fläche oder halten Sie sie vorsichtig.';

  @override
  String get dryingStep2 =>
      'Warten Sie 20–30 Minuten, bis die Feuchtigkeit zur Oberfläche wandert.';

  @override
  String get dryingStep3 =>
      'Wenn die Oberfläche feucht ist, bürsten Sie loses Material vorsichtig ab.';

  @override
  String get dryingStep4 =>
      'Wiederholen Sie den Zyklus — diese Stufe kann mehrere Stunden dauern.';

  @override
  String get dryingStep5 =>
      'Die Kugel ist bereit zum Bestäuben, wenn die Oberfläche nicht mehr feucht ist.';

  @override
  String get dryingTip => 'Geduld ist hier alles. Eile verursacht Risse.';

  @override
  String get dryingMistake =>
      'Zu schnelles Trocknen in direkter Sonne verursacht Oberflächenrisse. Langsam im Schatten trocknen.';

  @override
  String get dryingVoice =>
      'Jetzt trocknen wir. Legen Sie Ihre Kugel vorsichtig ab und warten Sie zwanzig bis dreißig Minuten, bis die Feuchtigkeit die Oberfläche erreicht. Wenn sie feucht ist, bürsten Sie loses Material ab. Wiederholen Sie diesen Zyklus. Die Kugel ist bereit zum Bestäuben, wenn die Oberfläche nicht mehr feucht ist. Das braucht Geduld — normalerweise mehrere Stunden.';

  @override
  String get dustingCappingSummary =>
      'Schichten feiner trockener Erde auftragen, um eine glatte Hülle zu bilden.';

  @override
  String get dustingCappingStep1 =>
      'Sieben Sie Erde durch ein feines Sieb, um ultrafeines Trockenpulver zu erhalten.';

  @override
  String get dustingCappingStep2 =>
      'Streuen Sie eine dünne Schicht Pulver über die Kugel.';

  @override
  String get dustingCappingStep3 =>
      'Reiben Sie das Pulver sanft mit der Handfläche oder dem Daumen in die Oberfläche.';

  @override
  String get dustingCappingStep4 =>
      'Lassen Sie 10–15 Minuten zwischen den Schichten ruhen.';

  @override
  String get dustingCappingStep5 =>
      'Tragen Sie 5–10 Schichten auf, bis die Oberfläche gleichmäßig glatt ist.';

  @override
  String get dustingCappingTip =>
      'Je feiner der Staub, desto besser der Glanz. Verwenden Sie die feinsten Partikel, die Sie finden können.';

  @override
  String get dustingCappingMistake =>
      'Zu dickes Auftragen verursacht Abblättern. Dünne, gleichmäßige Schichten sind der Schlüssel.';

  @override
  String get dustingCappingVoice =>
      'Zeit zum Bestäuben und Abdecken. Sieben Sie Ihre Erde, um das feinste Pulver zu erhalten. Streuen Sie eine dünne Schicht über die Kugel und reiben Sie sie sanft mit der Handfläche ein. Ruhen Sie zehn bis fünfzehn Minuten zwischen den Schichten. Tragen Sie fünf bis zehn Schichten auf, bis die Oberfläche gleichmäßig glatt ist.';

  @override
  String get polishingSummary =>
      'Die Oberfläche polieren, um einen natürlichen Glanz hervorzubringen.';

  @override
  String get polishingStep1 =>
      'Stellen Sie sicher, dass die Oberfläche vollständig trocken ist.';

  @override
  String get polishingStep2 =>
      'Reiben Sie die Kugel sanft mit einer glatten Fläche (Plastiktüte, Glasgefäß oder weicher Stoff).';

  @override
  String get polishingStep3 =>
      'Üben Sie leichten, gleichmäßigen Druck in kreisenden Bewegungen aus.';

  @override
  String get polishingStep4 =>
      'Bearbeiten Sie die gesamte Oberfläche, drehen Sie häufig für gleichmäßigen Glanz.';

  @override
  String get polishingStep5 =>
      'Fahren Sie 30–60 Minuten fort. Der Glanz entwickelt sich allmählich.';

  @override
  String get polishingTip =>
      'Weniger Druck ist mehr. Lassen Sie das Werkzeug gleiten — Druck kann die Oberfläche beschädigen.';

  @override
  String get polishingMistake =>
      'Polieren vor vollständiger Trocknung schließt Feuchtigkeit ein und verursacht matte Stellen.';

  @override
  String get polishingVoice =>
      'Zeit zum Polieren. Stellen Sie sicher, dass die Oberfläche vollständig trocken ist. Reiben Sie die Kugel sanft mit einer glatten Fläche wie einer Plastiktüte oder einem Glasgefäß in kreisenden Bewegungen. Halten Sie den Druck leicht und gleichmäßig. Bearbeiten Sie die gesamte Oberfläche dreißig bis sechzig Minuten. Der Glanz wird sich allmählich entwickeln.';

  @override
  String get finishedSummary =>
      'Ihr Dorodango ist fertig. Bewundern Sie Ihr Werk!';

  @override
  String get finishedStep1 =>
      'Machen Sie ein letztes Foto Ihrer fertigen Kugel.';

  @override
  String get finishedStep2 =>
      'Bewahren Sie sie an einem kühlen, trockenen Ort auf, geschützt vor Sonnenlicht.';

  @override
  String get finishedStep3 =>
      'Die Kugel wird in den kommenden Wochen weiter aushärten.';

  @override
  String get finishedStep4 =>
      'Vorsichtig handhaben — die polierte Oberfläche kann empfindlich sein.';

  @override
  String get finishedTip =>
      'Stellen Sie sie auf eine weiche Fläche. Einige Macher bauen Holzständer.';

  @override
  String get finishedMistake =>
      'Fallen lassen! Vorsichtig handhaben. Die polierte Hülle ist dünn.';

  @override
  String get finishedVoice =>
      'Herzlichen Glückwunsch! Ihr Dorodango ist fertig. Machen Sie ein letztes Foto und bewahren Sie es an einem kühlen, trockenen Ort auf. Es wird in den kommenden Wochen weiter aushärten. Handhaben Sie es mit Sorgfalt und genießen Sie Ihre Kreation.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Sie sind auf Stufe $order von 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Die Trocknung dauert in der Regel zwei bis vier Stunden. Seien Sie geduldig und prüfen Sie alle zwanzig bis dreißig Minuten.';

  @override
  String get dryingTimeNotOnStage =>
      'Sie sind nicht auf der Trocknungsstufe. Die Trocknung kommt nach der Kernbildung.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Häufiger Fehler in dieser Stufe: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Fotodiagnose wird in einem zukünftigen Update verfügbar sein. Prüfen Sie vorerst die häufigen Fehler Ihrer aktuellen Stufe.';

  @override
  String get alreadyComplete => 'Ihr Dorodango ist bereits fertig!';

  @override
  String get voiceUnknownCommand =>
      'Das habe ich nicht verstanden. Versuchen Sie weiter, wiederholen, Hilfe oder Problem zu sagen.';

  @override
  String get continueBuild => 'Projekt fortsetzen';

  @override
  String stageProgress(int order, String stageName) {
    return 'Stufe $order/5 — $stageName';
  }

  @override
  String get reflections => 'Reflexionen';

  @override
  String get readMore => 'Weiterlesen';

  @override
  String get listenLabel => 'Anhören';

  @override
  String get sourcePrefix => 'Quelle: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes Min. Lesezeit';
  }

  @override
  String get analyzingPhoto => 'Foto wird analysiert...';

  @override
  String get diagnosisError =>
      'Foto konnte nicht analysiert werden. Tippen zum Wiederholen.';

  @override
  String get photoUnclear => 'Foto unklar';

  @override
  String get detectSoil => 'Boden an meinem Standort erkennen';

  @override
  String get soilDetecting => 'Lokaler Boden wird gelesen…';

  @override
  String get soilTypeLabel => 'Lokaler Bodentyp';

  @override
  String get soilClay => 'Ton';

  @override
  String get soilSand => 'Sand';

  @override
  String get soilSilt => 'Schluff';

  @override
  String get soilSuitabilityGood =>
      'Tonreich — hält gut zusammen und nimmt einen schönen Glanz an.';

  @override
  String get soilSuitabilityOkay =>
      'Mäßig tonhaltig — fein sieben und fest verdichten.';

  @override
  String get soilSuitabilitySandy =>
      'Sandig — kann zerbröckeln. Mischen Sie nach Möglichkeit tonreiche Erde bei.';

  @override
  String get soilLocationDenied =>
      'Standort nicht verfügbar. Erlauben Sie den Standortzugriff, um Ihren Boden zu erkennen.';

  @override
  String get soilLookupFailed =>
      'Bodendaten für diesen Standort konnten nicht gelesen werden.';

  @override
  String get soilMap => 'Bodenkarte';

  @override
  String get soilMapHint =>
      'Tippen Sie auf die Karte, um den Boden zu untersuchen';

  @override
  String get predictResult => 'Mein Dorodango vorhersagen';

  @override
  String get predictingResult => 'KI-Coach wird befragt…';

  @override
  String get predictionTitle => 'KI-Vorhersage';

  @override
  String get predictionFailed =>
      'Vorhersage fehlgeschlagen. Versuchen Sie es erneut.';

  @override
  String get outOfCredits => 'Keine Credits mehr.';

  @override
  String get hunt => 'Dorodango-Jagd';

  @override
  String get plantDorodango => 'Dieses Dorodango einpflanzen';

  @override
  String get plantExplainer =>
      'Verstecken Sie Ihr fertiges Dorodango an einem öffentlichen Ort. Jäger in der Nähe werden benachrichtigt — vielleicht findet es jemand.';

  @override
  String get plantHintHint =>
      'Hinterlassen Sie einen Hinweis für Jäger (optional)';

  @override
  String get plantItHere => 'Hier einpflanzen';

  @override
  String get planting => 'Wird eingepflanzt…';

  @override
  String get planted => 'Eingepflanzt! Jäger in der Nähe erfahren davon.';

  @override
  String get plantFailed => 'Das hat nicht geklappt. Versuchen Sie es erneut.';

  @override
  String get noPlantsNearby =>
      'In der Nähe ist noch kein Dorodango eingepflanzt. Seien Sie die erste Person!';

  @override
  String get foundIt => 'Gefunden!';

  @override
  String metersAway(int distance) {
    return '$distance m entfernt';
  }

  @override
  String get getCloser => 'Gehen Sie näher heran, um es einzusammeln';

  @override
  String get foundCongrats => 'Sie haben ein Dorodango gefunden!';

  @override
  String get hintLabel => 'Hinweis';

  @override
  String get huntLocationNeeded =>
      'Erlauben Sie den Standortzugriff, um an der Jagd teilzunehmen.';

  @override
  String get myCollection => 'Meine Sammlung';

  @override
  String collectionCount(int count) {
    return '$count gefunden';
  }

  @override
  String get collectionEmpty =>
      'Noch nichts hier — finden Sie Ihr erstes Dorodango!';

  @override
  String foundOnDate(String date) {
    return 'Gefunden am $date';
  }

  @override
  String get goHunting => 'Auf die Jagd';

  @override
  String get handsFreeHint => 'Freihändig — sagen Sie \'Stopp\' zum Beenden';

  @override
  String get voiceGoodbye =>
      'Frohes Polieren! Tippen Sie auf die Kugel, wenn Sie mich wieder brauchen.';

  @override
  String get profile => 'Profil';

  @override
  String get guestUser => 'Gast';

  @override
  String creditsBalance(int count) {
    return '$count Credits';
  }

  @override
  String get buyCredits => 'Credits kaufen';

  @override
  String get statsBuilds => 'Dorodangos';

  @override
  String get statsPlanted => 'Eingepflanzt';

  @override
  String get statsFound => 'Gefunden';

  @override
  String get paywallTitle => 'KI-Coach-Credits';

  @override
  String get paywallSubtitle =>
      'Credits ermöglichen Sprach-Coach, Fotodiagnose und Vorhersagen — 1 Credit pro Interaktion.';

  @override
  String get paywallUnavailable =>
      'Käufe sind in diesem Build noch nicht verfügbar.';

  @override
  String get restorePurchases => 'Käufe wiederherstellen';

  @override
  String get purchaseSuccess => 'Credits hinzugefügt. Frohes Bauen!';

  @override
  String get purchaseFailed =>
      'Der Kauf wurde nicht abgeschlossen. Ihnen wurde nichts berechnet.';

  @override
  String get packBestValue => 'Bester Wert';

  @override
  String get welcomeBegin => 'Loslegen';

  @override
  String welcomeFreeCredits(int count) {
    return '$count kostenlose KI-Coach-Credits inklusive';
  }

  @override
  String get welcomeFeatureGuide =>
      'Eine ruhige Schritt-für-Schritt-Anleitung vom Schlamm zum Spiegelglanz';

  @override
  String get welcomeFeatureCoach =>
      'Ein freihändiger KI-Coach, während Ihre Hände im Ton sind';

  @override
  String get welcomeFeatureHunt =>
      'Pflanzen Sie Ihr fertiges Dorodango ein und jagen Sie welche in der Nähe';

  @override
  String get logout => 'Abmelden';

  @override
  String get logoutWarning =>
      'Beim Abmelden von einem Gastkonto gehen Ihre Dorodangos, Credits und Ihre Sammlung verloren. Fortfahren?';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get signInTitle => 'Anmelden';

  @override
  String get registerTitle => 'Konto erstellen';

  @override
  String get emailHint => 'E-Mail';

  @override
  String get passwordHint => 'Passwort';

  @override
  String get authToggleToRegister => 'Neu hier? Konto erstellen';

  @override
  String get authToggleToLogin => 'Schon ein Konto? Anmelden';

  @override
  String get continueAsGuest => 'Als Gast fortfahren';

  @override
  String get authErrorInvalidCredentials => 'E-Mail oder Passwort ist falsch.';

  @override
  String get authErrorEmailInUse =>
      'Mit dieser E-Mail existiert bereits ein Konto.';

  @override
  String get authErrorWeakPassword =>
      'Das Passwort muss mindestens 6 Zeichen haben.';

  @override
  String get authErrorGeneric =>
      'Anmeldung fehlgeschlagen. Bitte erneut versuchen.';

  @override
  String get wakeWordTooltip => '\"Hey Doro\"-Aktivierungswort';

  @override
  String get sayHeyDoro => 'Sagen Sie \"Hey Doro\", wenn Sie mich brauchen';

  @override
  String get wakeAck => 'Ja?';

  @override
  String get themeDorodangoOrigins => 'Dorodango-Ursprünge';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Erde';

  @override
  String get themePatience => 'Geduld';

  @override
  String get reflectionOrigins1Title => 'Kinder des Schulhofs';

  @override
  String get reflectionOrigins1Body =>
      'Hikaru dorodango entstand auf japanischen Schulhöfen, wo Kinder entdeckten, dass gewöhnlicher Schlamm durch bloße Geduld in etwas Außergewöhnliches verwandelt werden kann. Professor Fumio Kayo von der Pädagogischen Universität Kyoto dokumentierte diese Tradition Ende der 1990er Jahre und stellte fest, dass Kinder in nahezu jeder Region Japans die Technik unabhängig voneinander entwickelt hatten. Niemand lehrte sie — sie lernten voneinander, gaben das Wissen seitwärts statt hinunter weiter. Darin liegt etwas Tiefes: Der Wunsch, rohe Erde in einen Spiegel zu verwandeln, wird nicht erlernt, sondern entdeckt.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Pädagogische Universität Kyoto';

  @override
  String get reflectionOrigins2Title => 'Das Wort selbst';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru bedeutet \"leuchten\" oder \"leuchtend\". Dorodango setzt sich aus doro (Schlamm) und dango (Klößchen) zusammen. Ein leuchtendes Schlammklößchen — der Name ist entwaffnend bescheiden für etwas, das eine Spiegeloberfläche erreichen kann. Diese Bescheidenheit ist in der japanischen Namensgebung beabsichtigt. Den außergewöhnlichsten Dingen werden oft die einfachsten Namen gegeben, weil das Objekt für sich selbst spricht. Wenn Sie ein fertiges dorodango in den Händen halten, muss niemand erklären, was es ist. Die Kugel aus polierter Erde kommuniziert direkt, jenseits der Sprache — ein Zeugnis dafür, was Geduld und Aufmerksamkeit aus dem gewöhnlichsten Material herausholen können.';

  @override
  String get reflectionOrigins2Source => 'Japanische Etymologie';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner und der Westen';

  @override
  String get reflectionOrigins3Body =>
      'Der amerikanische Künstler Bruce Gardner begegnete dem dorodango bei der Erforschung japanischer Handwerkstraditionen und wurde einer der ersten westlichen Praktizierenden, der den Prozess ausführlich dokumentierte. Seine Arbeit half, Kulturen zu verbinden und zeigte, dass die Anziehungskraft, Erde zu verwandeln, universal ist. Gardner bemerkte, dass westliche Schüler am meisten mit der Trocknungsphase kämpfen — nicht wegen der Technik, sondern wegen der Ungeduld. Die Kugel verlangt von Ihnen zu warten, und in diesem Warten verschiebt sich etwas. Sie hören auf, das Material zu zwingen, und beginnen, ihm zuzuhören. Diese Lektion, so beobachtete Gardner, ist das eigentliche Geschenk der Praxis.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'Erde als Spiegel';

  @override
  String get reflectionOrigins4Body =>
      'Die letzte Stufe eines dorodango erreicht etwas fast Paradoxes: Erde wird zum Spiegel. Das stumpfste Material in unserer Welt — Schmutz — reflektiert Licht, wenn ihm genug geduldige Aufmerksamkeit geschenkt wird. Die alte japanische Philosophie sieht hier keinen Widerspruch. Das Potenzial für Brillanz war immer im Boden vorhanden; der Hersteller hat nur enthüllt, was bereits da war. Dies ist ein wiederkehrender Gedanke in der japanischen Ästhetik: Der Handwerker legt keine Schönheit auf das Material, sondern lockt sie heraus. Ihre Hände waren im Gespräch mit dieser Erde, und der Glanz ist die Antwort der Erde.';

  @override
  String get reflectionOrigins4Source => 'Japanische Ästhetikphilosophie';

  @override
  String get reflectionWabi1Title => 'Die Schönheit der Unvollkommenheit';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi ist die japanische Ästhetik, die in der Akzeptanz von Unvollkommenheit und Vergänglichkeit verwurzelt ist. Eine gerissene Teeschale, ein verwitterter Holzbalken, Moos zwischen Steinen — das sind keine Mängel, sondern Signaturen von Zeit und Gebrauch. Ihr dorodango wird keine perfekte Kugel sein. Es wird den einzigartigen Abdruck Ihrer Hände tragen, die besondere Zusammensetzung Ihrer Erde, die Luftfeuchtigkeit des Tages, an dem Sie es gemacht haben. Diese Variationen sind keine zu korrigierenden Fehler, sondern genau das, was Ihre Kugel zu Ihrer ganz eigenen macht. Keine zwei dorodango sind gleich, und das ist genau der Punkt.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: für Künstler, Designer, Dichter und Philosophen';

  @override
  String get reflectionWabi2Title => 'Nichts hält ewig';

  @override
  String get reflectionWabi2Body =>
      'Eine der drei Säulen des wabi-sabi ist die Vergänglichkeit — nichts hält ewig, nichts ist fertig, nichts ist perfekt. Ihr dorodango verändert sich auch nach seiner Fertigstellung weiter. Es wird wochenlang weiter aushärten. Im Laufe von Monaten und Jahren kann sich seine Oberfläche in subtilen Tönen verschieben. Wenn es fällt, wird es zerbrechen, und der Querschnitt wird die Schichten Ihrer Arbeit wie geologische Schichten enthüllen. Diese Vergänglichkeit mindert das Objekt nicht; sie vertieft es. Sie bauen nichts Ewiges. Sie bauen etwas, das schön in der Zeit existiert, genau wie Sie es tun.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title =>
      'Armut der Mittel, Reichtum des Ergebnisses';

  @override
  String get reflectionWabi3Body =>
      'Wabi beschrieb ursprünglich die Einsamkeit des Lebens in der Natur, fern der Gesellschaft. Im Laufe der Jahrhunderte entwickelte es sich dazu, die Schönheit der Einfachheit und der Armut der Mittel zu schätzen. Dorodango ist vielleicht der reinste Ausdruck davon: Ihr Material ist Erde und Wasser. Keine teuren Werkzeuge, keine Spezialausrüstung, keine seltenen Zutaten. Der Reichtum des Ergebnisses kommt ausschließlich von Ihrer Aufmerksamkeit. In einer Welt, die Ausgaben oft mit Qualität gleichsetzt, ist es etwas still Radikales, ein schönes Objekt aus der Erde unter Ihren Füßen herzustellen. Die Materialkosten betragen null. Die Investition ist Präsenz.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, Das Buch des Tees';

  @override
  String get reflectionWabi4Title => 'Sehen, was bereits da ist';

  @override
  String get reflectionWabi4Body =>
      'Der wabi-sabi-Meister erschafft Schönheit nicht so sehr, wie er sie enthüllt. Ein Gartendesigner sieht die vorhandene Landschaft, bevor er einen einzigen Stein setzt. Ein Teemeister wählt die Schale, die zur Jahreszeit passt, nicht die prächtigste. Wenn Sie Ihr dorodango polieren, malen Sie keine Schönheit auf Schlamm — Sie entlocken den latenten Glanz, den die Bodenpartikel bereits besaßen. Die Ausrichtung winziger Mineralkörner, verdichtet und geglättet, reflektiert natürlich Licht. Sie haben den Glanz nicht hinzugefügt. Sie haben alles entfernt, was ihn verborgen hielt. Das ist der wabi-sabi-Weg: nicht Addition, sondern Subtraktion; nicht Dekoration, sondern Enthüllung.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, Die Schönheit alltäglicher Dinge';

  @override
  String get reflectionMa1Title => 'Der Raum dazwischen';

  @override
  String get reflectionMa1Body =>
      'Ma (間) ist das japanische Konzept des negativen Raums — die Pause zwischen Noten, die Musik ihre Form gibt, die Leere eines Raums, die ihn nutzbar macht, die Stille im Gespräch, die Bedeutung landen lässt. Beim dorodango ist die Trocknungsphase reines ma. Nichts Sichtbares geschieht, und doch verändert sich alles unter der Oberfläche. Feuchtigkeit wandert durch Kapillarwirkung nach außen, Partikel setzen sich und verbinden sich. Die Kugel arbeitet, auch wenn Ihre Hände es nicht tun. Zu lernen, diesem unsichtbaren Prozess zu vertrauen — das Warten genauso zu schätzen wie das Tun — ist eine der tiefsten Lektionen, die die Praxis bietet.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Raum-Zeit in Japan';

  @override
  String get reflectionMa2Title => 'Leere ist nicht nichts';

  @override
  String get reflectionMa2Body =>
      'Im westlichen Denken wird leerer Raum oft als Abwesenheit gesehen — als etwas, das gefüllt werden muss. In der japanischen Ästhetik ist Leere Gegenwart. Die tokonoma-Nische in einem traditionellen Raum enthält nur eine Schriftrolle und eine Blume, weil der Raum um sie herum das ist, was ihnen Kraft verleiht. Gerade ruht Ihr dorodango, und diese Ruhe ist keine verschwendete Zeit. Die Pause zwischen Ihren Handlungen lässt das Material antworten. Es ist ein Dialog: Sie formen, dann hören Sie zu. Sie verdichten, dann warten Sie. Die Kugel lehrt, dass Produktivität und Stille keine Gegensätze sind, sondern Partner, von denen jeder den anderen bedeutsam macht.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Kapitel 11), durch japanische Interpretation';

  @override
  String get reflectionKintsugi1Title => 'Gold in den Rissen';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi ist die Kunst, gebrochenes Töpfergeschirr mit Gold gemischtem Lack zu reparieren. Anstatt den Schaden zu verbergen, wird die Reparatur zum schönsten Teil des Objekts. Seine Geschichte reicht bis ins fünfzehnte Jahrhundert zurück, als ein japanischer Shogun eine gerissene Teeschale zur Reparatur nach China schickte und von den hässlichen Metallklammern, die er zurückbekam, enttäuscht war. Japanische Handwerker entwickelten eine schönere Lösung. Wenn Ihr dorodango beim Trocknen einen Riss entwickelt, stehen Sie vor einem kintsugi-Moment: Sie können es aufgeben oder mit dem Riss arbeiten und ihn in die Geschichte der Kugel einbeziehen. Einige der beeindruckendsten dorodango tragen sichtbare Geschichte auf ihrer Oberfläche.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: Die Ästhetik geflickter japanischer Keramik';

  @override
  String get reflectionKintsugi2Title => 'Stärker an den gebrochenen Stellen';

  @override
  String get reflectionKintsugi2Body =>
      'Die Philosophie des kintsugi erstreckt sich weit über Keramik hinaus. Sie legt nahe, dass Bruch und Reparatur Teil der Geschichte eines Objekts sind und nicht etwas, das verborgen werden sollte. Auf das dorodango angewendet bedeutet dies, dass die Unvollkommenheiten, auf die Sie stoßen — eine kleine Delle durch Handhabung, ein ungleichmäßiger Fleck beim Bestäuben, eine subtile Farbvariation durch verschiedene Bodenschichten — keine Misserfolge sind. Sie sind Kapitel. Jede Markierung zeichnet einen Moment des Herstellungsprozesses auf. Meister-dorodango-Praktiker sagen oft, dass sie die gesamte Geschichte einer Kugel von ihrer Oberfläche ablesen können, so wie ein Geologe die Geschichte der Erde in freiliegendem Gestein liest.';

  @override
  String get reflectionKintsugi2Source => 'Japanische Handwerksphilosophie';

  @override
  String get reflectionShokunin1Title => 'Der Geist des Handwerkers';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin bedeutet auf Japanisch Handwerker oder Kunsthandwerker, trägt aber eine tiefere Bedeutung als seine englische Übersetzung vermuten lässt. Shokunin katagi — der Geist des Handwerkers — beschreibt eine Hingabe an sein Handwerk, die über Geschicklichkeit hinaus in moralisches Terrain geht. Der shokunin fühlt eine gesellschaftliche Verpflichtung, zum Besten für andere zu arbeiten. Selbst wenn er etwas für sich selbst herstellt, arbeitet er so, als ob das Leben eines anderen von der Qualität abhängt. Diese Intensität des Fokus, auf eine einfache Schlammkugel angewendet, verwandelt eine scheinbar triviale Tätigkeit in eine Meditation darüber, was es bedeutet, sich tief um die Qualität der eigenen Arbeit zu kümmern.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanische Holzbearbeitungswerkzeuge';

  @override
  String get reflectionShokunin2Title => 'Zehntausend Stunden Erde';

  @override
  String get reflectionShokunin2Body =>
      'In traditionellen japanischen Handwerken wird Meisterschaft nicht in Jahren, sondern in Wiederholungen gemessen. Ein Sushi-Koch verbringt Jahre damit, nur die Zubereitung von Reis zu erlernen. Ein Schwerterpolierer absolviert eine zehnjährige Lehre, bevor er selbstständig arbeitet. Dorodango folgt einer komprimierten Version dieses Bogens: Innerhalb von Stunden durchläuft man Frustration, Langeweile, Flow und Befriedigung. Jede Kugel, die man herstellt, lehrt etwas, was die vorherige nicht konnte. Der Kern der zweiten Kugel wird dichter sein. Das Bestäuben der dritten wird gleichmäßiger sein. Bei der fünften werden Ihre Hände Dinge wissen, die Ihr Verstand nicht artikulieren kann. Dies ist der shokunin-Weg — Wissen, das im Körper lebt.';

  @override
  String get reflectionShokunin2Source => 'Japanische Lehrlings-Tradition';

  @override
  String get reflectionShokunin3Title => 'Der Staub spricht';

  @override
  String get reflectionShokunin3Body =>
      'Ein erfahrener Bestäubungs-Praktiker kann den Unterschied zwischen Bodenpartikeln verschiedener Größen mit den Fingerspitzen fühlen. Die feinsten Partikel — jene, die durch ein 200-Maschen-Sieb passen — erzeugen die glatteste Oberfläche und den tiefsten Glanz. Aber der shokunin-Ansatz geht nicht nur darum, den feinsten Staub zu verwenden; es geht darum zu verstehen warum. Kleinere Partikel packen sich dichter zusammen und lassen weniger Lücken für Lichtstreuung. Jede Bestäubungsschicht fügt vielleicht zwanzig Mikron Material hinzu. Fünf bis zehn Schichten bauen eine Hülle auf, die dünner als eine Spielkarte, aber stark genug ist, um zu einem Spiegel poliert zu werden. Aufmerksamkeit in diesem Maßstab ist das Wesen des Handwerks.';

  @override
  String get reflectionShokunin3Source => 'Materialwissenschaft des dorodango';

  @override
  String get reflectionShokunin4Title => 'Die Berührung des Polierers';

  @override
  String get reflectionShokunin4Body =>
      'Japanische Schwerterpolierer, oder togishi, verbringen Jahrzehnte damit, die Kunst zu perfektionieren, den wahren Charakter einer Klinge zu enthüllen. Sie arbeiten sich durch eine Reihe von immer feineren Steinen, von denen jeder weniger Material entfernt und mehr Detail enthüllt. Die letzte Stufe verwendet einen fingernagelgroßen Stein, der mit fast keinem Druck über den Stahl gleitet. Das Polieren des dorodango folgt demselben Prinzip: Je feiner die Oberfläche wird, desto leichter muss Ihre Berührung werden. Starker Druck auf einer glatten Oberfläche wird kratzen, nicht polieren. Die letzte Fertigungsstufe streift die Oberfläche kaum noch. Meisterschaft wird hier daran gemessen, was man zurückhält, nicht was man aufträgt.';

  @override
  String get reflectionShokunin4Source =>
      'Japanische Schwerterpolier-Tradition (togishi)';

  @override
  String get reflectionSoil1Title => 'Eine Welt unter Ihren Füßen';

  @override
  String get reflectionSoil1Body =>
      'Ein einziger Teelöffel gesunden Bodens enthält mehr Mikroorganismen als es Menschen auf der Erde gibt. Bakterien, Pilze, Protozoen und Nematoden bilden ein lebendiges Geflecht, das sich über Jahrtausende aufgebaut hat. Die Erde, die Sie für Ihr dorodango gesammelt haben, trägt diese Geschichte. Die mineralische Zusammensetzung spiegelt das darunter liegende Grundgestein wider, das über geologische Zeit verwittert ist. Die Farbe erzählt eine Geschichte: Rottöne und Orange weisen auf Eisenoxide hin, dunkle Brauntöne auf reiches organisches Material, Grautöne auf Tonvorkommen. Jedes dorodango ist ein Porträt des spezifischen Ortes, aus dem es stammt — eine kleine Kugel, die die tiefe Geschichte seiner Landschaft enthält.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Schmutz: Die Erosion der Zivilisationen';

  @override
  String get reflectionSoil2Title => 'Ton erinnert sich';

  @override
  String get reflectionSoil2Body =>
      'Ton ist unter den Bodenbestandteilen wegen seines Gedächtnisses bemerkenswert. Tonpartikel sind flach und plattenartig, und wenn sie komprimiert werden, richten sie sich in parallelen Schichten aus — ähnlich wie ein Kartenspiel schütteln und flach drücken. Diese Ausrichtung gibt Ihrem dorodango sowohl Stärke als auch Glanzpotenzial. Die Partikel, einmal ausgerichtet, widerstehen der Rückkehr zur Unordnung. Sie erinnern sich an den Druck Ihrer Hände. Das ist keine Metapher; es ist Physik. Jede Verdichtung während der Kernbildung ordnet Millionen von Partikeln dauerhaft in eine stärkere Konfiguration um. Die Kugel nimmt buchstäblich die Form Ihrer Fürsorge an.';

  @override
  String get reflectionSoil2Source => 'Bodenkunde, Tonmineralogie';

  @override
  String get reflectionPatience1Title => 'Die langsame Enthüllung';

  @override
  String get reflectionPatience1Body =>
      'Das moderne Leben optimiert für Geschwindigkeit. Sofortige Lieferung, Echtzeit-Updates, unmittelbare Ergebnisse. Dorodango widersteht all dem. Allein die Trocknungsphase dauert Stunden, und es gibt keine Möglichkeit, sie zu beschleunigen, ohne die Kugel zu beschädigen. Diese erzwungene Geduld ist kein Fehler, sondern ein Merkmal. Forscher, die Flow-Zustände untersuchen, haben herausgefunden, dass langsame, repetitive manuelle Aufgaben — Stricken, Holzschnitzen, Töpfern — das Default-Mode-Netzwerk im Gehirn aktivieren, dasselbe Netzwerk, das mit Kreativität und Selbstreflexion assoziiert wird. Ihr dorodango trocknet gerade nicht nur; Ihr Geist leistet vielleicht gerade in diesem ungehetzten Raum seine interessanteste Arbeit.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'Was die Hände wissen';

  @override
  String get reflectionPatience2Body =>
      'Es gibt ein japanisches Sprichwort: \"Die Hände lernen, bevor der Verstand versteht.\" Beobachten Sie ein Kind, das zum ersten Mal dorodango macht, und Sie werden dies in Aktion sehen. Bevor es erklären kann, was es tut, passen seine Hände instinktiv Druck, Rotationsgeschwindigkeit und Feuchtigkeit an. Diese taktile Intelligenz — über Millionen von Jahren menschlicher Evolution entwickelt — ist eine unserer am meisten unterschätzten Fähigkeiten. In einem Zeitalter der Bildschirme und der Abstraktion ist dorodango eine Rückkehr zur grundlegenden menschlichen Tätigkeit, die physische Welt mit den Händen zu gestalten. Es ist kein Schritt zurück, sondern eine Wiederverbindung mit etwas Wesentlichem.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, Die Hand';

  @override
  String get voiceOutOfCredits =>
      'Ihre KI-Credits sind aufgebraucht. Ich reagiere weiterhin auf Befehle wie weiter, wiederholen und Hilfe.';

  @override
  String get voiceError =>
      'Etwas ist schiefgelaufen. Tippen Sie auf die Kugel, um es erneut zu versuchen.';

  @override
  String get voiceConnectionLost =>
      'Die Verbindung ist abgebrochen. Prüfen Sie Ihr Internet und tippen Sie auf die Kugel.';

  @override
  String get huntRadius => 'Suchradius';

  @override
  String radiusKm(int km) {
    return '$km km';
  }

  @override
  String get logoutConfirm => 'Von Ihrem Konto abmelden?';

  @override
  String get wakeWordSetup =>
      '„Hey Doro“ konnte nicht gestartet werden. Prüfen Sie Ihre Verbindung und versuchen Sie es erneut.';

  @override
  String get wakeWordPreparing =>
      '„Hey Doro“ wird vorbereitet (einmaliger Download)…';
}
