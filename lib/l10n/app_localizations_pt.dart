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
}
