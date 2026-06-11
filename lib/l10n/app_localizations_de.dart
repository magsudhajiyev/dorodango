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
}
