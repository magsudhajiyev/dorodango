// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'L\'arte di lucidare la terra';

  @override
  String get retry => 'Riprova';

  @override
  String get skip => 'Salta';

  @override
  String error(String message) {
    return 'Errore: $message';
  }

  @override
  String get soilSourceHint => 'Dove hai trovato il terreno? (opzionale)';

  @override
  String get startNewBuild => 'Nuovo Progetto';

  @override
  String get viewBuildLog => 'Vedi Registro';

  @override
  String get buildLog => 'Registro';

  @override
  String get buildDetail => 'Dettaglio Progetto';

  @override
  String get noBuildsYet => 'Nessun progetto ancora';

  @override
  String get startFirstDorodango => 'Inizia il tuo primo dorodango!';

  @override
  String get noStagesRecorded => 'Nessuna fase registrata.';

  @override
  String get unknownSoil => 'Terreno sconosciuto';

  @override
  String get statusComplete => 'Completato';

  @override
  String get statusInProgress => 'In corso';

  @override
  String get statusAbandoned => 'Abbandonato';

  @override
  String get buildCompleteTitle => 'Il tuo Dorodango\nè completo';

  @override
  String get buildCompleteBody =>
      'Da terra grezza a lucentezza speculare.\nConservalo in un luogo fresco e asciutto —\ncontinuerà a indurirsi nelle prossime settimane.';

  @override
  String get startAnotherBuild => 'Nuovo Progetto';

  @override
  String get nextStage => 'Fase Successiva';

  @override
  String get completeBuild => 'Completa Progetto';

  @override
  String get tapToSpeak => 'Tocca per parlare';

  @override
  String get captureProgress => 'Cattura il tuo progresso';

  @override
  String get captureSubtitle => 'Scatta una foto per il tuo registro.';

  @override
  String get takePhoto => 'Scatta Foto';

  @override
  String get chooseFromGallery => 'Scegli dalla galleria';

  @override
  String suggestedDuration(String duration) {
    return 'Suggerito: ~$duration';
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
  String get settings => 'Impostazioni';

  @override
  String get language => 'Lingua';

  @override
  String get systemDefault => 'Predefinito di sistema';

  @override
  String get stageCoreForming => 'Formazione del nucleo';

  @override
  String get stageDrying => 'Asciugatura';

  @override
  String get stageDustingCapping => 'Spolveratura e copertura';

  @override
  String get stagePolishing => 'Lucidatura';

  @override
  String get stageFinished => 'Completato';

  @override
  String get coreFormingSummary =>
      'Raccogli il terreno e comprimilo in una sfera compatta.';

  @override
  String get coreFormingStep1 =>
      'Trova terreno con un mix di argilla e sabbia fine — evita argilla pura o sabbia.';

  @override
  String get coreFormingStep2 =>
      'Aggiungi acqua gradualmente finché il terreno non si tiene insieme quando stretto.';

  @override
  String get coreFormingStep3 =>
      'Forma una palla grezza delle dimensioni di una pallina da tennis.';

  @override
  String get coreFormingStep4 =>
      'Stringi e compatta saldamente, ruotando costantemente per mantenere la forma rotonda.';

  @override
  String get coreFormingStep5 =>
      'Continua a comprimere per 15–20 minuti finché il nucleo non risulta solido.';

  @override
  String get coreFormingTip =>
      'Il nucleo dovrebbe risultare denso e pesante per le sue dimensioni. Se si sbriciola, aggiungi un po\' più d\'acqua.';

  @override
  String get coreFormingMistake =>
      'Troppa acqua rende il nucleo appiccicoso e difficile da modellare. Inizia più asciutto del previsto.';

  @override
  String get coreFormingVoice =>
      'È il momento di formare il nucleo. Trova terreno con un buon mix di argilla e sabbia fine. Aggiungi acqua gradualmente e stringi in una palla compatta, delle dimensioni di una pallina da tennis. Continua a ruotare e comprimere per quindici-venti minuti finché non risulta solido e denso.';

  @override
  String get dryingSummary =>
      'Lascia che l\'umidità migri verso la superficie mantenendo la forma.';

  @override
  String get dryingStep1 =>
      'Posa la sfera su una superficie morbida o tienila delicatamente.';

  @override
  String get dryingStep2 =>
      'Aspetta 20–30 minuti per far migrare l\'umidità verso la superficie.';

  @override
  String get dryingStep3 =>
      'Quando la superficie è umida, spazzola delicatamente il materiale sciolto.';

  @override
  String get dryingStep4 =>
      'Ripeti il ciclo — questa fase può richiedere diverse ore.';

  @override
  String get dryingStep5 =>
      'La sfera è pronta per la spolveratura quando la superficie non è più bagnata.';

  @override
  String get dryingTip => 'La pazienza è tutto. Affrettarsi causerà crepe.';

  @override
  String get dryingMistake =>
      'Asciugatura troppo rapida al sole diretto causa crepe superficiali. Asciuga lentamente all\'ombra.';

  @override
  String get dryingVoice =>
      'Ora asciughiamo. Posa la sfera delicatamente e aspetta venti-trenta minuti perché l\'umidità raggiunga la superficie. Quando è umida, spazzola il materiale sciolto. Ripeti questo ciclo. La sfera è pronta per la spolveratura quando la superficie non è più bagnata. Questo richiede pazienza — di solito diverse ore.';

  @override
  String get dustingCappingSummary =>
      'Applica strati di terreno fine e asciutto per creare un guscio liscio.';

  @override
  String get dustingCappingStep1 =>
      'Setaccia il terreno attraverso una maglia fine per ottenere polvere ultra-fine.';

  @override
  String get dustingCappingStep2 =>
      'Cospargi un sottile strato di polvere sulla sfera.';

  @override
  String get dustingCappingStep3 =>
      'Strofina delicatamente la polvere sulla superficie con il palmo o il pollice.';

  @override
  String get dustingCappingStep4 =>
      'Lascia riposare 10–15 minuti tra gli strati.';

  @override
  String get dustingCappingStep5 =>
      'Applica 5–10 strati finché la superficie non è uniformemente liscia.';

  @override
  String get dustingCappingTip =>
      'Più fine è la polvere, migliore sarà la lucentezza finale. Usa le particelle più fini possibili.';

  @override
  String get dustingCappingMistake =>
      'Applicare polvere troppo spessa causa sfaldatura. Strati sottili e uniformi sono la chiave.';

  @override
  String get dustingCappingVoice =>
      'È il momento della spolveratura e copertura. Setaccia il terreno per ottenere la polvere più fine possibile. Cospargi uno strato sottile sulla sfera e strofinalo delicatamente con il palmo. Riposa dieci-quindici minuti tra gli strati. Applica cinque-dieci strati finché la superficie non è uniformemente liscia.';

  @override
  String get polishingSummary =>
      'Brunisci la superficie per far emergere una lucentezza naturale.';

  @override
  String get polishingStep1 =>
      'Assicurati che la superficie sia completamente asciutta al tatto.';

  @override
  String get polishingStep2 =>
      'Con una superficie liscia (sacchetto di plastica, barattolo di vetro o panno morbido), strofina delicatamente la sfera.';

  @override
  String get polishingStep3 =>
      'Applica pressione leggera e costante con movimenti circolari.';

  @override
  String get polishingStep4 =>
      'Lavora l\'intera superficie, ruotando frequentemente per una lucentezza uniforme.';

  @override
  String get polishingStep5 =>
      'Continua per 30–60 minuti. La lucentezza si sviluppa gradualmente.';

  @override
  String get polishingTip =>
      'Meno pressione è meglio. Lascia scorrere lo strumento — forzare può graffiare la superficie.';

  @override
  String get polishingMistake =>
      'Lucidare prima della completa asciugatura intrappola l\'umidità e crea macchie opache.';

  @override
  String get polishingVoice =>
      'È il momento di lucidare. Assicurati che la superficie sia completamente asciutta. Con una superficie liscia come un sacchetto di plastica o barattolo di vetro, strofina delicatamente la sfera con movimenti circolari. Mantieni la pressione leggera e costante. Lavora l\'intera superficie per trenta-sessanta minuti. La lucentezza si svilupperà gradualmente.';

  @override
  String get finishedSummary =>
      'Il tuo dorodango è completo. Ammira il tuo lavoro!';

  @override
  String get finishedStep1 =>
      'Scatta una foto finale della tua sfera completata.';

  @override
  String get finishedStep2 =>
      'Conservala in un luogo fresco e asciutto lontano dalla luce solare.';

  @override
  String get finishedStep3 =>
      'La sfera continuerà a indurirsi nelle prossime settimane.';

  @override
  String get finishedStep4 =>
      'Maneggia con cura — la superficie lucidata può essere fragile.';

  @override
  String get finishedTip =>
      'Esponila su una superficie morbida. Alcuni creatori realizzano supporti in legno.';

  @override
  String get finishedMistake =>
      'Farla cadere! Maneggia delicatamente. Il guscio lucidato è sottile.';

  @override
  String get finishedVoice =>
      'Congratulazioni! Il tuo dorodango è completo. Scatta una foto finale e conservalo in un luogo fresco e asciutto. Continuerà a indurirsi nelle prossime settimane. Maneggia con cura e goditi la tua creazione.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Sei alla fase $order di 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'L\'asciugatura richiede generalmente da due a quattro ore. Sii paziente e controlla ogni venti-trenta minuti.';

  @override
  String get dryingTimeNotOnStage =>
      'Non sei attualmente nella fase di asciugatura. L\'asciugatura viene dopo la formazione del nucleo.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Errore comune in questa fase: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'La diagnosi fotografica sarà disponibile in un aggiornamento futuro. Per ora, controlla gli errori comuni della tua fase attuale.';

  @override
  String get alreadyComplete => 'Il tuo dorodango è già completo!';

  @override
  String get voiceUnknownCommand =>
      'Non ho capito. Prova a dire avanti, ripetere, aiuto o problema.';

  @override
  String get continueBuild => 'Continua progetto';

  @override
  String stageProgress(int order, String stageName) {
    return 'Fase $order/5 — $stageName';
  }

  @override
  String get reflections => 'Riflessioni';

  @override
  String get readMore => 'Leggi di più';

  @override
  String get listenLabel => 'Ascolta';

  @override
  String get sourcePrefix => 'Fonte: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes min di lettura';
  }

  @override
  String get analyzingPhoto => 'Analisi della foto...';

  @override
  String get diagnosisError =>
      'Impossibile analizzare la foto. Tocca per riprovare.';

  @override
  String get photoUnclear => 'Foto poco chiara';

  @override
  String get detectSoil => 'Rileva il terreno dalla mia posizione';

  @override
  String get soilDetecting => 'Lettura del terreno locale…';

  @override
  String get soilTypeLabel => 'Tipo di terreno locale';

  @override
  String get soilClay => 'Argilla';

  @override
  String get soilSand => 'Sabbia';

  @override
  String get soilSilt => 'Limo';

  @override
  String get soilSuitabilityGood =>
      'Ricco di argilla — si compatterà bene e prenderà una bella lucentezza.';

  @override
  String get soilSuitabilityOkay =>
      'Argilla moderata — setaccialo fine e compattalo con forza.';

  @override
  String get soilSuitabilitySandy =>
      'Sabbioso — potrebbe sgretolarsi. Se puoi, aggiungi terra ricca di argilla.';

  @override
  String get soilLocationDenied =>
      'Posizione non disponibile. Consenti l\'accesso alla posizione per rilevare il terreno.';

  @override
  String get soilLookupFailed =>
      'Impossibile leggere i dati del terreno per questa posizione.';

  @override
  String get soilMap => 'Mappa dei suoli';

  @override
  String get soilMapHint => 'Tocca la mappa per esaminare il terreno';

  @override
  String get predictResult => 'Prevedi il mio dorodango';

  @override
  String get predictingResult => 'Consultazione del coach IA…';

  @override
  String get predictionTitle => 'Previsione IA';

  @override
  String get predictionFailed => 'Previsione non riuscita. Riprova.';

  @override
  String get outOfCredits => 'Crediti esauriti.';

  @override
  String get hunt => 'Caccia al dorodango';

  @override
  String get plantDorodango => 'Pianta questo dorodango';

  @override
  String get plantExplainer =>
      'Nascondi il tuo dorodango finito in un luogo pubblico. I cacciatori nelle vicinanze riceveranno un avviso — forse qualcuno lo troverà.';

  @override
  String get plantHintHint => 'Lascia un indizio per i cacciatori (opzionale)';

  @override
  String get plantItHere => 'Piantalo qui';

  @override
  String get planting => 'Piantagione in corso…';

  @override
  String get planted => 'Piantato! I cacciatori vicini lo verranno a sapere.';

  @override
  String get plantFailed => 'Non ha funzionato. Riprova.';

  @override
  String get noPlantsNearby =>
      'Nessun dorodango piantato nelle vicinanze. Sii il primo!';

  @override
  String get foundIt => 'L\'ho trovato!';

  @override
  String metersAway(int distance) {
    return 'A $distance m';
  }

  @override
  String get getCloser => 'Avvicinati per reclamarlo';

  @override
  String get foundCongrats => 'Hai trovato un dorodango!';

  @override
  String get hintLabel => 'Indizio';

  @override
  String get huntLocationNeeded =>
      'Consenti l\'accesso alla posizione per unirti alla caccia.';

  @override
  String get myCollection => 'La mia collezione';

  @override
  String collectionCount(int count) {
    return '$count trovati';
  }

  @override
  String get collectionEmpty =>
      'Ancora niente qui — trova il tuo primo dorodango!';

  @override
  String foundOnDate(String date) {
    return 'Trovato il $date';
  }

  @override
  String get goHunting => 'Vai a caccia';

  @override
  String get handsFreeHint => 'Mani libere — di\' «stop» per terminare';

  @override
  String get voiceGoodbye =>
      'Buona lucidatura! Tocca la sfera quando ti servo di nuovo.';

  @override
  String get profile => 'Profilo';

  @override
  String get guestUser => 'Artigiano ospite';

  @override
  String creditsBalance(int count) {
    return '$count crediti';
  }

  @override
  String get buyCredits => 'Ottieni crediti';

  @override
  String get statsBuilds => 'Dorodango';

  @override
  String get statsPlanted => 'Piantati';

  @override
  String get statsFound => 'Trovati';

  @override
  String get paywallTitle => 'Crediti del coach IA';

  @override
  String get paywallSubtitle =>
      'I crediti alimentano il coach vocale, la diagnosi foto e le previsioni — 1 credito per interazione.';

  @override
  String get paywallUnavailable =>
      'Gli acquisti non sono ancora disponibili in questa versione.';

  @override
  String get restorePurchases => 'Ripristina acquisti';

  @override
  String get purchaseSuccess => 'Crediti aggiunti. Buona creazione!';

  @override
  String get purchaseFailed =>
      'L\'acquisto non è andato a buon fine. Non ti è stato addebitato nulla.';

  @override
  String get packBestValue => 'Più conveniente';
}
