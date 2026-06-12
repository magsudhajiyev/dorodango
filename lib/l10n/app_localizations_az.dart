// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'Torpağı partaltmaq sənəti';

  @override
  String get retry => 'Yenidən cəhd et';

  @override
  String get skip => 'Keç';

  @override
  String error(String message) {
    return 'Xəta: $message';
  }

  @override
  String get soilSourceHint => 'Torpağı harada tapdınız? (istəyə bağlı)';

  @override
  String get startNewBuild => 'Yeni Layihə';

  @override
  String get viewBuildLog => 'Jurnala Bax';

  @override
  String get buildLog => 'Jurnal';

  @override
  String get buildDetail => 'Layihə Detalı';

  @override
  String get noBuildsYet => 'Hələ layihə yoxdur';

  @override
  String get startFirstDorodango => 'İlk dorodangonuza başlayın!';

  @override
  String get noStagesRecorded => 'Qeydə alınmış mərhələ yoxdur.';

  @override
  String get unknownSoil => 'Naməlum torpaq';

  @override
  String get statusComplete => 'Tamamlandı';

  @override
  String get statusInProgress => 'Davam edir';

  @override
  String get statusAbandoned => 'Tərk edildi';

  @override
  String get buildCompleteTitle => 'Dorodangonuz\nTamamlandı';

  @override
  String get buildCompleteBody =>
      'Xam torpaqdan güzgü parıltısına.\nSərin və quru yerdə saxlayın —\ngələn həftələr ərzində bərkiməyə davam edəcək.';

  @override
  String get startAnotherBuild => 'Yeni Layihə';

  @override
  String get nextStage => 'Növbəti Mərhələ';

  @override
  String get completeBuild => 'Layihəni Tamamla';

  @override
  String get tapToSpeak => 'Danışmaq üçün toxunun';

  @override
  String get captureProgress => 'İrəliləyişinizi qeyd edin';

  @override
  String get captureSubtitle => 'Jurnalınız üçün şəkil çəkin.';

  @override
  String get takePhoto => 'Şəkil Çək';

  @override
  String get chooseFromGallery => 'Qalereyadan Seç';

  @override
  String suggestedDuration(String duration) {
    return 'Tövsiyə: ~$duration';
  }

  @override
  String durationHours(int hours) {
    return '${hours}saat';
  }

  @override
  String durationMinutes(int minutes) {
    return '${minutes}dəq';
  }

  @override
  String get settings => 'Parametrlər';

  @override
  String get language => 'Dil';

  @override
  String get systemDefault => 'Sistem Standartı';

  @override
  String get stageCoreForming => 'Nüvə Formalaşdırma';

  @override
  String get stageDrying => 'Qurutma';

  @override
  String get stageDustingCapping => 'Tozlama və Örtmə';

  @override
  String get stagePolishing => 'Cilalama';

  @override
  String get stageFinished => 'Tamamlandı';

  @override
  String get coreFormingSummary =>
      'Torpaq toplayın və sıx bir kürəyə sıxışdırın.';

  @override
  String get coreFormingStep1 =>
      'Gil və incə qum qarışığı olan torpaq tapın — təmiz gildən və ya qumdan qaçının.';

  @override
  String get coreFormingStep2 =>
      'Sıxıldıqda bir yerdə duranacan yavaş-yavaş su əlavə edin.';

  @override
  String get coreFormingStep3 =>
      'Təxminən tennis topu ölçüsündə kobud bir top formalaşdırın.';

  @override
  String get coreFormingStep4 =>
      'Dəyirmi şəklini qorumaq üçün daim fırladaraq möhkəm sıxın.';

  @override
  String get coreFormingStep5 =>
      'Nüvə möhkəm hiss olunana qədər 15–20 dəqiqə sıxışdırmağa davam edin.';

  @override
  String get coreFormingTip =>
      'Nüvə ölçüsünə görə sıx və ağır hiss olunmalıdır. Ufalanırsa bir az daha su əlavə edin.';

  @override
  String get coreFormingMistake =>
      'Çox su nüvəni yapışqan və formalaşdırması çətin edir. Düşündüyünüzdən daha quru başlayın.';

  @override
  String get coreFormingVoice =>
      'Nüvənizi formalaşdırma vaxtıdır. Gil və incə qum qarışığı olan yaxşı torpaq tapın. Yavaş-yavaş su əlavə edin və tennis topu ölçüsündə sıx bir topa sıxışdırın. On beş ila iyirmi dəqiqə fırladıb sıxışdıraraq möhkəm və sıx hala gətirin.';

  @override
  String get dryingSummary =>
      'Formanı qoruyaraq nəmin səthə miqrasiyasını təmin edin.';

  @override
  String get dryingStep1 =>
      'Kürəni yumşaq bir səthə qoyun və ya zərifliklə tutun.';

  @override
  String get dryingStep2 =>
      'Nəmin səthə miqrasiya etməsi üçün 20–30 dəqiqə gözləyin.';

  @override
  String get dryingStep3 =>
      'Səth nəmli hiss olunduqda boş materialı zərifliklə fırçalayın.';

  @override
  String get dryingStep4 =>
      'Dövrü təkrarlayın — bu mərhələ bir neçə saat çəkə bilər.';

  @override
  String get dryingStep5 =>
      'Səth artıq islaq hiss olunmadıqda kürə tozlamaya hazırdır.';

  @override
  String get dryingTip =>
      'Burada səbr hər şeydir. Tələsmək çatlaqlara səbəb olur.';

  @override
  String get dryingMistake =>
      'Birbaşa günəşdə çox tez qurutma səth çatlaklarına səbəb olur. Kölgədə yavaşca qurudun.';

  @override
  String get dryingVoice =>
      'İndi qurudruq. Kürənizi zərifliklə qoyun və nəmin səthə çatması üçün iyirmi ila otuz dəqiqə gözləyin. Nəmli olduqda boş materialı fırçalayın. Bu dövrü təkrarlayın. Səth artıq islaq hiss olunmadıqda kürə tozlamaya hazırdır. Bu səbr tələb edir — adətən bir neçə saat.';

  @override
  String get dustingCappingSummary =>
      'Hamar bir xarici qabıq yaratmaq üçün incə quru torpaq təbəqələri tətbiq edin.';

  @override
  String get dustingCappingStep1 =>
      'Torpağı incə ələkdən keçirib ultra-incə quru toz əldə edin.';

  @override
  String get dustingCappingStep2 =>
      'Kürənin üzərinə nazik bir toz təbəqəsi səpin.';

  @override
  String get dustingCappingStep3 =>
      'Ovucunuz və ya baş barmağınızla tozu səthə zərifliklə sürtün.';

  @override
  String get dustingCappingStep4 =>
      'Təbəqələr arasında 10–15 dəqiqə dincəldin.';

  @override
  String get dustingCappingStep5 =>
      'Səth bərabər şəkildə hamar olana qədər 5–10 təbəqə tətbiq edin.';

  @override
  String get dustingCappingTip =>
      'Toz nə qədər incə olsa, son parıltı o qədər yaxşı olar. Tapa biləcəyiniz ən incə hissəcikləri istifadə edin.';

  @override
  String get dustingCappingMistake =>
      'Tozu çox qalın tətbiq etmək soyulma yaradır. Nazik, bərabər təbəqələr açardır.';

  @override
  String get dustingCappingVoice =>
      'Tozlama və örtmə vaxtıdır. Torpağınızı ələyərək ən incə tozu əldə edin. Kürənin üzərinə nazik bir təbəqə səpin və ovucunuzla zərifliklə sürtün. Təbəqələr arasında on ila on beş dəqiqə dincəldin. Səth bərabər şəkildə hamar olana qədər beş ila on təbəqə tətbiq edin.';

  @override
  String get polishingSummary =>
      'Təbii parıltı əldə etmək üçün səthi cilalayın.';

  @override
  String get polishingStep1 =>
      'Səthin toxunuşda tamamilə quru olduğundan əmin olun.';

  @override
  String get polishingStep2 =>
      'Hamar bir səthlə (plastik torba, şüşə banka və ya yumşaq parça) kürəni zərifliklə ovalayın.';

  @override
  String get polishingStep3 =>
      'Dairəvi hərəkətlərlə yüngül, ardıcıl təzyiq tətbiq edin.';

  @override
  String get polishingStep4 =>
      'Bərabər parıltı üçün tez-tez fırladaraq bütün səthi işləyin.';

  @override
  String get polishingStep5 =>
      '30–60 dəqiqə davam edin. Parıltı yavaş-yavaş inkişaf edir.';

  @override
  String get polishingTip =>
      'Daha az təzyiq daha yaxşıdır. Alətin sürüşməsinə icazə verin — zorlamaq səthi cızıla bilər.';

  @override
  String get polishingMistake =>
      'Tam qurumadan əvvəl cilalama nəm hapseder və mat ləkələr yaradır.';

  @override
  String get polishingVoice =>
      'Cilalama vaxtıdır. Səthin tamamilə quru olduğundan əmin olun. Plastik torba və ya şüşə banka kimi hamar bir səthlə kürəni dairəvi hərəkətlərlə zərifliklə ovalayın. Təzyiqi yüngül və ardıcıl tutun. Bütün səthi otuz ila altmış dəqiqə işləyin. Parıltı yavaş-yavaş inkişaf edəcək.';

  @override
  String get finishedSummary =>
      'Dorodangonuz tamamlandı. Əsərinizə heyran olun!';

  @override
  String get finishedStep1 => 'Tamamlanmış kürənizin son şəklini çəkin.';

  @override
  String get finishedStep2 =>
      'Birbaşa günəş işığından uzaq, sərin və quru yerdə saxlayın.';

  @override
  String get finishedStep3 =>
      'Kürə gələn həftələr ərzində bərkiməyə davam edəcək.';

  @override
  String get finishedStep4 =>
      'Diqqətlə tutun — cilalanmış səth kövrək ola bilər.';

  @override
  String get finishedTip =>
      'Yumşaq bir səthdə nümayiş etdirin. Bəzi ustalar ağac standlar düzəldir.';

  @override
  String get finishedMistake =>
      'Düşürmək! Zərifliklə tutun. Cilalanmış qabıq nazikdir.';

  @override
  String get finishedVoice =>
      'Təbrik edirik! Dorodangonuz tamamlandı. Son şəklini çəkin və sərin, quru bir yerdə saxlayın. Gələn həftələr ərzində bərkiməyə davam edəcək. Diqqətlə tutun və əsərinizin ləzzətini çıxarın.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Mərhələ $order/5-dəsiniz: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Qurutma adətən iki ila dörd saat çəkir. Səbirli olun və hər iyirmi ila otuz dəqiqədə yoxlayın.';

  @override
  String get dryingTimeNotOnStage =>
      'Hal-hazırda qurutma mərhələsində deyilsiniz. Qurutma nüvə formalaşdırmadan sonra gəlir.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Bu mərhələdə ümumi xəta: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Şəkil diaqnozu gələcək yeniləmədə mövcud olacaq. Hələlik cari mərhələnizin ümumi xətalarını yoxlayın.';

  @override
  String get alreadyComplete => 'Dorodangonuz artıq tamamlandı!';

  @override
  String get voiceUnknownCommand =>
      'Bunu başa düşmədim. Növbəti, təkrar, kömək və ya problem deməyi sınayın.';

  @override
  String get continueBuild => 'Layihəyə davam et';

  @override
  String stageProgress(int order, String stageName) {
    return 'Mərhələ $order/5 — $stageName';
  }

  @override
  String get reflections => 'Düşüncələr';

  @override
  String get readMore => 'Daha çox oxu';

  @override
  String get listenLabel => 'Dinlə';

  @override
  String get sourcePrefix => 'Mənbə: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes dəq oxuma';
  }

  @override
  String get analyzingPhoto => 'Şəkiliniz analiz edilir...';

  @override
  String get diagnosisError =>
      'Şəkil analiz edilə bilmədi. Yenidən cəhd etmək üçün toxunun.';

  @override
  String get photoUnclear => 'Şəkil aydın deyil';

  @override
  String get detectSoil => 'Məkanıma görə torpağı müəyyən et';

  @override
  String get soilDetecting => 'Yerli torpağınız oxunur…';

  @override
  String get soilTypeLabel => 'Yerli torpaq növü';

  @override
  String get soilClay => 'Gil';

  @override
  String get soilSand => 'Qum';

  @override
  String get soilSilt => 'Lil';

  @override
  String get soilSuitabilityGood =>
      'Gillə zəngindir — yaxşı formalaşacaq və gözəl parıltı alacaq.';

  @override
  String get soilSuitabilityOkay =>
      'Orta gillidir — narın ələyin və möhkəm sıxın.';

  @override
  String get soilSuitabilitySandy =>
      'Qumludur — dağıla bilər. Mümkünsə gilli torpaq qarışdırın.';

  @override
  String get soilLocationDenied =>
      'Məkan əlçatan deyil. Torpağı müəyyən etmək üçün məkan girişinə icazə verin.';

  @override
  String get soilLookupFailed => 'Bu məkan üçün torpaq məlumatı oxuna bilmədi.';

  @override
  String get soilMap => 'Torpaq xəritəsi';

  @override
  String get soilMapHint => 'Torpağı yoxlamaq üçün xəritəyə toxunun';

  @override
  String get predictResult => 'Dorodangomu proqnozlaşdır';

  @override
  String get predictingResult => 'AI məşqçi ilə məsləhətləşirik…';

  @override
  String get predictionTitle => 'AI proqnozu';

  @override
  String get predictionFailed => 'Proqnoz alınmadı. Yenidən cəhd edin.';

  @override
  String get outOfCredits => 'Kreditlər bitib.';

  @override
  String get hunt => 'Dorodango Ovu';

  @override
  String get plantDorodango => 'Bu dorodangonu ək';

  @override
  String get plantExplainer =>
      'Hazır dorodangonuzu ictimai bir yerdə gizlədin. Yaxınlıqdakı ovçulara xəbər gedəcək — bəlkə kimsə onu tapdı.';

  @override
  String get plantHintHint => 'Ovçular üçün ipucu qoyun (istəyə bağlı)';

  @override
  String get plantItHere => 'Burada ək';

  @override
  String get planting => 'Əkilir…';

  @override
  String get planted => 'Əkildi! Yaxınlıqdakı ovçular xəbər tutacaq.';

  @override
  String get plantFailed => 'Alınmadı. Yenidən cəhd edin.';

  @override
  String get noPlantsNearby =>
      'Yaxınlıqda hələ dorodango əkilməyib. İlk siz olun!';

  @override
  String get foundIt => 'Tapdım!';

  @override
  String metersAway(int distance) {
    return '$distance m məsafədə';
  }

  @override
  String get getCloser => 'Götürmək üçün yaxınlaşın';

  @override
  String get foundCongrats => 'Dorodango tapdınız!';

  @override
  String get hintLabel => 'İpucu';

  @override
  String get huntLocationNeeded =>
      'Ova qoşulmaq üçün məkan girişinə icazə verin.';

  @override
  String get myCollection => 'Kolleksiyam';

  @override
  String collectionCount(int count) {
    return '$count tapılıb';
  }

  @override
  String get collectionEmpty => 'Hələ boşdur — ilk dorodangonuzu tapın!';

  @override
  String foundOnDate(String date) {
    return '$date tarixində tapılıb';
  }

  @override
  String get goHunting => 'Ova başla';

  @override
  String get handsFreeHint => 'Əlsiz rejim — bitirmək üçün “stop” deyin';

  @override
  String get voiceGoodbye =>
      'Uğurlu cilalama! Yenidən lazım olsam, kürəyə toxunun.';

  @override
  String get profile => 'Profil';

  @override
  String get guestUser => 'Qonaq usta';

  @override
  String creditsBalance(int count) {
    return '$count kredit';
  }

  @override
  String get buyCredits => 'Kredit al';

  @override
  String get statsBuilds => 'Dorodango';

  @override
  String get statsPlanted => 'Əkilib';

  @override
  String get statsFound => 'Tapılıb';

  @override
  String get paywallTitle => 'AI Məşqçi kreditləri';

  @override
  String get paywallSubtitle =>
      'Kreditlər səsli məşqçini, foto diaqnozu və proqnozları işlədir — hər istifadə 1 kredit.';

  @override
  String get paywallUnavailable =>
      'Bu versiyada satınalmalar hələ mövcud deyil.';

  @override
  String get restorePurchases => 'Satınalmaları bərpa et';

  @override
  String get purchaseSuccess => 'Kreditlər əlavə olundu. Uğurlar!';

  @override
  String get purchaseFailed =>
      'Satınalma tamamlanmadı. Sizdən ödəniş tutulmadı.';

  @override
  String get packBestValue => 'Ən sərfəli';

  @override
  String get welcomeBegin => 'Başla';

  @override
  String welcomeFreeCredits(int count) {
    return '$count pulsuz AI məşqçi krediti daxildir';
  }

  @override
  String get welcomeFeatureGuide =>
      'Palçıqdan güzgü parıltısına qədər sakit, addım-addım bələdçi';

  @override
  String get welcomeFeatureCoach => 'Əlləriniz gildə olarkən əlsiz AI məşqçi';

  @override
  String get welcomeFeatureHunt =>
      'Hazır dorodangonuzu əkin və yaxınlıqdakıları ovlayın';

  @override
  String get logout => 'Çıxış';

  @override
  String get logoutWarning =>
      'Qonaq hesabından çıxdıqda dorodangolarınız, kreditləriniz və kolleksiyanız itir. Davam edilsin?';

  @override
  String get cancel => 'Ləğv et';
}
