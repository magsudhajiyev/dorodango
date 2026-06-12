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

  @override
  String get welcomeBegin => 'Inizia';

  @override
  String welcomeFreeCredits(int count) {
    return '$count crediti gratuiti del coach IA inclusi';
  }

  @override
  String get welcomeFeatureGuide =>
      'Una guida serena, passo dopo passo, dal fango alla lucentezza a specchio';

  @override
  String get welcomeFeatureCoach =>
      'Un coach IA a mani libere mentre le tue mani sono nell\'argilla';

  @override
  String get welcomeFeatureHunt =>
      'Pianta il tuo dorodango finito e dai la caccia a quelli vicini';

  @override
  String get logout => 'Esci';

  @override
  String get logoutWarning =>
      'Uscendo da un account ospite perderai i tuoi dorodango, i crediti e la collezione. Continuare?';

  @override
  String get cancel => 'Annulla';

  @override
  String get signInTitle => 'Accedi';

  @override
  String get registerTitle => 'Crea account';

  @override
  String get emailHint => 'Email';

  @override
  String get passwordHint => 'Password';

  @override
  String get authToggleToRegister => 'Nuovo qui? Crea un account';

  @override
  String get authToggleToLogin => 'Hai già un account? Accedi';

  @override
  String get continueAsGuest => 'Continua come ospite';

  @override
  String get authErrorInvalidCredentials => 'Email o password errati.';

  @override
  String get authErrorEmailInUse => 'Esiste già un account con questa email.';

  @override
  String get authErrorWeakPassword =>
      'La password deve contenere almeno 6 caratteri.';

  @override
  String get authErrorGeneric => 'Accesso non riuscito. Riprova.';

  @override
  String get wakeWordTooltip => 'Parola di attivazione «Hey Doro»';

  @override
  String get sayHeyDoro => 'Di\' «Hey Doro» quando ti servo';

  @override
  String get wakeAck => 'Sì?';

  @override
  String get themeDorodangoOrigins => 'Le Origini del Dorodango';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'La Terra';

  @override
  String get themePatience => 'La Pazienza';

  @override
  String get reflectionOrigins1Title => 'Figli del cortile scolastico';

  @override
  String get reflectionOrigins1Body =>
      'Il hikaru dorodango è nato nei cortili delle scuole giapponesi, dove i bambini scoprirono che il fango ordinario poteva essere trasformato in qualcosa di straordinario attraverso la sola pazienza. Il professor Fumio Kayo dell\'Università di Educazione di Kyoto documentò questa tradizione alla fine degli anni Novanta, scoprendo che quasi ogni regione del Giappone aveva bambini che sviluppavano la tecnica in modo indipendente. Nessuno la insegnava loro — se la trasmettevano l\'un l\'altro, orizzontalmente anziché verticalmente. C\'è qualcosa di profondo in questo: il desiderio di trasformare la terra grezza in uno specchio non si impara, si scopre.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Università di Educazione di Kyoto';

  @override
  String get reflectionOrigins2Title => 'La parola stessa';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru significa «brillare» o «splendente». Dorodango si divide in doro (fango) e dango (gnocco). Un gnocco di fango splendente — il nome è di una semplicità disarmante per qualcosa che può raggiungere una finitura a specchio. Questa umiltà è intenzionale nella denominazione giapponese. Le cose più straordinarie ricevono spesso i nomi più semplici, perché l\'oggetto parla da solo. Quando si tiene in mano un dorodango finito, non c\'è bisogno di spiegazioni. La sfera di terra lucidata comunica direttamente, al di là del linguaggio, testimonianza di ciò che la pazienza e l\'attenzione possono estrarre dal materiale più ordinario.';

  @override
  String get reflectionOrigins2Source => 'Etimologia giapponese';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner e l\'Occidente';

  @override
  String get reflectionOrigins3Body =>
      'L\'artista americano Bruce Gardner scoprì il dorodango mentre studiava le tradizioni artigianali giapponesi e divenne uno dei primi praticanti occidentali a documentare il processo in dettaglio. Il suo lavoro contribuì a unire le culture, dimostrando che il fascino della trasformazione della terra è universale. Gardner notò che gli studenti occidentali faticano maggiormente nella fase di asciugatura — non per una questione di tecnica, ma di impazienza. La sfera ti chiede di aspettare, e in quell\'attesa qualcosa cambia. Si smette di cercare di forzare il materiale e si comincia ad ascoltarlo. Questa lezione, osservò Gardner, è il vero dono della pratica.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'La terra come specchio';

  @override
  String get reflectionOrigins4Body =>
      'La fase finale di un dorodango raggiunge qualcosa di quasi paradossale: la terra diventa specchio. Il materiale più opaco del nostro mondo — la polvere — riflette la luce quando le si dedica sufficiente attenzione paziente. L\'antica filosofia giapponese non vede alcuna contraddizione in questo. Il potenziale di brillantezza era sempre presente nel suolo; l\'artigiano ha semplicemente rivelato ciò che era già lì. È un\'idea ricorrente nell\'estetica giapponese: l\'artigiano non impone la bellezza al materiale, ma la fa emergere. Le tue mani hanno avuto una conversazione con questa terra, e il luccichio è la risposta della terra.';

  @override
  String get reflectionOrigins4Source => 'Filosofia estetica giapponese';

  @override
  String get reflectionWabi1Title => 'La bellezza dell\'imperfezione';

  @override
  String get reflectionWabi1Body =>
      'Il wabi-sabi è l\'estetica giapponese radicata nell\'accettazione dell\'imperfezione e della transitorietà. Una ciotola da tè incrinata, una trave di legno consumata, il muschio che cresce tra le pietre — non sono difetti ma firme del tempo e dell\'uso. Il tuo dorodango non sarà una sfera perfetta. Porterà l\'impronta unica delle tue mani, la composizione particolare del tuo suolo, l\'umidità del giorno in cui l\'hai fatto. Queste variazioni non sono errori da correggere, ma proprio le cose che rendono la tua sfera unicamente tua. Non esistono due dorodango uguali, e questo è esattamente il senso.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers';

  @override
  String get reflectionWabi2Title => 'Niente dura';

  @override
  String get reflectionWabi2Body =>
      'Uno dei tre pilastri del wabi-sabi è l\'impermanenza — niente dura, niente è finito, niente è perfetto. Il tuo dorodango, anche quando è completo, continua a cambiare. Continuerà a indurirsi per settimane. Nel corso di mesi e anni, la sua superficie può sviluppare sottili variazioni di tonalità. Se cade, si romperà, e la sezione trasversale rivelerà gli strati del tuo lavoro come strati geologici. Questa impermanenza non sminuisce l\'oggetto; lo approfondisce. Non stai costruendo qualcosa di eterno. Stai costruendo qualcosa che esiste splendidamente nel tempo, proprio come te.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Povertà di mezzi, ricchezza di risultati';

  @override
  String get reflectionWabi3Body =>
      'Il wabi descriveva originariamente la solitudine di vivere nella natura, lontano dalla società. Nel corso dei secoli si è evoluto fino ad apprezzare la bellezza della semplicità e la povertà dei mezzi. Il dorodango è forse l\'espressione più pura di questo: il tuo materiale è terra e acqua. Nessuno strumento costoso, nessuna attrezzatura specializzata, nessun ingrediente raro. La ricchezza del risultato proviene interamente dalla tua attenzione. In un mondo che spesso equipara il costo alla qualità, c\'è qualcosa di quietamente radicale nel fare un bel oggetto dalla terra sotto i propri piedi. Il costo materiale è zero. L\'investimento è la presenza.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, Il Libro del Tè';

  @override
  String get reflectionWabi4Title => 'Vedere ciò che è già lì';

  @override
  String get reflectionWabi4Body =>
      'Il maestro del wabi-sabi non crea la bellezza quanto piuttosto la rivela. Un progettista di giardini osserva il paesaggio esistente prima di posare una singola pietra. Un maestro del tè sceglie la ciotola adatta alla stagione, non quella più ornata. Quando lucidi il tuo dorodango, non stai dipingendo la bellezza sul fango — stai estraendo il luccichio latente che le particelle del suolo già possedevano. L\'allineamento di minuscoli grani minerali, compressi e levigati, riflette naturalmente la luce. Non hai aggiunto il luccichio. Hai rimosso tutto ciò che lo nascondeva. Questa è la via del wabi-sabi: non aggiunta ma sottrazione, non decorazione ma rivelazione.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, La Bellezza delle Cose Quotidiane';

  @override
  String get reflectionMa1Title => 'Lo spazio tra';

  @override
  String get reflectionMa1Body =>
      'Ma (間) è il concetto giapponese di spazio negativo — la pausa tra le note che dà forma alla musica, il vuoto di una stanza che la rende utilizzabile, il silenzio in una conversazione che permette al significato di atterrare. Nel dorodango, la fase di asciugatura è puro ma. Nulla di visibile sta accadendo, eppure tutto sta cambiando sotto la superficie. L\'umidità migra verso l\'esterno per azione capillare, le particelle si depositano e si legano. La sfera lavora anche quando le tue mani non lo fanno. Imparare a fidarsi di questo processo invisibile — a valorizzare l\'attesa quanto il fare — è una delle lezioni più profonde che la pratica offre.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Space-Time in Japan';

  @override
  String get reflectionMa2Title => 'Il vuoto non è niente';

  @override
  String get reflectionMa2Body =>
      'Nel pensiero occidentale, lo spazio vuoto è spesso visto come assenza — qualcosa da riempire. Nell\'estetica giapponese, il vuoto è presenza. L\'alcova tokonoma in una stanza tradizionale contiene solo un rotolo e un fiore perché lo spazio intorno a loro è ciò che dà loro potere. In questo momento il tuo dorodango sta riposando, e questo riposo non è tempo sprecato. La pausa tra le tue azioni lascia che il materiale risponda. È un dialogo: modelli, poi ascolti. Comprimi, poi aspetti. La sfera insegna che produttività e quiete non sono opposti ma partner, ciascuno rendendo l\'altro significativo.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (capitolo 11), via interpretazione giapponese';

  @override
  String get reflectionKintsugi1Title => 'L\'oro nelle crepe';

  @override
  String get reflectionKintsugi1Body =>
      'Il kintsugi è l\'arte di riparare la ceramica rotta con lacca mista a oro. Invece di nascondere il danno, la riparazione diventa la parte più bella dell\'oggetto. La sua storia risale al XV secolo, quando uno shogun giapponese mandò in Cina una ciotola da tè incrinata per farla riparare e rimase deluso dalle brutte graffette metalliche che ricevette indietro. Gli artigiani giapponesi svilupparono una soluzione più bella. Se il tuo dorodango sviluppa una crepa durante l\'asciugatura, ti trovi di fronte a un momento kintsugi: puoi abbandonarlo, oppure lavorare con la crepa, incorporandola nella storia della sfera. Alcuni dei dorodango più suggestivi portano una storia visibile sulla loro superficie.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics';

  @override
  String get reflectionKintsugi2Title => 'Più forte nei punti rotti';

  @override
  String get reflectionKintsugi2Body =>
      'La filosofia del kintsugi si estende ben oltre la ceramica. Suggerisce che la rottura e la riparazione fanno parte della storia di un oggetto, non qualcosa da mascherare. Applicato al dorodango, ciò significa che le imperfezioni incontrate — una piccola ammaccatura dalla manipolazione, una chiazza irregolare di spolveratura, una sottile variazione di colore da diversi strati di suolo — non sono fallimenti. Sono capitoli. Ogni segno registra un momento del processo di creazione. I praticanti maestri del dorodango spesso dicono di poter leggere l\'intera storia di una sfera dalla sua superficie, come un geologo legge la storia della terra nella roccia esposta.';

  @override
  String get reflectionKintsugi2Source => 'Filosofia artigianale giapponese';

  @override
  String get reflectionShokunin1Title => 'Lo spirito dell\'artigiano';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin significa artigiano in giapponese, ma porta un significato più profondo di quanto la traduzione italiana suggerisca. Shokunin katagi — lo spirito dell\'artigiano — descrive una dedizione al proprio mestiere che va oltre la competenza per entrare nel territorio morale. Lo shokunin sente un obbligo sociale di dare il meglio di sé per il beneficio degli altri. Anche quando si crea qualcosa per sé stessi, si lavora come se la vita di qualcun altro dipendesse dalla qualità. Questa intensità di concentrazione, applicata a una semplice sfera di fango, trasforma quella che potrebbe essere un\'attività banale in una meditazione su cosa significhi tenere profondamente alla qualità del proprio lavoro.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanese Woodworking Tools';

  @override
  String get reflectionShokunin2Title => 'Diecimila ore di terra';

  @override
  String get reflectionShokunin2Body =>
      'Nelle arti e mestieri tradizionali giapponesi, la maestria si misura non in anni ma in ripetizioni. Un cuoco di sushi trascorre anni solo imparando a preparare il riso. Un lucidatore di spade completa un apprendistato di dieci anni prima di lavorare in modo indipendente. Il dorodango segue una versione condensata di questo arco: nel corso di poche ore, si attraversa frustrazione, noia, flusso e soddisfazione. Ogni sfera realizzata insegna qualcosa che la precedente non poteva. Il nucleo della seconda sfera sarà più denso. La spolveratura della terza sarà più uniforme. Alla quinta, le tue mani sapranno cose che la tua mente non può articolare. Questa è la via dello shokunin — una conoscenza che vive nel corpo.';

  @override
  String get reflectionShokunin2Source =>
      'Tradizione dell\'apprendistato giapponese';

  @override
  String get reflectionShokunin3Title => 'La polvere parla';

  @override
  String get reflectionShokunin3Body =>
      'Un praticante esperto della spolveratura può sentire la differenza tra particelle di suolo di diverse dimensioni con la punta delle dita. Le particelle più fini — quelle che passano attraverso un setaccio da 200 maglie — creano la superficie più liscia e la lucentezza più profonda. Ma l\'approccio shokunin non consiste solo nell\'usare la polvere più fine; consiste nel capire perché. Le particelle più piccole si compattano più strettamente, lasciando meno spazi in cui la luce si disperde. Ogni strato di spolveratura aggiunge forse venti micron di materiale. Cinque-dieci strati costruiscono un guscio più sottile di una carta da gioco, ma abbastanza solido da essere lucidato a specchio. L\'attenzione a questa scala è l\'essenza dell\'artigianato.';

  @override
  String get reflectionShokunin3Source => 'Scienza dei materiali del dorodango';

  @override
  String get reflectionShokunin4Title => 'Il tocco del lucidatore';

  @override
  String get reflectionShokunin4Body =>
      'I lucidatori di spade giapponesi, o togishi, trascorrono decenni a perfezionare l\'arte di rivelare il vero carattere di una lama. Lavorano con una serie di pietre via via più fini, ognuna delle quali rimuove meno materiale e rivela più dettagli. La fase finale utilizza una pietra delle dimensioni di un polpastrello che scivola sull\'acciaio con quasi nessuna pressione. Lucidare il dorodango segue lo stesso principio: man mano che la superficie diventa più fine, il tuo tocco deve diventare più leggero. Una pressione forte su una superficie liscia inciderà, non luciderà. L\'ultima fase di finitura sfiora appena la superficie. La maestria qui si misura in ciò che si impara a trattenere, non in ciò che si applica.';

  @override
  String get reflectionShokunin4Source =>
      'Tradizione della lucidatura di spade giapponesi (togishi)';

  @override
  String get reflectionSoil1Title => 'Un mondo sotto i tuoi piedi';

  @override
  String get reflectionSoil1Body =>
      'Un solo cucchiaino di suolo sano contiene più microrganismi di quante persone ci siano sulla Terra. Batteri, funghi, protozoi e nematodi formano una rete vivente che si costruisce da migliaia di anni. Il suolo che hai raccolto per il tuo dorodango porta questa storia. La composizione minerale riflette il substrato roccioso sottostante, alterato nel corso del tempo geologico. Il colore racconta una storia: i rossi e gli aranci indicano ossidi di ferro, i marroni scuri suggeriscono ricca materia organica, i grigi indicano depositi di argilla. Ogni dorodango è un ritratto del luogo preciso da cui proviene — una piccola sfera che racchiude la profonda storia del suo paesaggio.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Dirt: The Erosion of Civilizations';

  @override
  String get reflectionSoil2Title => 'L\'argilla ricorda';

  @override
  String get reflectionSoil2Body =>
      'L\'argilla è straordinaria tra i componenti del suolo per via della sua memoria. Le particelle di argilla sono piatte e a forma di piastrella, e quando vengono compresse si allineano in strati paralleli — come mescolare un mazzo di carte e appiattirlo. Questo allineamento è ciò che dà al tuo dorodango la sua resistenza e il suo potenziale di lucentezza. Le particelle, una volta allineate, resistono a tornare al disordine. Ricordano la pressione delle tue mani. Questa non è una metafora; è fisica. Ogni compressione durante la formazione del nucleo riorganizza permanentemente milioni di particelle in una configurazione più solida. La sfera prende letteralmente la forma della tua cura.';

  @override
  String get reflectionSoil2Source =>
      'Scienza del suolo, mineralogia delle argille';

  @override
  String get reflectionPatience1Title => 'La rivelazione lenta';

  @override
  String get reflectionPatience1Body =>
      'La vita moderna si ottimizza per la velocità. Consegne istantanee, aggiornamenti in tempo reale, risultati immediati. Il dorodango resiste a tutto questo. La sola fase di asciugatura richiede ore, e non c\'è modo di accelerarla senza danneggiare la sfera. Questa pazienza forzata non è un difetto ma una caratteristica. I ricercatori che studiano gli stati di flusso hanno scoperto che i compiti manuali lenti e ripetitivi — lavorare a maglia, intagliare il legno, la ceramica — attivano la rete in modalità predefinita nel cervello, la stessa rete associata alla creatività e all\'auto-riflessione. Il tuo dorodango non sta solo asciugando in questo momento; la tua mente potrebbe star facendo alcuni dei suoi lavori più interessanti in questo spazio senza fretta.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'Ciò che le mani sanno';

  @override
  String get reflectionPatience2Body =>
      'C\'è un proverbio giapponese: «Le mani imparano prima che la mente capisca.» Osserva un bambino che fa il dorodango per la prima volta e lo vedrai in azione. Prima di riuscire a spiegare cosa sta facendo, le sue mani stanno già regolando la pressione, la velocità di rotazione e l\'umidità in modo istintivo. Questa intelligenza tattile — sviluppata nel corso di milioni di anni di evoluzione umana — è una delle nostre capacità più sottovalutate. In un\'era di schermi e astrazione, il dorodango è un ritorno all\'attività umana fondamentale di plasmare il mondo fisico con le proprie mani. Non è un passo indietro ma una riconnessione con qualcosa di essenziale.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, The Hand';

  @override
  String get voiceOutOfCredits =>
      'Hai esaurito i crediti IA. Posso ancora rispondere a comandi come avanti, ripeti e aiuto.';

  @override
  String get voiceError =>
      'Qualcosa è andato storto. Tocca la sfera per riprovare.';

  @override
  String get voiceConnectionLost =>
      'Ho perso la connessione. Controlla internet e tocca la sfera.';
}
