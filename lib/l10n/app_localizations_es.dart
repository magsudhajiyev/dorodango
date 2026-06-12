// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'El arte de pulir la tierra';

  @override
  String get retry => 'Reintentar';

  @override
  String get skip => 'Omitir';

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String get soilSourceHint => '¿Dónde encontraste tu tierra? (opcional)';

  @override
  String get startNewBuild => 'Nuevo proyecto';

  @override
  String get viewBuildLog => 'Ver registro';

  @override
  String get buildLog => 'Registro';

  @override
  String get buildDetail => 'Detalle del proyecto';

  @override
  String get noBuildsYet => 'Sin proyectos aún';

  @override
  String get startFirstDorodango => '¡Comienza tu primer dorodango!';

  @override
  String get noStagesRecorded => 'No hay etapas registradas.';

  @override
  String get unknownSoil => 'Tierra desconocida';

  @override
  String get statusComplete => 'Completado';

  @override
  String get statusInProgress => 'En progreso';

  @override
  String get statusAbandoned => 'Abandonado';

  @override
  String get buildCompleteTitle => 'Tu Dorodango\nestá completo';

  @override
  String get buildCompleteBody =>
      'De tierra cruda a brillo de espejo.\nGuárdalo en un lugar fresco y seco —\ncontinuará endureciéndose en las próximas semanas.';

  @override
  String get startAnotherBuild => 'Nuevo proyecto';

  @override
  String get nextStage => 'Siguiente etapa';

  @override
  String get completeBuild => 'Completar proyecto';

  @override
  String get tapToSpeak => 'Toca para hablar';

  @override
  String get captureProgress => 'Captura tu progreso';

  @override
  String get captureSubtitle => 'Toma una foto para tu registro.';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get chooseFromGallery => 'Elegir de la galería';

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
  String get settings => 'Ajustes';

  @override
  String get language => 'Idioma';

  @override
  String get systemDefault => 'Predeterminado del sistema';

  @override
  String get stageCoreForming => 'Formación del núcleo';

  @override
  String get stageDrying => 'Secado';

  @override
  String get stageDustingCapping => 'Empolvado y recubrimiento';

  @override
  String get stagePolishing => 'Pulido';

  @override
  String get stageFinished => 'Terminado';

  @override
  String get coreFormingSummary =>
      'Reúne tierra y comprímela en una esfera compacta.';

  @override
  String get coreFormingStep1 =>
      'Encuentra tierra con una mezcla de arcilla y arena fina — evita arcilla pura o arena.';

  @override
  String get coreFormingStep2 =>
      'Agrega agua gradualmente hasta que la tierra se mantenga unida al apretarla.';

  @override
  String get coreFormingStep3 =>
      'Forma una bola del tamaño aproximado de una pelota de tenis.';

  @override
  String get coreFormingStep4 =>
      'Aprieta y compacta firmemente, rotando constantemente para mantener la forma redonda.';

  @override
  String get coreFormingStep5 =>
      'Continúa comprimiendo durante 15–20 minutos hasta que el núcleo se sienta sólido.';

  @override
  String get coreFormingTip =>
      'El núcleo debe sentirse denso y pesado para su tamaño. Si se desmorona, agrega un poco más de agua.';

  @override
  String get coreFormingMistake =>
      'Demasiada agua hace el núcleo pegajoso y difícil de moldear. Comienza más seco de lo que crees.';

  @override
  String get coreFormingVoice =>
      'Es hora de formar tu núcleo. Encuentra tierra con una buena mezcla de arcilla y arena fina. Agrega agua gradualmente y apriétala en una bola compacta, del tamaño de una pelota de tenis. Sigue rotando y comprimiendo durante quince a veinte minutos hasta que se sienta sólida y densa.';

  @override
  String get dryingSummary =>
      'Deja que la humedad migre a la superficie manteniendo la forma.';

  @override
  String get dryingStep1 =>
      'Coloca la esfera sobre una superficie suave o sostenla con cuidado.';

  @override
  String get dryingStep2 =>
      'Espera 20–30 minutos para que la humedad migre a la superficie.';

  @override
  String get dryingStep3 =>
      'Cuando la superficie se sienta húmeda, cepilla suavemente el material suelto.';

  @override
  String get dryingStep4 =>
      'Repite el ciclo — esta etapa puede tomar varias horas.';

  @override
  String get dryingStep5 =>
      'La esfera está lista para empolvar cuando la superficie ya no se sienta húmeda.';

  @override
  String get dryingTip =>
      'La paciencia es todo aquí. Apresurarse causará grietas.';

  @override
  String get dryingMistake =>
      'Secado demasiado rápido al sol directo causa grietas. Seca lentamente a la sombra.';

  @override
  String get dryingVoice =>
      'Ahora secamos. Coloca tu esfera con cuidado y espera veinte a treinta minutos para que la humedad llegue a la superficie. Cuando esté húmeda, cepilla el material suelto. Repite este ciclo. La esfera está lista para empolvar cuando la superficie ya no esté húmeda. Esto requiere paciencia — generalmente varias horas.';

  @override
  String get dustingCappingSummary =>
      'Aplica capas de tierra fina y seca para crear una capa exterior lisa.';

  @override
  String get dustingCappingStep1 =>
      'Tamiza la tierra a través de una malla fina para obtener polvo ultra-fino.';

  @override
  String get dustingCappingStep2 =>
      'Espolvorea una capa fina de polvo sobre la esfera.';

  @override
  String get dustingCappingStep3 =>
      'Frota suavemente el polvo en la superficie con la palma o el pulgar.';

  @override
  String get dustingCappingStep4 => 'Deja reposar 10–15 minutos entre capas.';

  @override
  String get dustingCappingStep5 =>
      'Aplica 5–10 capas hasta que la superficie esté uniformemente lisa.';

  @override
  String get dustingCappingTip =>
      'Cuanto más fino el polvo, mejor el brillo final. Usa las partículas más finas que puedas encontrar.';

  @override
  String get dustingCappingMistake =>
      'Aplicar polvo demasiado grueso causa descamación. Capas finas y uniformes son la clave.';

  @override
  String get dustingCappingVoice =>
      'Hora de empolvar y recubrir. Tamiza tu tierra para obtener el polvo más fino posible. Espolvorea una capa fina sobre la esfera y frótala suavemente con tu palma. Descansa diez a quince minutos entre capas. Aplica cinco a diez capas hasta que la superficie esté uniformemente lisa.';

  @override
  String get polishingSummary =>
      'Bruñe la superficie para revelar un brillo natural.';

  @override
  String get polishingStep1 =>
      'Asegúrate de que la superficie esté completamente seca al tacto.';

  @override
  String get polishingStep2 =>
      'Con una superficie lisa (bolsa plástica, frasco de vidrio o tela suave), frota suavemente la esfera.';

  @override
  String get polishingStep3 =>
      'Aplica presión ligera y constante en movimientos circulares.';

  @override
  String get polishingStep4 =>
      'Trabaja toda la superficie, rotando frecuentemente para un brillo uniforme.';

  @override
  String get polishingStep5 =>
      'Continúa durante 30–60 minutos. El brillo se desarrolla gradualmente.';

  @override
  String get polishingTip =>
      'Menos presión es más. Deja que la herramienta se deslice — forzar puede dañar la superficie.';

  @override
  String get polishingMistake =>
      'Pulir antes de secar completamente atrapa humedad y causa manchas opacas.';

  @override
  String get polishingVoice =>
      'Hora de pulir. Asegúrate de que la superficie esté completamente seca. Con una superficie lisa como una bolsa plástica o frasco de vidrio, frota suavemente la esfera en movimientos circulares. Mantén la presión ligera y constante. Trabaja toda la superficie durante treinta a sesenta minutos. El brillo se desarrollará gradualmente.';

  @override
  String get finishedSummary =>
      'Tu dorodango está completo. ¡Admira tu trabajo!';

  @override
  String get finishedStep1 => 'Toma una foto final de tu esfera terminada.';

  @override
  String get finishedStep2 =>
      'Guárdala en un lugar fresco y seco, lejos de la luz solar.';

  @override
  String get finishedStep3 =>
      'La esfera continuará endureciéndose en las próximas semanas.';

  @override
  String get finishedStep4 =>
      'Maneja con cuidado — la superficie pulida puede ser frágil.';

  @override
  String get finishedTip =>
      'Exhibe sobre una superficie suave. Algunos creadores hacen soportes de madera.';

  @override
  String get finishedMistake =>
      '¡Dejarla caer! Maneja con cuidado. La capa pulida es delgada.';

  @override
  String get finishedVoice =>
      '¡Felicitaciones! Tu dorodango está completo. Toma una foto final y guárdalo en un lugar fresco y seco. Continuará endureciéndose en las próximas semanas. Manéjalo con cuidado y disfruta tu creación.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Estás en la etapa $order de 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'El secado generalmente toma de dos a cuatro horas. Sé paciente y revisa cada veinte a treinta minutos.';

  @override
  String get dryingTimeNotOnStage =>
      'No estás en la etapa de secado. El secado viene después de la formación del núcleo.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Error común en esta etapa: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'El diagnóstico por foto estará disponible en una actualización futura. Por ahora, revisa los errores comunes de tu etapa actual.';

  @override
  String get alreadyComplete => '¡Tu dorodango ya está completo!';

  @override
  String get voiceUnknownCommand =>
      'No entendí eso. Intenta decir siguiente, repetir, ayuda o problema.';

  @override
  String get continueBuild => 'Continuar proyecto';

  @override
  String stageProgress(int order, String stageName) {
    return 'Etapa $order/5 — $stageName';
  }

  @override
  String get reflections => 'Reflexiones';

  @override
  String get readMore => 'Leer más';

  @override
  String get listenLabel => 'Escuchar';

  @override
  String get sourcePrefix => 'Fuente: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes min de lectura';
  }

  @override
  String get analyzingPhoto => 'Analizando tu foto...';

  @override
  String get diagnosisError =>
      'No se pudo analizar la foto. Toca para reintentar.';

  @override
  String get photoUnclear => 'Foto poco clara';

  @override
  String get detectSoil => 'Detectar la tierra de mi ubicación';

  @override
  String get soilDetecting => 'Leyendo la tierra local…';

  @override
  String get soilTypeLabel => 'Tipo de tierra local';

  @override
  String get soilClay => 'Arcilla';

  @override
  String get soilSand => 'Arena';

  @override
  String get soilSilt => 'Limo';

  @override
  String get soilSuitabilityGood =>
      'Rica en arcilla: se mantendrá unida y tomará un buen brillo.';

  @override
  String get soilSuitabilityOkay =>
      'Arcilla moderada: tamízala fina y compáctala con firmeza.';

  @override
  String get soilSuitabilitySandy =>
      'Arenosa: puede desmoronarse. Mezcla tierra rica en arcilla si puedes.';

  @override
  String get soilLocationDenied =>
      'Ubicación no disponible. Permite el acceso a la ubicación para detectar tu tierra.';

  @override
  String get soilLookupFailed =>
      'No se pudieron leer los datos del suelo de esta ubicación.';

  @override
  String get soilMap => 'Mapa de suelos';

  @override
  String get soilMapHint => 'Toca el mapa para examinar la tierra';

  @override
  String get predictResult => 'Predecir mi dorodango';

  @override
  String get predictingResult => 'Consultando al coach de IA…';

  @override
  String get predictionTitle => 'Predicción de IA';

  @override
  String get predictionFailed => 'La predicción falló. Inténtalo de nuevo.';

  @override
  String get outOfCredits => 'Sin créditos.';

  @override
  String get hunt => 'Caza de Dorodango';

  @override
  String get plantDorodango => 'Plantar este dorodango';

  @override
  String get plantExplainer =>
      'Esconde tu dorodango terminado en un lugar público. Los cazadores cercanos recibirán un aviso — quizá alguien lo encuentre.';

  @override
  String get plantHintHint => 'Deja una pista para los cazadores (opcional)';

  @override
  String get plantItHere => 'Plantarlo aquí';

  @override
  String get planting => 'Plantando…';

  @override
  String get planted => '¡Plantado! Los cazadores cercanos se enterarán.';

  @override
  String get plantFailed => 'No funcionó. Inténtalo de nuevo.';

  @override
  String get noPlantsNearby =>
      'Aún no hay dorodangos plantados cerca. ¡Sé el primero!';

  @override
  String get foundIt => '¡Lo encontré!';

  @override
  String metersAway(int distance) {
    return 'A $distance m';
  }

  @override
  String get getCloser => 'Acércate más para reclamarlo';

  @override
  String get foundCongrats => '¡Encontraste un dorodango!';

  @override
  String get hintLabel => 'Pista';

  @override
  String get huntLocationNeeded =>
      'Permite el acceso a la ubicación para unirte a la caza.';

  @override
  String get myCollection => 'Mi colección';

  @override
  String collectionCount(int count) {
    return '$count encontrados';
  }

  @override
  String get collectionEmpty =>
      'Aún no hay nada aquí — ¡encuentra tu primer dorodango!';

  @override
  String foundOnDate(String date) {
    return 'Encontrado el $date';
  }

  @override
  String get goHunting => 'Ir de caza';

  @override
  String get handsFreeHint => 'Manos libres — di «stop» para terminar';

  @override
  String get voiceGoodbye =>
      '¡Feliz pulido! Toca el orbe cuando me necesites de nuevo.';

  @override
  String get profile => 'Perfil';

  @override
  String get guestUser => 'Constructor invitado';

  @override
  String creditsBalance(int count) {
    return '$count créditos';
  }

  @override
  String get buyCredits => 'Conseguir créditos';

  @override
  String get statsBuilds => 'Dorodangos';

  @override
  String get statsPlanted => 'Plantados';

  @override
  String get statsFound => 'Encontrados';

  @override
  String get paywallTitle => 'Créditos del coach de IA';

  @override
  String get paywallSubtitle =>
      'Los créditos impulsan el coach de voz, el diagnóstico por foto y las predicciones — 1 crédito por interacción.';

  @override
  String get paywallUnavailable =>
      'Las compras aún no están disponibles en esta versión.';

  @override
  String get restorePurchases => 'Restaurar compras';

  @override
  String get purchaseSuccess => 'Créditos añadidos. ¡Feliz construcción!';

  @override
  String get purchaseFailed => 'La compra no se completó. No se te ha cobrado.';

  @override
  String get packBestValue => 'Mejor precio';

  @override
  String get welcomeBegin => 'Empezar';

  @override
  String welcomeFreeCredits(int count) {
    return '$count créditos gratis del coach de IA incluidos';
  }

  @override
  String get welcomeFeatureGuide =>
      'Una guía tranquila, paso a paso, del barro al brillo de espejo';

  @override
  String get welcomeFeatureCoach =>
      'Un coach de IA manos libres mientras tus manos están en la arcilla';

  @override
  String get welcomeFeatureHunt =>
      'Planta tu dorodango terminado y caza los cercanos';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutWarning =>
      'Al cerrar sesión de una cuenta de invitado se pierden tus dorodangos, créditos y colección. ¿Continuar?';

  @override
  String get cancel => 'Cancelar';
}
