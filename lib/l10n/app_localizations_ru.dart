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
}
