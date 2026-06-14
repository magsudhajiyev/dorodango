// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Дородангo';

  @override
  String get appSubtitle => 'Искусство полировки земли';

  @override
  String get retry => 'Повторить';

  @override
  String get skip => 'Пропустить';

  @override
  String error(String message) {
    return 'Ошибка: $message';
  }

  @override
  String get soilSourceHint => 'Где вы нашли землю? (необязательно)';

  @override
  String get startNewBuild => 'Новый проект';

  @override
  String get viewBuildLog => 'Журнал';

  @override
  String get buildLog => 'Журнал';

  @override
  String get buildDetail => 'Детали проекта';

  @override
  String get noBuildsYet => 'Проектов пока нет';

  @override
  String get startFirstDorodango => 'Начните ваш первый дороданго!';

  @override
  String get noStagesRecorded => 'Этапы не записаны.';

  @override
  String get unknownSoil => 'Неизвестная земля';

  @override
  String get statusComplete => 'Завершено';

  @override
  String get statusInProgress => 'В процессе';

  @override
  String get statusAbandoned => 'Заброшено';

  @override
  String get buildCompleteTitle => 'Ваш дородангo\nготов';

  @override
  String get buildCompleteBody =>
      'От сырой земли до зеркального блеска.\nХраните в прохладном, сухом месте —\nон будет продолжать твердеть в течение недель.';

  @override
  String get startAnotherBuild => 'Новый проект';

  @override
  String get nextStage => 'Следующий этап';

  @override
  String get completeBuild => 'Завершить проект';

  @override
  String get tapToSpeak => 'Нажмите, чтобы говорить';

  @override
  String get captureProgress => 'Зафиксируйте прогресс';

  @override
  String get captureSubtitle => 'Сделайте фото для вашего журнала.';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String suggestedDuration(String duration) {
    return 'Рекомендуется: ~$duration';
  }

  @override
  String durationHours(int hours) {
    return '$hoursч';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutesмин';
  }

  @override
  String get settings => 'Настройки';

  @override
  String get language => 'Язык';

  @override
  String get systemDefault => 'Системный';

  @override
  String get stageCoreForming => 'Формирование ядра';

  @override
  String get stageDrying => 'Сушка';

  @override
  String get stageDustingCapping => 'Припудривание и покрытие';

  @override
  String get stagePolishing => 'Полировка';

  @override
  String get stageFinished => 'Готово';

  @override
  String get coreFormingSummary =>
      'Соберите землю и спрессуйте в плотную сферу.';

  @override
  String get coreFormingStep1 =>
      'Найдите почву со смесью глины и мелкого песка — избегайте чистой глины или песка.';

  @override
  String get coreFormingStep2 =>
      'Постепенно добавляйте воду, пока земля не будет держаться при сжатии.';

  @override
  String get coreFormingStep3 =>
      'Сформируйте грубый шар размером с теннисный мяч.';

  @override
  String get coreFormingStep4 =>
      'Сжимайте и уплотняйте, постоянно вращая для сохранения круглой формы.';

  @override
  String get coreFormingStep5 =>
      'Продолжайте сжатие 15–20 минут, пока ядро не станет твёрдым.';

  @override
  String get coreFormingTip =>
      'Ядро должно быть плотным и тяжёлым для своего размера. Если крошится, добавьте чуть больше воды.';

  @override
  String get coreFormingMistake =>
      'Слишком много воды делает ядро липким и трудным для формовки. Начинайте суше, чем кажется нужным.';

  @override
  String get coreFormingVoice =>
      'Время формировать ядро. Найдите почву с хорошей смесью глины и мелкого песка. Постепенно добавляйте воду и сжимайте в плотный шар размером с теннисный мяч. Продолжайте вращать и сжимать пятнадцать-двадцать минут, пока он не станет твёрдым и плотным.';

  @override
  String get dryingSummary =>
      'Позвольте влаге мигрировать к поверхности, сохраняя форму.';

  @override
  String get dryingStep1 =>
      'Положите сферу на мягкую поверхность или держите аккуратно.';

  @override
  String get dryingStep2 =>
      'Подождите 20–30 минут, пока влага мигрирует к поверхности.';

  @override
  String get dryingStep3 =>
      'Когда поверхность станет влажной, аккуратно смахните рыхлый материал.';

  @override
  String get dryingStep4 =>
      'Повторите цикл — этот этап может занять несколько часов.';

  @override
  String get dryingStep5 =>
      'Сфера готова к припудриванию, когда поверхность больше не влажная.';

  @override
  String get dryingTip => 'Терпение здесь — всё. Спешка приведёт к трещинам.';

  @override
  String get dryingMistake =>
      'Слишком быстрая сушка на прямом солнце вызывает поверхностные трещины. Сушите медленно в тени.';

  @override
  String get dryingVoice =>
      'Теперь сушим. Аккуратно положите сферу и подождите двадцать-тридцать минут, пока влага достигнет поверхности. Когда станет влажной, смахните рыхлый материал. Повторите цикл. Сфера готова к припудриванию, когда поверхность больше не влажная. Это требует терпения — обычно несколько часов.';

  @override
  String get dustingCappingSummary =>
      'Нанесите слои мелкой сухой земли для создания гладкой оболочки.';

  @override
  String get dustingCappingStep1 =>
      'Просейте землю через мелкое сито для получения ультратонкого сухого порошка.';

  @override
  String get dustingCappingStep2 => 'Посыпьте тонкий слой порошка на сферу.';

  @override
  String get dustingCappingStep3 =>
      'Аккуратно вотрите порошок в поверхность ладонью или большим пальцем.';

  @override
  String get dustingCappingStep4 => 'Дайте отдохнуть 10–15 минут между слоями.';

  @override
  String get dustingCappingStep5 =>
      'Нанесите 5–10 слоёв, пока поверхность не станет равномерно гладкой.';

  @override
  String get dustingCappingTip =>
      'Чем мельче пыль, тем лучше конечный блеск. Используйте самые мелкие частицы.';

  @override
  String get dustingCappingMistake =>
      'Слишком толстый слой вызывает шелушение. Тонкие, равномерные слои — ключ.';

  @override
  String get dustingCappingVoice =>
      'Время припудривания и покрытия. Просейте землю для получения самого мелкого порошка. Посыпьте тонкий слой на сферу и аккуратно вотрите ладонью. Отдыхайте десять-пятнадцать минут между слоями. Нанесите пять-десять слоёв, пока поверхность не станет равномерно гладкой.';

  @override
  String get polishingSummary =>
      'Отполируйте поверхность для естественного блеска.';

  @override
  String get polishingStep1 =>
      'Убедитесь, что поверхность полностью сухая на ощупь.';

  @override
  String get polishingStep2 =>
      'Гладкой поверхностью (пакет, стеклянная банка или мягкая ткань) аккуратно потрите сферу.';

  @override
  String get polishingStep3 =>
      'Применяйте лёгкое, постоянное давление круговыми движениями.';

  @override
  String get polishingStep4 =>
      'Обработайте всю поверхность, часто поворачивая для равномерного блеска.';

  @override
  String get polishingStep5 =>
      'Продолжайте 30–60 минут. Блеск развивается постепенно.';

  @override
  String get polishingTip =>
      'Меньше давления — лучше. Пусть инструмент скользит — усилие может повредить поверхность.';

  @override
  String get polishingMistake =>
      'Полировка до полного высыхания запирает влагу и создаёт матовые пятна.';

  @override
  String get polishingVoice =>
      'Время полировки. Убедитесь, что поверхность полностью сухая. Гладкой поверхностью, как пластиковый пакет или стеклянная банка, аккуратно потрите сферу круговыми движениями. Держите давление лёгким и постоянным. Обработайте всю поверхность тридцать-шестьдесят минут. Блеск будет развиваться постепенно.';

  @override
  String get finishedSummary => 'Ваш дороданго готов. Полюбуйтесь работой!';

  @override
  String get finishedStep1 => 'Сделайте финальное фото вашей готовой сферы.';

  @override
  String get finishedStep2 =>
      'Храните в прохладном, сухом месте вдали от солнца.';

  @override
  String get finishedStep3 => 'Сфера продолжит твердеть в течение недель.';

  @override
  String get finishedStep4 =>
      'Обращайтесь бережно — полированная поверхность может быть хрупкой.';

  @override
  String get finishedTip =>
      'Разместите на мягкой поверхности. Некоторые мастера делают деревянные подставки.';

  @override
  String get finishedMistake =>
      'Уронить! Обращайтесь бережно. Полированная оболочка тонкая.';

  @override
  String get finishedVoice =>
      'Поздравляем! Ваш дороданго готов. Сделайте финальное фото и храните в прохладном, сухом месте. Он будет продолжать твердеть в течение недель. Обращайтесь бережно и наслаждайтесь вашим творением.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Вы на этапе $order из 5: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Сушка обычно занимает два-четыре часа. Будьте терпеливы и проверяйте каждые двадцать-тридцать минут.';

  @override
  String get dryingTimeNotOnStage =>
      'Вы сейчас не на этапе сушки. Сушка идёт после формирования ядра.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Частая ошибка на этом этапе: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Диагностика по фото будет доступна в будущем обновлении. Пока проверьте частые ошибки вашего текущего этапа.';

  @override
  String get alreadyComplete => 'Ваш дороданго уже готов!';

  @override
  String get voiceUnknownCommand =>
      'Я не понял. Попробуйте сказать дальше, повторить, помощь или проблема.';

  @override
  String get continueBuild => 'Продолжить проект';

  @override
  String stageProgress(int order, String stageName) {
    return 'Этап $order/5 — $stageName';
  }

  @override
  String get reflections => 'Размышления';

  @override
  String get readMore => 'Читать далее';

  @override
  String get listenLabel => 'Слушать';

  @override
  String get sourcePrefix => 'Источник: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes мин чтения';
  }

  @override
  String get analyzingPhoto => 'Анализируем фото...';

  @override
  String get diagnosisError =>
      'Не удалось проанализировать фото. Нажмите для повтора.';

  @override
  String get photoUnclear => 'Фото нечёткое';

  @override
  String get detectSoil => 'Определить почву по моему местоположению';

  @override
  String get soilDetecting => 'Читаем местную почву…';

  @override
  String get soilTypeLabel => 'Тип местной почвы';

  @override
  String get soilClay => 'Глина';

  @override
  String get soilSand => 'Песок';

  @override
  String get soilSilt => 'Ил';

  @override
  String get soilSuitabilityGood =>
      'Богата глиной — хорошо держит форму и даст красивый блеск.';

  @override
  String get soilSuitabilityOkay =>
      'Умеренно глинистая — мелко просейте и плотно утрамбуйте.';

  @override
  String get soilSuitabilitySandy =>
      'Песчаная — может крошиться. По возможности добавьте глинистую землю.';

  @override
  String get soilLocationDenied =>
      'Местоположение недоступно. Разрешите доступ к геолокации, чтобы определить почву.';

  @override
  String get soilLookupFailed =>
      'Не удалось получить данные о почве для этого места.';

  @override
  String get soilMap => 'Карта почв';

  @override
  String get soilMapHint => 'Нажмите на карту, чтобы изучить почву';

  @override
  String get predictResult => 'Спрогнозировать мой дороданго';

  @override
  String get predictingResult => 'Советуемся с ИИ-коучем…';

  @override
  String get predictionTitle => 'Прогноз ИИ';

  @override
  String get predictionFailed =>
      'Не удалось получить прогноз. Попробуйте ещё раз.';

  @override
  String get outOfCredits => 'Кредиты закончились.';

  @override
  String get hunt => 'Охота на дороданго';

  @override
  String get plantDorodango => 'Посадить этот дороданго';

  @override
  String get plantExplainer =>
      'Спрячьте готовый дороданго в общественном месте. Охотники поблизости получат уведомление — возможно, кто-то его найдёт.';

  @override
  String get plantHintHint =>
      'Оставьте подсказку для охотников (необязательно)';

  @override
  String get plantItHere => 'Посадить здесь';

  @override
  String get planting => 'Сажаем…';

  @override
  String get planted => 'Посажено! Охотники поблизости узнают об этом.';

  @override
  String get plantFailed => 'Не получилось. Попробуйте ещё раз.';

  @override
  String get noPlantsNearby =>
      'Поблизости пока нет посаженных дороданго. Будьте первым!';

  @override
  String get foundIt => 'Я нашёл его!';

  @override
  String metersAway(int distance) {
    return 'В $distance м';
  }

  @override
  String get getCloser => 'Подойдите ближе, чтобы забрать';

  @override
  String get foundCongrats => 'Вы нашли дороданго!';

  @override
  String get hintLabel => 'Подсказка';

  @override
  String get huntLocationNeeded =>
      'Разрешите доступ к геолокации, чтобы присоединиться к охоте.';

  @override
  String get myCollection => 'Моя коллекция';

  @override
  String collectionCount(int count) {
    return 'Найдено: $count';
  }

  @override
  String get collectionEmpty => 'Пока пусто — найдите свой первый дороданго!';

  @override
  String foundOnDate(String date) {
    return 'Найден $date';
  }

  @override
  String get goHunting => 'На охоту';

  @override
  String get handsFreeHint => 'Без рук — скажите «стоп», чтобы закончить';

  @override
  String get voiceGoodbye =>
      'Удачной полировки! Коснитесь шара, когда я снова понадоблюсь.';

  @override
  String get profile => 'Профиль';

  @override
  String get guestUser => 'Гость';

  @override
  String creditsBalance(int count) {
    return 'Кредитов: $count';
  }

  @override
  String get buyCredits => 'Получить кредиты';

  @override
  String get statsBuilds => 'Дороданго';

  @override
  String get statsPlanted => 'Посажено';

  @override
  String get statsFound => 'Найдено';

  @override
  String get paywallTitle => 'Кредиты ИИ-коуча';

  @override
  String get paywallSubtitle =>
      'Кредиты используются для голосового коуча, фотодиагностики и прогнозов — 1 кредит за обращение.';

  @override
  String get paywallUnavailable => 'Покупки пока недоступны в этой сборке.';

  @override
  String get restorePurchases => 'Восстановить покупки';

  @override
  String get purchaseSuccess => 'Кредиты добавлены. Удачной лепки!';

  @override
  String get purchaseFailed => 'Покупка не завершена. Деньги не списаны.';

  @override
  String get packBestValue => 'Выгоднее всего';

  @override
  String get welcomeBegin => 'Начать';

  @override
  String welcomeFreeCredits(int count) {
    return '$count бесплатных кредитов ИИ-коуча в подарок';
  }

  @override
  String get welcomeFeatureGuide =>
      'Спокойное пошаговое руководство — от грязи до зеркального блеска';

  @override
  String get welcomeFeatureCoach => 'Голосовой ИИ-коуч, пока ваши руки в глине';

  @override
  String get welcomeFeatureHunt =>
      'Посадите готовый дороданго и охотьтесь за чужими поблизости';

  @override
  String get logout => 'Выйти';

  @override
  String get logoutWarning =>
      'При выходе из гостевого аккаунта вы потеряете свои дороданго, кредиты и коллекцию. Продолжить?';

  @override
  String get cancel => 'Отмена';

  @override
  String get signInTitle => 'Войти';

  @override
  String get registerTitle => 'Создать аккаунт';

  @override
  String get emailHint => 'Эл. почта';

  @override
  String get passwordHint => 'Пароль';

  @override
  String get authToggleToRegister => 'Впервые здесь? Создайте аккаунт';

  @override
  String get authToggleToLogin => 'Уже есть аккаунт? Войдите';

  @override
  String get continueAsGuest => 'Продолжить как гость';

  @override
  String get authErrorInvalidCredentials => 'Неверная почта или пароль.';

  @override
  String get authErrorEmailInUse => 'Аккаунт с этой почтой уже существует.';

  @override
  String get authErrorWeakPassword =>
      'Пароль должен быть не короче 6 символов.';

  @override
  String get authErrorGeneric => 'Не удалось войти. Попробуйте ещё раз.';

  @override
  String get wakeWordTooltip => 'Фраза пробуждения «Хей, Доро»';

  @override
  String get sayHeyDoro => 'Скажите «Хей, Доро», когда я понадоблюсь';

  @override
  String get wakeAck => 'Да?';

  @override
  String get themeDorodangoOrigins => 'Истоки доrodango';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Почва';

  @override
  String get themePatience => 'Терпение';

  @override
  String get reflectionOrigins1Title => 'Дети школьного двора';

  @override
  String get reflectionOrigins1Body =>
      'Hikaru dorodango возник на школьных дворах Японии, где дети обнаружили, что обычная грязь может быть превращена во что-то удивительное — при одном условии: терпение. Профессор Fumio Kayo из Киотского университета образования задокументировал эту традицию в конце 1990-х годов и выяснил, что почти в каждом регионе Японии дети независимо друг от друга открывали эту технику. Никто их не учил — они учились друг у друга, передавая знание горизонтально, а не сверху вниз. В этом есть что-то глубокое: желание превратить сырую землю в зеркало не преподаётся, а открывается.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Киотский университет образования';

  @override
  String get reflectionOrigins2Title => 'Само слово';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru означает «сиять» или «сияющий». Dorodango распадается на doro (грязь) и dango (пельмень). Сияющий грязевой пельмень — название обезоруживающе скромно для чего-то, способного достичь зеркального блеска. Эта скромность намеренна в японских именованиях. Самые удивительные вещи часто получают самые простые названия, потому что предмет говорит сам за себя. Когда вы держите готовый dorodango, никому не нужно объяснять, что это такое. Сфера из полированной земли говорит напрямую — за пределами языка — свидетельствуя о том, что терпение и внимание способны извлечь из самого обычного материала.';

  @override
  String get reflectionOrigins2Source => 'Японская этимология';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner и Запад';

  @override
  String get reflectionOrigins3Body =>
      'Американский художник Bruce Gardner познакомился с dorodango, исследуя японские ремесленные традиции, и стал одним из первых западных практиков, подробно задокументировавших этот процесс. Его работа помогла навести мосты между культурами, показав, что стремление преобразовать землю — универсально. Gardner отметил, что западным студентам труднее всего даётся стадия сушки — не из-за техники, а из-за нетерпения. Сфера просит вас подождать, и в этом ожидании что-то меняется. Вы перестаёте пытаться принудить материал и начинаете его слушать. Этот урок, заметил Gardner, и есть настоящий дар практики.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'Земля как зеркало';

  @override
  String get reflectionOrigins4Body =>
      'Финальная стадия dorodango достигает чего-то почти парадоксального: земля становится зеркалом. Самый тусклый материал в нашем мире — грязь — отражает свет, если уделить ему достаточно терпеливого внимания. Древняя японская философия не видит здесь никакого противоречия. Потенциал блеска всегда присутствовал в почве; мастер просто обнажил то, что уже было там. Это повторяющаяся идея в японской эстетике: ремесленник не навязывает материалу красоту, а пробуждает её. Ваши руки вели разговор с этой землёй, и блеск — это земля, отвечающая вам.';

  @override
  String get reflectionOrigins4Source => 'Японская эстетическая философия';

  @override
  String get reflectionWabi1Title => 'Красота несовершенства';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi — японская эстетика, укоренённая в принятии несовершенства и непостоянства. Треснувшая чайная чаша, состарившаяся деревянная балка, мох между камнями — это не изъяны, а подписи времени и использования. Ваш dorodango не будет идеальной сферой. Он несёт уникальный отпечаток ваших рук, особый состав вашей почвы, влажность дня, когда он был сделан. Эти вариации — не ошибки, которые нужно исправить, а именно то, что делает вашу сферу единственной в своём роде. Нет двух одинаковых dorodango, и в этом весь смысл.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers';

  @override
  String get reflectionWabi2Title => 'Ничто не длится вечно';

  @override
  String get reflectionWabi2Body =>
      'Один из трёх столпов wabi-sabi — непостоянство: ничто не длится, ничто не завершено, ничто не совершенно. Ваш dorodango, даже завершённый, продолжает меняться. Он будет твердеть ещё несколько недель. На протяжении месяцев и лет его поверхность может претерпевать тонкие изменения тона. Если его уронить, он разобьётся, и срез обнажит слои вашей работы, словно геологические пласты. Это непостоянство не умаляет предмет — оно углубляет его. Вы создаёте не нечто вечное. Вы создаёте нечто, прекрасно существующее во времени, — так же, как и вы сами.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Бедность средств, богатство результата';

  @override
  String get reflectionWabi3Body =>
      'Wabi первоначально описывало одиночество жизни на природе, вдали от общества. На протяжении веков оно эволюционировало в восхищение красотой простоты и скудости средств. Dorodango — пожалуй, чистейшее воплощение этого: ваш материал — грязь и вода. Никаких дорогих инструментов, специального оборудования, редких ингредиентов. Богатство результата целиком определяется вашим вниманием. В мире, где часто отождествляют стоимость и качество, есть нечто тихо радикальное в том, чтобы создать красивый предмет из земли под ногами. Материальная стоимость — ноль. Инвестиция — присутствие.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, The Book of Tea';

  @override
  String get reflectionWabi4Title => 'Видеть то, что уже есть';

  @override
  String get reflectionWabi4Body =>
      'Мастер wabi-sabi не создаёт красоту — он её обнажает. Ландшафтный дизайнер видит существующий пейзаж, прежде чем положить хоть один камень. Мастер чая выбирает чашу, подходящую сезону, а не самую роскошную. Когда вы полируете свой dorodango, вы не наносите красоту на грязь — вы извлекаете скрытый блеск, которым частицы почвы уже обладали. Выравнивание крошечных минеральных зёрен, сжатых и сглаженных, естественным образом отражает свет. Вы не добавили блеск. Вы убрали всё, что его скрывало. Таков путь wabi-sabi: не прибавление, а вычитание; не украшение, а откровение.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, The Beauty of Everyday Things';

  @override
  String get reflectionMa1Title => 'Пространство между';

  @override
  String get reflectionMa1Body =>
      'Ma (間) — японская концепция негативного пространства: пауза между нотами, придающая форму музыке; пустота комнаты, делающая её пригодной для жизни; тишина в разговоре, позволяющая смыслу осесть. В dorodango стадия сушки — чистое ma. Снаружи ничего не происходит, но под поверхностью всё меняется. Влага движется к поверхности по капиллярам, частицы оседают и скрепляются. Сфера работает, даже когда ваши руки бездействуют. Научиться доверять этому невидимому процессу — ценить ожидание так же, как действие — один из самых глубоких уроков, которые даёт эта практика.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Space-Time in Japan';

  @override
  String get reflectionMa2Title => 'Пустота — это не ничто';

  @override
  String get reflectionMa2Body =>
      'В западном мышлении пустое пространство нередко воспринимается как отсутствие — нечто, требующее заполнения. В японской эстетике пустота — это присутствие. Ниша токонома в традиционной комнате вмещает лишь один свиток и один цветок, потому что окружающее их пространство и наделяет их силой. Сейчас ваш dorodango отдыхает, и этот отдых — не потерянное время. Пауза между вашими действиями позволяет материалу ответить. Это диалог: вы придаёте форму — затем слушаете; сжимаете — затем ждёте. Сфера учит, что продуктивность и покой — не противоположности, а партнёры, каждый из которых делает другого значимым.';

  @override
  String get reflectionMa2Source =>
      'Лао-цзы, Дао Дэ Цзин (глава 11), в японской интерпретации';

  @override
  String get reflectionKintsugi1Title => 'Золото в трещинах';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi — искусство реставрации разбитой керамики с помощью лака, смешанного с золотом. Вместо того чтобы скрыть повреждение, ремонт превращается в самую красивую часть предмета. История восходит к XV веку, когда японский сёгун отправил треснувшую чайную чашу в Китай для починки и был разочарован некрасивыми металлическими скобками, которые получил обратно. Японские мастера разработали более изящное решение. Если ваш dorodango даст трещину при сушке, вы окажетесь перед моментом kintsugi: можно его бросить — или продолжить работу с трещиной, вписав её в историю сферы. Некоторые из самых впечатляющих dorodango несут видимую историю на своей поверхности.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics';

  @override
  String get reflectionKintsugi2Title => 'Прочнее в местах разлома';

  @override
  String get reflectionKintsugi2Body =>
      'Философия kintsugi выходит далеко за пределы керамики. Она предполагает, что поломка и ремонт — часть истории предмета, а не то, что нужно скрывать. Применительно к dorodango это означает, что несовершенства, с которыми вы сталкиваетесь, — небольшая вмятина от обращения, неровный участок припудривания, тонкое цветовое различие от разных слоёв почвы — не изъяны. Это главы. Каждая отметина фиксирует момент процесса создания. Опытные мастера dorodango часто говорят, что могут прочитать всю историю сферы по её поверхности — так же, как геолог читает историю земли в обнажённой породе.';

  @override
  String get reflectionKintsugi2Source => 'Японская философия ремесла';

  @override
  String get reflectionShokunin1Title => 'Дух мастера';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin означает «ремесленник» или «мастер» по-японски, но несёт более глубокий смысл, чем его английский перевод. Shokunin katagi — дух мастера — описывает преданность своему делу, которая выходит за рамки мастерства и переходит в область нравственного. Shokunin ощущает социальный долг работать с полной отдачей на благо других. Даже делая что-то для себя, вы работаете так, словно от качества зависит чья-то жизнь. Эта интенсивность сосредоточенности, применённая к простому шару из грязи, превращает то, что могло бы быть тривиальным занятием, в медитацию о том, что значит по-настоящему заботиться о качестве своей работы.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanese Woodworking Tools';

  @override
  String get reflectionShokunin2Title => 'Десять тысяч часов земли';

  @override
  String get reflectionShokunin2Body =>
      'В традиционных японских ремёслах мастерство измеряется не годами, а повторениями. Повар суши проводит годы, только учась готовить рис. Полировщик мечей проходит десятилетнее ученичество, прежде чем работать самостоятельно. Dorodango следует сжатой версии этой дуги: за несколько часов вы проходите через разочарование, скуку, поток и удовлетворение. Каждая сфера, которую вы делаете, учит тому, чего не могла предыдущая. Ядро второй сферы будет плотнее. Припудривание третьей будет ровнее. К пятой ваши руки будут знать то, что ваш разум не может выразить словами. Это путь shokunin — знание, живущее в теле.';

  @override
  String get reflectionShokunin2Source => 'Японская традиция ученичества';

  @override
  String get reflectionShokunin3Title => 'Пыль говорит';

  @override
  String get reflectionShokunin3Body =>
      'Опытный мастер припудривания способен пальцами ощутить разницу между частицами почвы разного размера. Самые мелкие частицы — те, что проходят через сито с 200 ячейками на дюйм, — создают наиболее гладкую поверхность и наиболее глубокий блеск. Но подход shokunin — это не просто использование самой мелкой пыли; это понимание того, почему. Меньшие частицы укладываются плотнее, оставляя меньше зазоров для рассеивания света. Каждый слой припудривания добавляет около двадцати микрон материала. Пять-десять слоёв создают оболочку тоньше игральной карты — и при этом достаточно прочную, чтобы отполировать её до зеркала. Внимание на таком масштабе — суть мастерства.';

  @override
  String get reflectionShokunin3Source => 'Материаловедение dorodango';

  @override
  String get reflectionShokunin4Title => 'Прикосновение полировщика';

  @override
  String get reflectionShokunin4Body =>
      'Японские полировщики мечей, togishi, проводят десятилетия, совершенствуя искусство раскрытия истинного характера клинка. Они работают с рядом последовательно более тонких камней, каждый из которых снимает меньше материала и раскрывает больше деталей. Финальная стадия использует камень размером с кончик пальца, скользящий по стали почти без давления. Полировка dorodango следует тому же принципу: по мере того как поверхность становится тоньше, прикосновение должно становиться легче. Сильное давление на гладкой поверхности оставит борозды, а не отполирует. Последняя стадия отделки едва касается поверхности. Мастерство здесь измеряется тем, чего вы учитесь не делать, а не тем, что применяете.';

  @override
  String get reflectionShokunin4Source =>
      'Японская традиция полировки мечей (togishi)';

  @override
  String get reflectionSoil1Title => 'Мир под ногами';

  @override
  String get reflectionSoil1Body =>
      'Одна чайная ложка здоровой почвы содержит больше микроорганизмов, чем людей на Земле. Бактерии, грибы, простейшие и нематоды образуют живую сеть, которая формируется тысячелетиями. Почва, которую вы собрали для своего dorodango, несёт эту историю. Минеральный состав отражает подстилающие породы, выветренные в геологическом времени. Цвет рассказывает историю: красный и оранжевый указывают на оксиды железа, тёмно-коричневый говорит о богатом органическом веществе, серый — о глинистых отложениях. Каждый dorodango — портрет конкретного места, откуда он происходит: маленькая сфера, хранящая глубокую историю своего ландшафта.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Dirt: The Erosion of Civilizations';

  @override
  String get reflectionSoil2Title => 'Глина помнит';

  @override
  String get reflectionSoil2Body =>
      'Глина примечательна среди компонентов почвы своей памятью. Частицы глины плоские, пластинчатые, и при сжатии они выстраиваются в параллельные слои — подобно тому, как перетасовывают колоду карт и прижимают её плашмя. Именно это выравнивание придаёт вашему dorodango прочность и потенциал для блеска. Частицы, выровнявшись однажды, сопротивляются возвращению к беспорядку. Они помнят давление ваших рук. Это не метафора — это физика. Каждое сжатие при формировании ядра навсегда перестраивает миллионы частиц в более прочную конфигурацию. Сфера буквально принимает форму вашей заботы.';

  @override
  String get reflectionSoil2Source => 'Почвоведение, минералогия глин';

  @override
  String get reflectionPatience1Title => 'Медленное откровение';

  @override
  String get reflectionPatience1Body =>
      'Современная жизнь оптимизирована для скорости. Мгновенная доставка, обновления в реальном времени, немедленные результаты. Dorodango сопротивляется всему этому. Стадия сушки одна только занимает часы, и ускорить её без ущерба для сферы невозможно. Это вынужденное терпение — не недостаток, а особенность. Исследователи, изучающие состояния потока, обнаружили, что медленные повторяющиеся ручные занятия — вязание, резьба по дереву, гончарство — активируют сеть пассивного режима работы мозга: ту же сеть, что связана с творчеством и саморефлексией. Ваш dorodango сейчас не просто сохнет — ваш разум, возможно, делает свою самую интересную работу в этом неторопливом пространстве.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'То, что знают руки';

  @override
  String get reflectionPatience2Body =>
      'Есть японская пословица: «Руки учатся раньше, чем понимает разум». Понаблюдайте за ребёнком, впервые делающим dorodango, — и вы увидите это воочию. Ещё не умея объяснить, что они делают, их руки уже инстинктивно регулируют давление, скорость вращения, увлажнённость. Это тактильное интеллект — развитый за миллионы лет человеческой эволюции — одна из наших наиболее недооценённых способностей. В эпоху экранов и абстракций dorodango — возвращение к фундаментальному человеческому занятию: лепить физический мир собственными руками. Это не шаг назад, а воссоединение с чем-то сущностным.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, The Hand';

  @override
  String get voiceOutOfCredits =>
      'Кредиты ИИ закончились. Я по-прежнему отвечаю на команды: дальше, повтори, помощь.';

  @override
  String get voiceError =>
      'Что-то пошло не так. Коснитесь шара, чтобы попробовать снова.';

  @override
  String get voiceConnectionLost =>
      'Связь потеряна. Проверьте интернет и коснитесь шара.';

  @override
  String get huntRadius => 'Радиус поиска';

  @override
  String radiusKm(int km) {
    return '$km км';
  }

  @override
  String get logoutConfirm => 'Выйти из аккаунта?';

  @override
  String get wakeWordSetup =>
      'Не удалось запустить «Хей, Доро». Проверьте подключение и попробуйте снова.';

  @override
  String get wakeWordPreparing => 'Подготовка «Хей, Доро» (разовая загрузка)…';
}
