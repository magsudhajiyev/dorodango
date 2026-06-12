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

  @override
  String get signInTitle => 'Iniciar sesión';

  @override
  String get registerTitle => 'Crear cuenta';

  @override
  String get emailHint => 'Correo electrónico';

  @override
  String get passwordHint => 'Contraseña';

  @override
  String get authToggleToRegister => '¿Eres nuevo? Crea una cuenta';

  @override
  String get authToggleToLogin => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get continueAsGuest => 'Continuar como invitado';

  @override
  String get authErrorInvalidCredentials =>
      'El correo o la contraseña son incorrectos.';

  @override
  String get authErrorEmailInUse => 'Ya existe una cuenta con este correo.';

  @override
  String get authErrorWeakPassword =>
      'La contraseña debe tener al menos 6 caracteres.';

  @override
  String get authErrorGeneric =>
      'No se pudo iniciar sesión. Inténtalo de nuevo.';

  @override
  String get wakeWordTooltip => 'Palabra de activación «Hey Doro»';

  @override
  String get sayHeyDoro => 'Di «Hey Doro» cuando me necesites';

  @override
  String get wakeAck => '¿Sí?';

  @override
  String get themeDorodangoOrigins => 'Orígenes del Dorodango';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Tierra';

  @override
  String get themePatience => 'Paciencia';

  @override
  String get reflectionOrigins1Title => 'Los niños del patio escolar';

  @override
  String get reflectionOrigins1Body =>
      'El hikaru dorodango surgió en los patios de las escuelas japonesas, donde los niños descubrieron que el barro ordinario podía transformarse en algo extraordinario con solo paciencia. El profesor Fumio Kayo, de la Universidad de Educación de Kyoto, documentó esta tradición a finales de los años noventa y comprobó que en casi todas las regiones de Japón los niños habían desarrollado la técnica de forma independiente. Nadie se la enseñó: la aprendieron unos de otros, transmitiendo el conocimiento de manera lateral, no vertical. Hay algo profundo en esto: el deseo de transformar la tierra cruda en un espejo no se aprende, se descubre.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Universidad de Educación de Kyoto';

  @override
  String get reflectionOrigins2Title => 'La palabra en sí';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru significa «brillar» o «brillante». Dorodango se divide en doro (barro) y dango (bola de masa). Una bola de barro brillante — el nombre es desarmantemente humilde para algo capaz de alcanzar un acabado de espejo. Esta humildad es intencionada en la nomenclatura japonesa. A las cosas más extraordinarias se les suelen dar los nombres más sencillos, porque el objeto habla por sí mismo. Cuando sostienes un dorodango terminado, nadie necesita explicar qué es. La esfera de tierra pulida se comunica directamente, más allá del lenguaje, como testimonio de lo que la paciencia y la atención pueden extraer del material más ordinario.';

  @override
  String get reflectionOrigins2Source => 'Etimología japonesa';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner y Occidente';

  @override
  String get reflectionOrigins3Body =>
      'El artista estadounidense Bruce Gardner se encontró con el dorodango mientras investigaba las tradiciones artesanales japonesas y se convirtió en uno de los primeros practicantes occidentales en documentar el proceso con detalle. Su trabajo ayudó a tender puentes entre culturas, demostrando que el atractivo de transformar la tierra es universal. Gardner señaló que los estudiantes occidentales suelen luchar más con la etapa de secado, no por la técnica, sino por la impaciencia. La esfera te pide que esperes, y en esa espera algo cambia. Dejas de intentar forzar el material y empiezas a escucharlo. Esta lección, observó Gardner, es el verdadero regalo de la práctica.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'La tierra como espejo';

  @override
  String get reflectionOrigins4Body =>
      'La etapa final de un dorodango logra algo casi paradójico: la tierra se convierte en espejo. El material más opaco de nuestro mundo — el barro — refleja la luz cuando se le presta suficiente atención paciente. La antigua filosofía japonesa no ve aquí ninguna contradicción. El potencial de brillantez siempre estuvo presente en el suelo; el artesano simplemente reveló lo que ya estaba ahí. Esta es una idea recurrente en la estética japonesa: el artesano no impone belleza al material, sino que la extrae. Tus manos han estado en conversación con esta tierra, y el brillo es la respuesta de la tierra.';

  @override
  String get reflectionOrigins4Source => 'Filosofía estética japonesa';

  @override
  String get reflectionWabi1Title => 'La belleza de la imperfección';

  @override
  String get reflectionWabi1Body =>
      'El wabi-sabi es la estética japonesa arraigada en la aceptación de la imperfección y la impermanencia. Un cuenco de té agrietado, una viga de madera desgastada, el musgo que crece entre las piedras — no son defectos, sino huellas del tiempo y el uso. Tu dorodango no será una esfera perfecta. Llevará la impronta única de tus manos, la composición particular de tu tierra, la humedad del día en que lo hiciste. Estas variaciones no son errores que corregir, sino precisamente lo que hace que tu esfera sea solo tuya. No hay dos dorodango iguales, y ese es exactamente el punto.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: para artistas, diseñadores, poetas y filósofos';

  @override
  String get reflectionWabi2Title => 'Nada dura';

  @override
  String get reflectionWabi2Body =>
      'Uno de los tres pilares del wabi-sabi es la impermanencia: nada dura, nada está terminado, nada es perfecto. Tu dorodango, incluso cuando esté completo, seguirá cambiando. Continuará endureciéndose durante semanas. A lo largo de meses y años, su superficie puede desarrollar sutiles variaciones de tono. Si cae, se romperá, y la sección transversal revelará las capas de tu trabajo como estratos geológicos. Esta impermanencia no disminuye el objeto; lo profundiza. No estás construyendo algo eterno. Estás construyendo algo que existe bellamente en el tiempo, igual que tú.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Pobreza de medios, riqueza de resultado';

  @override
  String get reflectionWabi3Body =>
      'Wabi describía originalmente la soledad de vivir en la naturaleza, lejos de la sociedad. Con los siglos evolucionó para apreciar la belleza de la sencillez y la pobreza de medios. El dorodango es quizás la expresión más pura de esto: tu material es tierra y agua. Sin herramientas costosas, sin equipos especializados, sin ingredientes raros. La riqueza del resultado proviene enteramente de tu atención. En un mundo que a menudo equipara el gasto con la calidad, hay algo calladamente radical en crear un objeto bello con la tierra bajo tus pies. El coste del material es cero. La inversión es presencia.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, El libro del té';

  @override
  String get reflectionWabi4Title => 'Ver lo que ya está ahí';

  @override
  String get reflectionWabi4Body =>
      'El maestro del wabi-sabi no tanto crea belleza como la revela. Un diseñador de jardines contempla el paisaje existente antes de colocar una sola piedra. Un maestro del té elige el cuenco que se adapta a la estación, no el más ornamentado. Cuando pulieras tu dorodango, no estás pintando belleza sobre barro: estás extrayendo el brillo latente que las partículas de tierra ya poseían. La alineación de minúsculos granos minerales, comprimidos y alisados, refleja la luz de forma natural. No añadiste el brillo. Eliminaste todo lo que lo ocultaba. Este es el camino del wabi-sabi: no adición sino sustracción, no decoración sino revelación.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, La belleza de las cosas cotidianas';

  @override
  String get reflectionMa1Title => 'El espacio entre';

  @override
  String get reflectionMa1Body =>
      'Ma (間) es el concepto japonés del espacio negativo: la pausa entre notas que da forma a la música, el vacío de una habitación que la hace habitable, el silencio en una conversación que permite que el significado aterrice. En el dorodango, la etapa de secado es ma puro. Nada visible ocurre, y sin embargo todo cambia bajo la superficie. La humedad migra hacia afuera por acción capilar, las partículas se asientan y se unen. La esfera trabaja incluso cuando tus manos no lo hacen. Aprender a confiar en este proceso invisible — a valorar la espera tanto como el hacer — es una de las lecciones más profundas que ofrece la práctica.';

  @override
  String get reflectionMa1Source =>
      'Arata Isozaki, MA: Espacio-Tiempo en Japón';

  @override
  String get reflectionMa2Title => 'El vacío no es nada';

  @override
  String get reflectionMa2Body =>
      'En el pensamiento occidental, el espacio vacío se percibe a menudo como ausencia: algo que debe llenarse. En la estética japonesa, el vacío es presencia. El tokonoma en una habitación tradicional contiene solo un pergamino y una flor, porque el espacio que los rodea es lo que les da poder. Ahora mismo tu dorodango descansa, y este descanso no es tiempo perdido. La pausa entre tus acciones deja que el material responda. Es un diálogo: tú moldeas, luego escuchas. Comprimes, luego esperas. La esfera enseña que la productividad y la quietud no son opuestos sino compañeros, cada uno haciendo que el otro tenga sentido.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Capítulo 11), a través de la interpretación japonesa';

  @override
  String get reflectionKintsugi1Title => 'Oro en las grietas';

  @override
  String get reflectionKintsugi1Body =>
      'El kintsugi es el arte de reparar la cerámica rota con laca mezclada con oro. En lugar de ocultar el daño, la reparación se convierte en la parte más bella del objeto. Su historia se remonta al siglo XV, cuando un shogun japonés envió un cuenco de té agrietado a China para repararlo y quedó decepcionado por las feas grapas metálicas que recibió. Los artesanos japoneses desarrollaron una solución más bella. Si tu dorodango desarrolla una grieta durante el secado, te enfrentas a un momento kintsugi: puedes abandonarlo, o puedes trabajar con la grieta, incorporándola a la historia de la esfera. Algunos de los dorodango más llamativos llevan historia visible en su superficie.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: La estética de la cerámica japonesa remendada';

  @override
  String get reflectionKintsugi2Title => 'Más fuerte en los lugares rotos';

  @override
  String get reflectionKintsugi2Body =>
      'La filosofía del kintsugi se extiende mucho más allá de la cerámica. Sugiere que la rotura y la reparación son parte de la historia de un objeto, no algo que disimular. Aplicado al dorodango, esto significa que las imperfecciones que encuentres — una pequeña abolladura por el manejo, un parche desigual al empolvar, una sutil variación de color por diferentes capas de tierra — no son fracasos. Son capítulos. Cada marca registra un momento del proceso de creación. Los maestros del dorodango suelen decir que pueden leer toda la historia de una esfera desde su superficie, igual que un geólogo lee la historia de la tierra en la roca expuesta.';

  @override
  String get reflectionKintsugi2Source => 'Filosofía artesanal japonesa';

  @override
  String get reflectionShokunin1Title => 'El espíritu del artesano';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin significa artesano en japonés, pero conlleva un significado más profundo que su traducción sugiere. Shokunin katagi — el espíritu del artesano — describe una devoción al oficio que va más allá de la habilidad y entra en territorio moral. El shokunin siente una obligación social de dar lo mejor de sí para el beneficio de los demás. Incluso cuando hace algo para sí mismo, trabaja como si la vida de otra persona dependiera de la calidad. Esta intensidad de enfoque, aplicada a una simple esfera de barro, transforma lo que podría ser una actividad trivial en una meditación sobre lo que significa preocuparse profundamente por la calidad del propio trabajo.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Herramientas japonesas de carpintería';

  @override
  String get reflectionShokunin2Title => 'Diez mil horas de tierra';

  @override
  String get reflectionShokunin2Body =>
      'En los oficios tradicionales japoneses, la maestría se mide no en años sino en repeticiones. Un chef de sushi pasa años aprendiendo solo a preparar el arroz. Un pulidor de espadas completa un aprendizaje de diez años antes de trabajar de forma independiente. El dorodango sigue una versión comprimida de este arco: en horas, se atraviesa la frustración, el aburrimiento, el flujo y la satisfacción. Cada esfera que haces enseña algo que la anterior no podía. El núcleo de la segunda esfera será más denso. El empolvado de la tercera será más uniforme. Para la quinta, tus manos sabrán cosas que tu mente no puede articular. Este es el camino del shokunin: conocimiento que vive en el cuerpo.';

  @override
  String get reflectionShokunin2Source => 'Tradición de aprendizaje japonesa';

  @override
  String get reflectionShokunin3Title => 'El polvo habla';

  @override
  String get reflectionShokunin3Body =>
      'Un practicante hábil del empolvado puede sentir la diferencia entre partículas de tierra de distintos tamaños con las yemas de los dedos. Las partículas más finas — las que pasan por un tamiz de 200 mallas — crean la superficie más suave y el brillo más profundo. Pero el enfoque del shokunin no consiste solo en usar el polvo más fino; consiste en entender por qué. Las partículas más pequeñas se empaquetan con mayor densidad, dejando menos huecos para que la luz se disperse. Cada capa de empolvado añade quizás veinte micrones de material. Cinco a diez capas construyen una capa más delgada que una carta de baraja, pero suficientemente fuerte para pulirse hasta lograr un espejo. La atención a esta escala es la esencia del oficio.';

  @override
  String get reflectionShokunin3Source => 'Ciencia de materiales del dorodango';

  @override
  String get reflectionShokunin4Title => 'El tacto del pulidor';

  @override
  String get reflectionShokunin4Body =>
      'Los pulidores de espadas japoneses, o togishi, pasan décadas perfeccionando el arte de revelar el verdadero carácter de una hoja. Trabajan con una serie de piedras cada vez más finas, cada una eliminando menos material y revelando más detalle. La etapa final usa una piedra del tamaño de la yema de un dedo que se desliza sobre el acero con casi ninguna presión. Pulir el dorodango sigue el mismo principio: a medida que la superficie se vuelve más fina, tu tacto debe volverse más ligero. La presión fuerte sobre una superficie lisa rayará, no pulirá. La última etapa de acabado apenas roza la superficie. La maestría aquí se mide en lo que aprendes a contener, no en lo que aplicas.';

  @override
  String get reflectionShokunin4Source =>
      'Tradición japonesa de pulido de espadas (togishi)';

  @override
  String get reflectionSoil1Title => 'Un mundo bajo tus pies';

  @override
  String get reflectionSoil1Body =>
      'Una sola cucharadita de tierra sana contiene más microorganismos que personas hay en la Tierra. Bacterias, hongos, protozoos y nematodos forman una red viva que lleva miles de años construyéndose. La tierra que recogiste para tu dorodango carga esta historia. La composición mineral refleja el lecho de roca subyacente, erosionado a lo largo del tiempo geológico. El color cuenta una historia: los rojos y naranjas indican óxidos de hierro, los marrones oscuros sugieren materia orgánica rica, los grises apuntan a depósitos de arcilla. Cada dorodango es un retrato del lugar específico del que proviene — una pequeña esfera que guarda la historia profunda de su paisaje.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Tierra: La erosión de las civilizaciones';

  @override
  String get reflectionSoil2Title => 'La arcilla recuerda';

  @override
  String get reflectionSoil2Body =>
      'La arcilla es notable entre los componentes del suelo por su memoria. Las partículas de arcilla son planas y en forma de lámina; cuando se comprimen, se alinean en capas paralelas, como barajar un mazo de cartas y presionarlo. Esta alineación es lo que le da a tu dorodango su resistencia y su potencial de brillo. Las partículas, una vez alineadas, resisten volver al desorden. Recuerdan la presión de tus manos. Esto no es metáfora; es física. Cada compresión durante la formación del núcleo reorganiza permanentemente millones de partículas en una configuración más fuerte. La esfera literalmente toma la forma de tu cuidado.';

  @override
  String get reflectionSoil2Source =>
      'Ciencia del suelo, mineralogía de la arcilla';

  @override
  String get reflectionPatience1Title => 'La revelación lenta';

  @override
  String get reflectionPatience1Body =>
      'La vida moderna se optimiza para la velocidad. Entrega instantánea, actualizaciones en tiempo real, resultados inmediatos. El dorodango resiste todo esto. Solo la etapa de secado tarda horas, y no hay manera de acelerarla sin dañar la esfera. Esta paciencia forzada no es un defecto sino una característica. Los investigadores que estudian los estados de flujo han descubierto que las tareas manuales lentas y repetitivas — tejer, tallar madera, alfarería — activan la red de modo predeterminado del cerebro, la misma red asociada con la creatividad y la autorreflexión. Tu dorodango no solo se está secando ahora mismo; tu mente puede estar haciendo algunos de sus trabajos más interesantes en este espacio sin prisa.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Fluir';

  @override
  String get reflectionPatience2Title => 'Lo que saben las manos';

  @override
  String get reflectionPatience2Body =>
      'Hay un proverbio japonés: «Las manos aprenden antes de que la mente comprenda.» Observa a un niño haciendo dorodango por primera vez y lo verás en acción. Antes de poder explicar lo que está haciendo, sus manos ajustan instintivamente la presión, la velocidad de rotación y la humedad. Esta inteligencia táctil — desarrollada a lo largo de millones de años de evolución humana — es una de nuestras capacidades más infravaloradas. En una era de pantallas y abstracción, el dorodango es un regreso a la actividad humana fundamental de moldear el mundo físico con las manos. No es un paso atrás, sino una reconexión con algo esencial.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, La mano';
}
