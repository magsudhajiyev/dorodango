// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'A arte de polir a terra';

  @override
  String get retry => 'Tentar novamente';

  @override
  String get skip => 'Pular';

  @override
  String error(String message) {
    return 'Erro: $message';
  }

  @override
  String get soilSourceHint => 'Onde você encontrou a terra? (opcional)';

  @override
  String get startNewBuild => 'Novo Projeto';

  @override
  String get viewBuildLog => 'Ver Registro';

  @override
  String get buildLog => 'Registro';

  @override
  String get buildDetail => 'Detalhe do Projeto';

  @override
  String get noBuildsYet => 'Nenhum projeto ainda';

  @override
  String get startFirstDorodango => 'Comece seu primeiro dorodango!';

  @override
  String get noStagesRecorded => 'Nenhuma etapa registrada.';

  @override
  String get unknownSoil => 'Terra desconhecida';

  @override
  String get statusComplete => 'Concluído';

  @override
  String get statusInProgress => 'Em andamento';

  @override
  String get statusAbandoned => 'Abandonado';

  @override
  String get buildCompleteTitle => 'Seu Dorodango\nestá completo';

  @override
  String get buildCompleteBody =>
      'De terra bruta ao brilho de espelho.\nGuarde em um lugar fresco e seco —\ncontinuará endurecendo nas próximas semanas.';

  @override
  String get startAnotherBuild => 'Novo Projeto';

  @override
  String get nextStage => 'Próxima Etapa';

  @override
  String get completeBuild => 'Concluir Projeto';

  @override
  String get tapToSpeak => 'Toque para falar';

  @override
  String get captureProgress => 'Registre seu progresso';

  @override
  String get captureSubtitle => 'Tire uma foto para seu registro.';

  @override
  String get takePhoto => 'Tirar Foto';

  @override
  String get chooseFromGallery => 'Escolher da galeria';

  @override
  String suggestedDuration(String duration) {
    return 'Sugerido: ~$duration';
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
  String get settings => 'Configurações';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Padrão do sistema';

  @override
  String get stageCoreForming => 'Formação do núcleo';

  @override
  String get stageDrying => 'Secagem';

  @override
  String get stageDustingCapping => 'Polvilhamento e cobertura';

  @override
  String get stagePolishing => 'Polimento';

  @override
  String get stageFinished => 'Concluído';

  @override
  String get coreFormingSummary =>
      'Reúna terra e comprima em uma esfera compacta.';

  @override
  String get coreFormingStep1 =>
      'Encontre solo com uma mistura de argila e areia fina — evite argila pura ou areia.';

  @override
  String get coreFormingStep2 =>
      'Adicione água gradualmente até que a terra se mantenha unida quando apertada.';

  @override
  String get coreFormingStep3 =>
      'Forme uma bola do tamanho aproximado de uma bola de tênis.';

  @override
  String get coreFormingStep4 =>
      'Aperte e compacte firmemente, girando constantemente para manter a forma redonda.';

  @override
  String get coreFormingStep5 =>
      'Continue comprimindo por 15–20 minutos até que o núcleo fique sólido.';

  @override
  String get coreFormingTip =>
      'O núcleo deve parecer denso e pesado para seu tamanho. Se desmorona, adicione um pouco mais de água.';

  @override
  String get coreFormingMistake =>
      'Muita água torna o núcleo pegajoso e difícil de modelar. Comece mais seco do que imagina.';

  @override
  String get coreFormingVoice =>
      'Hora de formar o núcleo. Encontre solo com uma boa mistura de argila e areia fina. Adicione água gradualmente e aperte em uma bola compacta, do tamanho de uma bola de tênis. Continue girando e comprimindo por quinze a vinte minutos até ficar sólido e denso.';

  @override
  String get dryingSummary =>
      'Deixe a umidade migrar para a superfície mantendo a forma.';

  @override
  String get dryingStep1 =>
      'Coloque a esfera em uma superfície macia ou segure-a delicadamente.';

  @override
  String get dryingStep2 =>
      'Espere 20–30 minutos para a umidade migrar para a superfície.';

  @override
  String get dryingStep3 =>
      'Quando a superfície estiver úmida, escove suavemente o material solto.';

  @override
  String get dryingStep4 =>
      'Repita o ciclo — esta etapa pode levar várias horas.';

  @override
  String get dryingStep5 =>
      'A esfera está pronta para polvilhar quando a superfície não estiver mais molhada.';

  @override
  String get dryingTip =>
      'Paciência é tudo aqui. Apressar-se causará rachaduras.';

  @override
  String get dryingMistake =>
      'Secar rápido demais no sol direto causa rachaduras. Seque lentamente na sombra.';

  @override
  String get dryingVoice =>
      'Agora secamos. Coloque sua esfera delicadamente e espere vinte a trinta minutos para a umidade alcançar a superfície. Quando estiver úmida, escove o material solto. Repita este ciclo. A esfera está pronta para polvilhar quando a superfície não estiver mais molhada. Isso requer paciência — geralmente várias horas.';

  @override
  String get dustingCappingSummary =>
      'Aplique camadas de terra fina e seca para criar uma casca lisa.';

  @override
  String get dustingCappingStep1 =>
      'Peneire a terra através de uma malha fina para obter pó ultrafino.';

  @override
  String get dustingCappingStep2 =>
      'Polvilhe uma camada fina de pó sobre a esfera.';

  @override
  String get dustingCappingStep3 =>
      'Esfregue suavemente o pó na superfície com a palma ou polegar.';

  @override
  String get dustingCappingStep4 =>
      'Deixe descansar 10–15 minutos entre as camadas.';

  @override
  String get dustingCappingStep5 =>
      'Aplique 5–10 camadas até que a superfície fique uniformemente lisa.';

  @override
  String get dustingCappingTip =>
      'Quanto mais fino o pó, melhor o brilho final. Use as partículas mais finas que puder encontrar.';

  @override
  String get dustingCappingMistake =>
      'Aplicar pó muito grosso causa descamação. Camadas finas e uniformes são a chave.';

  @override
  String get dustingCappingVoice =>
      'Hora de polvilhar e cobrir. Peneire sua terra para obter o pó mais fino possível. Polvilhe uma camada fina sobre a esfera e esfregue suavemente com a palma. Descanse dez a quinze minutos entre as camadas. Aplique cinco a dez camadas até que a superfície fique uniformemente lisa.';

  @override
  String get polishingSummary =>
      'Brunir a superfície para revelar um brilho natural.';

  @override
  String get polishingStep1 =>
      'Certifique-se de que a superfície esteja completamente seca ao toque.';

  @override
  String get polishingStep2 =>
      'Com uma superfície lisa (saco plástico, pote de vidro ou pano macio), esfregue suavemente a esfera.';

  @override
  String get polishingStep3 =>
      'Aplique pressão leve e constante em movimentos circulares.';

  @override
  String get polishingStep4 =>
      'Trabalhe toda a superfície, girando frequentemente para brilho uniforme.';

  @override
  String get polishingStep5 =>
      'Continue por 30–60 minutos. O brilho se desenvolve gradualmente.';

  @override
  String get polishingTip =>
      'Menos pressão é mais. Deixe a ferramenta deslizar — forçar pode danificar a superfície.';

  @override
  String get polishingMistake =>
      'Polir antes de secar completamente prende umidade e cria manchas opacas.';

  @override
  String get polishingVoice =>
      'Hora de polir. Certifique-se de que a superfície esteja completamente seca. Com uma superfície lisa como um saco plástico ou pote de vidro, esfregue suavemente a esfera em movimentos circulares. Mantenha a pressão leve e constante. Trabalhe toda a superfície por trinta a sessenta minutos. O brilho se desenvolverá gradualmente.';

  @override
  String get finishedSummary =>
      'Seu dorodango está completo. Admire seu trabalho!';

  @override
  String get finishedStep1 => 'Tire uma foto final da sua esfera concluída.';

  @override
  String get finishedStep2 =>
      'Guarde em um lugar fresco e seco, longe da luz solar direta.';

  @override
  String get finishedStep3 =>
      'A esfera continuará endurecendo nas próximas semanas.';

  @override
  String get finishedStep4 =>
      'Manuseie com cuidado — a superfície polida pode ser frágil.';

  @override
  String get finishedTip =>
      'Exiba em uma superfície macia. Alguns criadores fazem suportes de madeira.';

  @override
  String get finishedMistake =>
      'Deixar cair! Manuseie com cuidado. A casca polida é fina.';

  @override
  String get finishedVoice =>
      'Parabéns! Seu dorodango está completo. Tire uma foto final e guarde em um lugar fresco e seco. Continuará endurecendo nas próximas semanas. Manuseie com cuidado e aproveite sua criação.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Você está na etapa $order de 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'A secagem geralmente leva de duas a quatro horas. Seja paciente e verifique a cada vinte a trinta minutos.';

  @override
  String get dryingTimeNotOnStage =>
      'Você não está na etapa de secagem. A secagem vem após a formação do núcleo.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Erro comum nesta etapa: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'O diagnóstico por foto estará disponível em uma atualização futura. Por enquanto, verifique os erros comuns da sua etapa atual.';

  @override
  String get alreadyComplete => 'Seu dorodango já está completo!';

  @override
  String get voiceUnknownCommand =>
      'Não entendi. Tente dizer próximo, repetir, ajuda ou problema.';

  @override
  String get continueBuild => 'Continuar projeto';

  @override
  String stageProgress(int order, String stageName) {
    return 'Etapa $order/5 — $stageName';
  }

  @override
  String get reflections => 'Reflexões';

  @override
  String get readMore => 'Ler mais';

  @override
  String get listenLabel => 'Ouvir';

  @override
  String get sourcePrefix => 'Fonte: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes min de leitura';
  }

  @override
  String get analyzingPhoto => 'Analisando sua foto...';

  @override
  String get diagnosisError =>
      'Não foi possível analisar a foto. Toque para tentar novamente.';

  @override
  String get photoUnclear => 'Foto pouco clara';

  @override
  String get detectSoil => 'Detectar a terra da minha localização';

  @override
  String get soilDetecting => 'Lendo a terra local…';

  @override
  String get soilTypeLabel => 'Tipo de terra local';

  @override
  String get soilClay => 'Argila';

  @override
  String get soilSand => 'Areia';

  @override
  String get soilSilt => 'Silte';

  @override
  String get soilSuitabilityGood =>
      'Rica em argila — vai se manter firme e ganhar um belo brilho.';

  @override
  String get soilSuitabilityOkay =>
      'Argila moderada — peneire fino e compacte com firmeza.';

  @override
  String get soilSuitabilitySandy =>
      'Arenosa — pode esfarelar. Misture terra rica em argila se puder.';

  @override
  String get soilLocationDenied =>
      'Localização indisponível. Permita o acesso à localização para detectar sua terra.';

  @override
  String get soilLookupFailed =>
      'Não foi possível ler os dados do solo desta localização.';

  @override
  String get soilMap => 'Mapa de solos';

  @override
  String get soilMapHint => 'Toque no mapa para examinar a terra';

  @override
  String get predictResult => 'Prever meu dorodango';

  @override
  String get predictingResult => 'Consultando o coach de IA…';

  @override
  String get predictionTitle => 'Previsão de IA';

  @override
  String get predictionFailed => 'A previsão falhou. Tente novamente.';

  @override
  String get outOfCredits => 'Sem créditos.';

  @override
  String get hunt => 'Caça ao Dorodango';

  @override
  String get plantDorodango => 'Plantar este dorodango';

  @override
  String get plantExplainer =>
      'Esconda seu dorodango pronto em um lugar público. Caçadores próximos serão avisados — talvez alguém o encontre.';

  @override
  String get plantHintHint => 'Deixe uma dica para os caçadores (opcional)';

  @override
  String get plantItHere => 'Plantar aqui';

  @override
  String get planting => 'Plantando…';

  @override
  String get planted => 'Plantado! Os caçadores próximos vão ficar sabendo.';

  @override
  String get plantFailed => 'Não deu certo. Tente novamente.';

  @override
  String get noPlantsNearby =>
      'Ainda não há dorodangos plantados por perto. Seja o primeiro!';

  @override
  String get foundIt => 'Encontrei!';

  @override
  String metersAway(int distance) {
    return 'A $distance m';
  }

  @override
  String get getCloser => 'Aproxime-se para resgatá-lo';

  @override
  String get foundCongrats => 'Você encontrou um dorodango!';

  @override
  String get hintLabel => 'Dica';

  @override
  String get huntLocationNeeded =>
      'Permita o acesso à localização para participar da caça.';

  @override
  String get myCollection => 'Minha coleção';

  @override
  String collectionCount(int count) {
    return '$count encontrados';
  }

  @override
  String get collectionEmpty =>
      'Nada aqui ainda — encontre seu primeiro dorodango!';

  @override
  String foundOnDate(String date) {
    return 'Encontrado em $date';
  }

  @override
  String get goHunting => 'Ir caçar';

  @override
  String get handsFreeHint => 'Mãos livres — diga \"stop\" para encerrar';

  @override
  String get voiceGoodbye =>
      'Bom polimento! Toque no orbe quando precisar de mim.';

  @override
  String get profile => 'Perfil';

  @override
  String get guestUser => 'Construtor convidado';

  @override
  String creditsBalance(int count) {
    return '$count créditos';
  }

  @override
  String get buyCredits => 'Obter créditos';

  @override
  String get statsBuilds => 'Dorodangos';

  @override
  String get statsPlanted => 'Plantados';

  @override
  String get statsFound => 'Encontrados';

  @override
  String get paywallTitle => 'Créditos do coach de IA';

  @override
  String get paywallSubtitle =>
      'Os créditos alimentam o coach de voz, o diagnóstico por foto e as previsões — 1 crédito por interação.';

  @override
  String get paywallUnavailable =>
      'As compras ainda não estão disponíveis nesta versão.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get purchaseSuccess => 'Créditos adicionados. Boa construção!';

  @override
  String get purchaseFailed =>
      'A compra não foi concluída. Você não foi cobrado.';

  @override
  String get packBestValue => 'Melhor custo';

  @override
  String get welcomeBegin => 'Começar';

  @override
  String welcomeFreeCredits(int count) {
    return '$count créditos grátis do coach de IA incluídos';
  }

  @override
  String get welcomeFeatureGuide =>
      'Um guia calmo, passo a passo, da lama ao brilho de espelho';

  @override
  String get welcomeFeatureCoach =>
      'Um coach de IA mãos-livres enquanto suas mãos estão na argila';

  @override
  String get welcomeFeatureHunt =>
      'Plante seu dorodango pronto e cace os que estão por perto';

  @override
  String get logout => 'Sair';

  @override
  String get logoutWarning =>
      'Ao sair de uma conta de convidado, você perde seus dorodangos, créditos e coleção. Continuar?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get signInTitle => 'Entrar';

  @override
  String get registerTitle => 'Criar conta';

  @override
  String get emailHint => 'E-mail';

  @override
  String get passwordHint => 'Senha';

  @override
  String get authToggleToRegister => 'Novo por aqui? Crie uma conta';

  @override
  String get authToggleToLogin => 'Já tem uma conta? Entre';

  @override
  String get continueAsGuest => 'Continuar como convidado';

  @override
  String get authErrorInvalidCredentials => 'E-mail ou senha incorretos.';

  @override
  String get authErrorEmailInUse => 'Já existe uma conta com este e-mail.';

  @override
  String get authErrorWeakPassword =>
      'A senha deve ter pelo menos 6 caracteres.';

  @override
  String get authErrorGeneric => 'Falha ao entrar. Tente novamente.';

  @override
  String get wakeWordTooltip => 'Palavra de ativação \"Hey Doro\"';

  @override
  String get sayHeyDoro => 'Diga \"Hey Doro\" quando precisar de mim';

  @override
  String get wakeAck => 'Sim?';

  @override
  String get themeDorodangoOrigins => 'Origens do Dorodango';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Solo';

  @override
  String get themePatience => 'Paciência';

  @override
  String get reflectionOrigins1Title => 'Filhos do Pátio Escolar';

  @override
  String get reflectionOrigins1Body =>
      'O hikaru dorodango surgiu nos pátios das escolas japonesas, onde crianças descobriram que a lama comum podia ser transformada em algo extraordinário apenas com paciência. O professor Fumio Kayo, da Universidade de Educação de Kyoto, documentou essa tradição no final dos anos 1990, constatando que quase todas as regiões do Japão tinham crianças desenvolvendo a técnica de forma independente. Ninguém as ensinou — aprenderam umas com as outras, transmitindo o conhecimento lateralmente, não de cima para baixo. Há algo profundo nisso: o desejo de transformar a terra bruta em espelho não é aprendido, mas descoberto.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Universidade de Educação de Kyoto';

  @override
  String get reflectionOrigins2Title => 'A Própria Palavra';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru significa \"brilhar\" ou \"brilhante\". Dorodango se decompõe em doro (lama) e dango (bolinho). Um bolinho de lama brilhante — o nome é desarmadoramente humilde para algo que pode atingir um acabamento de espelho. Essa humildade é intencional na nomenclatura japonesa. As coisas mais extraordinárias recebem os nomes mais simples, porque o objeto fala por si mesmo. Quando você segura um dorodango pronto, ninguém precisa explicar o que é. A esfera de terra polida se comunica diretamente, além da linguagem — um testemunho do que a paciência e a atenção podem extrair do material mais comum.';

  @override
  String get reflectionOrigins2Source => 'Etimologia japonesa';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner e o Ocidente';

  @override
  String get reflectionOrigins3Body =>
      'O artista americano Bruce Gardner encontrou o dorodango ao pesquisar tradições artesanais japonesas e tornou-se um dos primeiros praticantes ocidentais a documentar o processo em detalhes. Seu trabalho ajudou a unir culturas, mostrando que o apelo de transformar a terra é universal. Gardner observou que estudantes ocidentais geralmente têm mais dificuldade na fase de secagem — não pela técnica, mas pela impaciência. A esfera pede que você espere, e nessa espera algo se transforma. Você para de tentar forçar o material e começa a ouvi-lo. Essa lição, observou Gardner, é o verdadeiro presente da prática.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'A Terra como Espelho';

  @override
  String get reflectionOrigins4Body =>
      'A etapa final do dorodango alcança algo quase paradoxal: a terra se torna um espelho. O material mais opaco do nosso mundo — a sujeira — reflete a luz quando recebe atenção paciente suficiente. A filosofia japonesa antiga não encontra contradição aqui. O potencial de brilho sempre esteve presente no solo; o artesão simplesmente revelou o que já estava lá. Esta é uma ideia recorrente na estética japonesa: o artesão não impõe beleza ao material, mas a desperta. Suas mãos estiveram em conversa com esta terra, e o brilho é a terra respondendo.';

  @override
  String get reflectionOrigins4Source => 'Filosofia estética japonesa';

  @override
  String get reflectionWabi1Title => 'A Beleza da Imperfeição';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi é a estética japonesa enraizada na aceitação da imperfeição e da impermanência. Uma tigela de chá rachada, uma viga de madeira envelhecida, musgo crescendo entre pedras — esses não são defeitos, mas assinaturas do tempo e do uso. Seu dorodango não será uma esfera perfeita. Carregará a impressão única de suas mãos, a composição particular do seu solo, a umidade do dia em que foi feito. Essas variações não são erros a corrigir, mas precisamente o que torna sua esfera única. Não existem dois dorodango iguais, e esse é exatamente o ponto.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers';

  @override
  String get reflectionWabi2Title => 'Nada Dura';

  @override
  String get reflectionWabi2Body =>
      'Um dos três pilares do wabi-sabi é a impermanência — nada dura, nada está acabado, nada é perfeito. Seu dorodango, mesmo quando completo, ainda está mudando. Continuará endurecendo por semanas. Ao longo de meses e anos, sua superfície pode desenvolver sutis variações de tom. Se cair, quebrará, e a seção transversal revelará as camadas do seu trabalho como estratos geológicos. Essa impermanência não diminui o objeto; o aprofunda. Você não está construindo algo eterno. Está construindo algo que existe belamente no tempo, assim como você.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Pobreza de Meios, Riqueza de Resultado';

  @override
  String get reflectionWabi3Body =>
      'Wabi originalmente descrevia a solidão de viver na natureza, longe da sociedade. Ao longo dos séculos, evoluiu para apreciar a beleza da simplicidade e a pobreza de meios. O dorodango é talvez a expressão mais pura disso: seu material é terra e água. Sem ferramentas caras, sem equipamentos especializados, sem ingredientes raros. A riqueza do resultado vem inteiramente da sua atenção. Em um mundo que frequentemente equipara custo a qualidade, há algo silenciosamente radical em fazer um objeto belo com a terra sob seus pés. O custo material é zero. O investimento é a presença.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, The Book of Tea';

  @override
  String get reflectionWabi4Title => 'Ver o Que Já Está Lá';

  @override
  String get reflectionWabi4Body =>
      'O mestre do wabi-sabi não cria beleza, mas a revela. Um designer de jardins vê a paisagem existente antes de colocar uma única pedra. Um mestre do chá escolhe a tigela que convém à estação, não a mais ornamentada. Quando você poli seu dorodango, não está pintando beleza sobre a lama — está extraindo o brilho latente que as partículas do solo já possuíam. O alinhamento de minúsculos grãos minerais, comprimidos e alisados, reflete a luz naturalmente. Você não adicionou o brilho. Você removeu tudo que o escondia. Este é o caminho do wabi-sabi: não adição, mas subtração; não decoração, mas revelação.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, The Beauty of Everyday Things';

  @override
  String get reflectionMa1Title => 'O Espaço Entre';

  @override
  String get reflectionMa1Body =>
      'Ma (間) é o conceito japonês de espaço negativo — a pausa entre notas que dá forma à música, o vazio de um cômodo que o torna utilizável, o silêncio na conversa que permite que o significado pouse. No dorodango, a fase de secagem é ma puro. Nada visível acontece, mas tudo muda sob a superfície. A umidade migra para fora por ação capilar, as partículas se assentam e se unem. A esfera trabalha mesmo quando suas mãos não estão. Aprender a confiar nesse processo invisível — valorizar a espera tanto quanto o fazer — é uma das lições mais profundas que a prática oferece.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Space-Time in Japan';

  @override
  String get reflectionMa2Title => 'O Vazio Não é Nada';

  @override
  String get reflectionMa2Body =>
      'No pensamento ocidental, o espaço vazio é frequentemente visto como ausência — algo a ser preenchido. Na estética japonesa, o vazio é presença. O nicho tokonoma em um cômodo tradicional guarda apenas um pergaminho e uma flor porque o espaço ao redor deles é o que lhes dá poder. Agora seu dorodango está descansando, e esse repouso não é tempo perdido. A pausa entre suas ações permite que o material responda. É um diálogo: você molda, depois escuta. Você comprime, depois espera. A esfera ensina que produtividade e quietude não são opostos, mas parceiros — cada um tornando o outro significativo.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Capítulo 11), via interpretação japonesa';

  @override
  String get reflectionKintsugi1Title => 'Ouro nas Rachaduras';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi é a arte de reparar cerâmica quebrada com laca misturada a ouro. Em vez de esconder o dano, o reparo se torna a parte mais bela do objeto. Sua história remonta ao século XV, quando um shogun japonês enviou uma tigela de chá rachada à China para reparo e ficou desapontado com os grampos de metal feios que recebeu de volta. Artesãos japoneses desenvolveram uma solução mais bela. Se seu dorodango desenvolver uma rachadura durante a secagem, você enfrenta um momento de kintsugi: pode abandoná-lo ou trabalhar com a rachadura, incorporando-a à história da esfera. Alguns dos dorodango mais marcantes carregam história visível em suas superfícies.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics';

  @override
  String get reflectionKintsugi2Title => 'Mais Forte nos Lugares Quebrados';

  @override
  String get reflectionKintsugi2Body =>
      'A filosofia do kintsugi se estende muito além da cerâmica. Ela sugere que a quebra e o reparo fazem parte da história de um objeto, não algo a disfarçar. Aplicado ao dorodango, isso significa que as imperfeições encontradas — um pequeno amassado do manuseio, uma área irregular de polvilhamento, uma variação sutil de cor por diferentes camadas de solo — não são falhas. São capítulos. Cada marca registra um momento do processo de criação. Praticantes experientes de dorodango frequentemente dizem que conseguem ler toda a história de uma esfera em sua superfície, da mesma forma que um geólogo lê a história da terra na rocha exposta.';

  @override
  String get reflectionKintsugi2Source => 'Filosofia artesanal japonesa';

  @override
  String get reflectionShokunin1Title => 'O Espírito do Artesão';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin significa artesão ou artífice em japonês, mas carrega um significado mais profundo do que sua tradução inglesa sugere. Shokunin katagi — o espírito do artesão — descreve uma devoção ao ofício que vai além da habilidade para o território moral. O shokunin sente uma obrigação social de trabalhar o melhor possível em benefício dos outros. Mesmo ao fazer algo para si mesmo, você trabalha como se a vida de outra pessoa dependesse da qualidade. Essa intensidade de foco, aplicada a uma simples esfera de lama, transforma o que poderia ser uma atividade trivial em uma meditação sobre o que significa se importar profundamente com a qualidade do seu trabalho.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanese Woodworking Tools';

  @override
  String get reflectionShokunin2Title => 'Dez Mil Horas de Terra';

  @override
  String get reflectionShokunin2Body =>
      'Nos ofícios tradicionais japoneses, o domínio é medido não em anos, mas em repetições. Um chef de sushi passa anos apenas aprendendo a preparar o arroz. Um polidor de espadas completa um aprendizado de dez anos antes de trabalhar independentemente. O dorodango segue uma versão comprimida desse arco: em horas, você percorre frustração, tédio, fluxo e satisfação. Cada esfera que você faz ensina algo que a anterior não podia. O núcleo da segunda esfera será mais denso. O polvilhamento da terceira será mais uniforme. Na quinta, suas mãos saberão coisas que sua mente não consegue articular. Este é o caminho do shokunin — conhecimento que vive no corpo.';

  @override
  String get reflectionShokunin2Source => 'Tradição de aprendizado japonesa';

  @override
  String get reflectionShokunin3Title => 'O Pó Fala';

  @override
  String get reflectionShokunin3Body =>
      'Um praticante habilidoso do polvilhamento consegue sentir a diferença entre partículas de solo de diferentes tamanhos pelas pontas dos dedos. As partículas mais finas — aquelas que passam por uma peneira de 200 malhas — criam a superfície mais lisa e o brilho mais profundo. Mas a abordagem do shokunin não é apenas usar o pó mais fino; é entender o porquê. Partículas menores se compactam mais densamente, deixando menos lacunas para a luz se dispersar. Cada camada de polvilhamento adiciona talvez vinte mícrons de material. Cinco a dez camadas constroem uma casca mais fina que uma carta de baralho, mas resistente o suficiente para ser brunida como espelho. Atenção nessa escala é a essência do artesanato.';

  @override
  String get reflectionShokunin3Source => 'Ciência dos materiais do dorodango';

  @override
  String get reflectionShokunin4Title => 'O Toque do Polidor';

  @override
  String get reflectionShokunin4Body =>
      'Polidores de espadas japonesas, ou togishi, passam décadas aperfeiçoando a arte de revelar o verdadeiro caráter de uma lâmina. Trabalham com uma série de pedras progressivamente mais finas, cada uma removendo menos material e revelando mais detalhes. A etapa final usa uma pedra do tamanho de uma ponta de dedo que desliza pela aço com quase nenhuma pressão. Polir o dorodango segue o mesmo princípio: à medida que a superfície fica mais fina, seu toque deve ficar mais leve. Pressão intensa numa superfície lisa vai sulcar, não polir. A última etapa do acabamento mal roza a superfície. O domínio aqui é medido no que você aprende a reter, não no que aplica.';

  @override
  String get reflectionShokunin4Source =>
      'Tradição japonesa de polimento de espadas (togishi)';

  @override
  String get reflectionSoil1Title => 'Um Mundo Sob Seus Pés';

  @override
  String get reflectionSoil1Body =>
      'Uma única colher de chá de solo saudável contém mais microrganismos do que há pessoas na Terra. Bactérias, fungos, protozoários e nematóides formam uma teia viva que vem sendo construída há milhares de anos. A terra que você coletou para o seu dorodango carrega essa história. A composição mineral reflete a rocha-base abaixo, desgastada ao longo do tempo geológico. A cor conta uma história: vermelhos e laranjas indicam óxidos de ferro, marrons escuros sugerem matéria orgânica rica, cinzas apontam para depósitos de argila. Cada dorodango é um retrato do lugar específico de onde veio — uma pequena esfera que carrega a história profunda de sua paisagem.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Dirt: The Erosion of Civilizations';

  @override
  String get reflectionSoil2Title => 'A Argila Lembra';

  @override
  String get reflectionSoil2Body =>
      'A argila é notável entre os componentes do solo por causa de sua memória. As partículas de argila são planas e em forma de placa e, quando comprimidas, se alinham em camadas paralelas — muito como embaralhar um baralho de cartas e pressioná-lo plano. Esse alinhamento é o que dá ao seu dorodango sua resistência e seu potencial de brilho. As partículas, uma vez alinhadas, resistem em retornar à desordem. Elas lembram a pressão de suas mãos. Isso não é metáfora; é física. Cada compressão durante a formação do núcleo reorganiza permanentemente milhões de partículas em uma configuração mais resistente. A esfera literalmente assume a forma do seu cuidado.';

  @override
  String get reflectionSoil2Source => 'Ciência do solo, mineralogia da argila';

  @override
  String get reflectionPatience1Title => 'A Revelação Lenta';

  @override
  String get reflectionPatience1Body =>
      'A vida moderna otimiza pela velocidade. Entrega imediata, atualizações em tempo real, resultados instantâneos. O dorodango resiste a tudo isso. A fase de secagem sozinha leva horas, e não há como apressá-la sem danificar a esfera. Essa paciência imposta não é um defeito, mas uma característica. Pesquisadores que estudam estados de fluxo descobriram que tarefas manuais lentas e repetitivas — tricô, entalhe em madeira, cerâmica — ativam a rede de modo padrão no cérebro, a mesma rede associada à criatividade e à autorreflexão. Seu dorodango não está apenas secando agora; sua mente pode estar fazendo alguns de seus trabalhos mais interessantes nesse espaço sem pressa.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'O Que as Mãos Sabem';

  @override
  String get reflectionPatience2Body =>
      'Há um provérbio japonês: \"As mãos aprendem antes de a mente entender.\" Observe uma criança fazendo dorodango pela primeira vez e você verá isso em ação. Antes de conseguir explicar o que estão fazendo, suas mãos já estão ajustando pressão, velocidade de rotação e umidade instintivamente. Essa inteligência tátil — desenvolvida ao longo de milhões de anos de evolução humana — é uma de nossas capacidades mais subvalorizadas. Em uma era de telas e abstração, o dorodango é um retorno à atividade humana fundamental de moldar o mundo físico com as próprias mãos. Não é um passo atrás, mas uma reconexão com algo essencial.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, The Hand';

  @override
  String get voiceOutOfCredits =>
      'Seus créditos de IA acabaram. Ainda posso responder a comandos como próximo, repetir e ajuda.';

  @override
  String get voiceError =>
      'Algo deu errado. Toque no orbe para tentar novamente.';

  @override
  String get voiceConnectionLost =>
      'Perdi a conexão. Verifique sua internet e toque no orbe.';
}
