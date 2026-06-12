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
  String get handsFreeHint => 'Əlsiz rejim — bitirmək üçün \"stop\" deyin';

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

  @override
  String get signInTitle => 'Daxil ol';

  @override
  String get registerTitle => 'Hesab yarat';

  @override
  String get emailHint => 'E-poçt';

  @override
  String get passwordHint => 'Şifrə';

  @override
  String get authToggleToRegister => 'Yenisiniz? Hesab yaradın';

  @override
  String get authToggleToLogin => 'Hesabınız var? Daxil olun';

  @override
  String get continueAsGuest => 'Qonaq kimi davam et';

  @override
  String get authErrorInvalidCredentials => 'E-poçt və ya şifrə yanlışdır.';

  @override
  String get authErrorEmailInUse => 'Bu e-poçt ilə hesab artıq mövcuddur.';

  @override
  String get authErrorWeakPassword => 'Şifrə ən azı 6 simvol olmalıdır.';

  @override
  String get authErrorGeneric => 'Daxil olmaq alınmadı. Yenidən cəhd edin.';

  @override
  String get wakeWordTooltip => '\"Hey Doro\" oyatma sözü';

  @override
  String get sayHeyDoro => 'Lazım olanda \"Hey Doro\" deyin';

  @override
  String get wakeAck => 'Bəli?';

  @override
  String get themeDorodangoOrigins => 'Dorodango Kökləri';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Torpaq';

  @override
  String get themePatience => 'Səbr';

  @override
  String get reflectionOrigins1Title => 'Məktəb Həyətinin Uşaqları';

  @override
  String get reflectionOrigins1Body =>
      'Hikaru dorodango yapon məktəb həyətlərindən doğuldu — uşaqlar orada kəşf etdi ki, adi palçıq yalnız səbr vasitəsilə müstəsna bir şeyə çevrilə bilər. Kyoto Təhsil Universitetindən professor Fumio Kayo bu ənənəni 1990-cı illərin sonunda sənədləşdirdi və Yaponiyanın demək olar ki, hər bölgəsindəki uşaqların bu texnikanı müstəqil şəkildə inkişaf etdirdiyini aşkar etdi. Onlara heç kim öyrətmədi — biliyi üfüqi şəkildə, bir-birlərindən öyrəndilər. Bunda dərin bir məna var: xam torpağı güzgüyə çevirmək istəyi öyrənilmir, kəşf edilir.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Kyoto Təhsil Universiteti';

  @override
  String get reflectionOrigins2Title => 'Sözün Özü';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru \"parlamaq\" və ya \"parıldayan\" deməkdir. Dorodango isə doro (palçıq) və dango (köftə) sözlərindən ibarətdir. Parıldayan palçıq köftəsi — güzgü kimi cilalanmış bir şey üçün ad inanılmaz dərəcədə sadədir. Bu sadəlik Yapon adlandırmasında qəsdən mövcuddur. Ən qeyri-adi şeylərə çox vaxt ən sadə adlar verilir, çünki cismin özü özündən danışır. Hazır bir dorodangonu əlinizdə tutduqunuzda heç kimin izahat verməsinə ehtiyac yoxdur. Cilalanmış torpaq kürəsi dildən kənar, birbaşa müraciət edir — ən adi materialdan səbr və diqqətin nə çıxara biləcəyinin şahididir.';

  @override
  String get reflectionOrigins2Source => 'Yapon etimologiyası';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner və Qərb';

  @override
  String get reflectionOrigins3Body =>
      'Amerikalı rəssam Bruce Gardner Yapon sənət ənənələrini araşdırarkən dorodango ilə tanış oldu və prosesi ətraflı sənədləşdirən ilk Qərb praktikantlarından biri oldu. Onun işi mədəniyyətlər arasında körpü qurdu — torpağı çevirmək həvəsinin evrensel olduğunu göstərdi. Gardner qeyd etdi ki, Qərb tələbələri ən çox qurutma mərhələsində çətinlik çəkir — texnika üzündən yox, səbirsizlik ucbatından. Kürə sizdən gözləməyi tələb edir, bu gözləmədə isə bir şey dəyişir. Materialı məcbur etməyi dayandırıb ona qulaq asmağa başlayırsınız. Gardner hesab edirdi ki, bu dərs məşqin əsl hədiyyəsidir.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'Güzgü kimi Torpaq';

  @override
  String get reflectionOrigins4Body =>
      'Dorodangonun son mərhələsi demək olar paradoksal bir şey nail olur: torpaq güzgüyə çevrilir. Dünyamızın ən tutqun materialı — kir — kifayət qədər səbirli diqqət verildikdə işığı əks etdirir. Qədim Yapon fəlsəfəsi burada heç bir ziddiyyət görmür. Parlaqlıq potensialı həmişə torpaqda mövcud idi; usta sadəcə artıq orada olanı üzə çıxardı. Bu, Yapon estetikasında təkrarlanan bir fikirdir: sənətkar materiala gözəllik yükləmir, onu ondan çıxarır. Əlləriniz bu torpaqla söhbət etdi və parıltı torpağın cavabıdır.';

  @override
  String get reflectionOrigins4Source => 'Yapon estetik fəlsəfəsi';

  @override
  String get reflectionWabi1Title => 'Qüsursuzluğun Gözəlliyi';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi qüsursuzluğu və keçiciliyi qəbul etməyə əsaslanan Yapon estetikasıdır. Çatlamış bir çay kasəsi, aşınmış taxta tir, daşların arasında böyüyən yosun — bunlar nöqsanlar deyil, zamanın və istifadənin imzalarıdır. Dorodangonuz mükəmməl bir kürə olmayacaq. Əllərinizin unikal izini, torpağınızın xüsusi tərkibini, onu hazırladığınız günün rütubətini özündə daşıyacaq. Bu fərqliliklər düzəldilməli xətalar deyil — kürənizi yalnız sizin edən şeylərdir. İki dorodango eyni olmur və bu məhz əsas məqamdır.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: Rəssamlar, Dizaynerlər, Şairlər və Filosoflar üçün';

  @override
  String get reflectionWabi2Title => 'Heç Nə Davamlı Deyil';

  @override
  String get reflectionWabi2Body =>
      'Wabi-sabinin üç dirəyindən biri keçicilikdir — heç nə davamlı deyil, heç nə bitmiş deyil, heç nə mükəmməl deyil. Dorodangonuz tamamlandıqdan sonra belə dəyişməyə davam edir. Həftələr ərzində bərkiməyə davam edəcək. Aylar və illər keçdikcə səthi incə ton dəyişiklikləri inkişaf etdirə bilər. Düşsə qırılacaq və kəsilmiş hissə işinizin təbəqələrini coğrafi süxur kimi ortaya çıxaracaq. Bu keçicilik cismi kiçiltmir; onu dərinləşdirir. Əbədi bir şey yaratmırsınız. Zamanda gözəl şəkildə mövcud olan bir şey yaradırsınız, necə ki siz də beləsiniz.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title =>
      'Vasitənin Yoxsulluğu, Nəticənin Zənginliyi';

  @override
  String get reflectionWabi3Body =>
      'Wabi əvvəlcə cəmiyyətdən uzaqda, təbiətdə yaşamağın tənhalığını ifadə edirdi. Əsrlər boyunca sadəliyin gözəlliyini və vasitə yoxsulluğunu qiymətləndirəcək şəkildə inkişaf etdi. Dorodango bəlkə bunun ən saf ifadəsidir: materialınız torpaq və sudur. Bahalı alətlər yox, xüsusi avadanlıq yox, nadir inqrediyentlər yox. Nəticənin zənginliyi tamamilə diqqətinizdən gəlir. Xərci keyfiyyətlə tez-tez eyniləşdirən bir dünyada ayaqlarınızın altındakı torpaqdan gözəl bir cisim yaratmaqda sakit bir radikallıq var. Material xərci sıfırdır. İnvestisiya — mövcudluqdur.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, Çay Kitabı';

  @override
  String get reflectionWabi4Title => 'Artıq Olanı Görmək';

  @override
  String get reflectionWabi4Body =>
      'Wabi-sabi ustası gözəlliyi yaratmaqdan çox üzə çıxarır. Bir bağça dizayneri tək bir daş yerləşdirməzdən əvvəl mövcud mənzərəni görür. Çay ustası ən bəzəkli kasəni yox, mövsümə uyğun kasəni seçir. Dorodangonuzu cilalayadə palçığa gözəllik boyamırsınız — torpaq hissəciklərinin artıq sahib olduğu gizli parlaqlığı üzə çıxarırsınız. Sıxılmış və hamarlanmış kiçik mineral dənələrinin hizalanması təbii olaraq işığı əks etdirir. Parlaqlığı siz əlavə etmədiniz. Onu gizlədən hər şeyi kənarlaşdırdınız. Bu wabi-sabi yoludur: əlavə etmək deyil, çıxarmaq; bəzəmək deyil, üzə çıxarmaq.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, Gündəlik Əşyaların Gözəlliyi';

  @override
  String get reflectionMa1Title => 'Aralarındakı Boşluq';

  @override
  String get reflectionMa1Body =>
      'Ma (間) mənfi məkanın Yapon konsepsiyasıdır — musiqiyə formasını verən notlar arasındakı pauza, onu istifadə edilə bilən hala gətirən otağın boşluğu, mənananın yerləşməsinə imkan verən söhbətdəki sükut. Dorodangoda qurutma mərhələsi saf madır. Görünən heç nə baş vermir, lakin səthin altında hər şey dəyişir. Nəm kapilyar hərəkətlə xaricə miqrasiya edir, hissəciklər oturur və bağlanır. Əlləriniz hərəkətsiz olarkən kürə işləyir. Bu görünməz prosesə etibar etməyi — gözləməyi etmək qədər qiymətləndirməyi — öyrənmək, məşqin təklif etdiyi ən dərin dərslərdən biridir.';

  @override
  String get reflectionMa1Source =>
      'Arata Isozaki, MA: Yaponiyadakı Məkan-Zaman';

  @override
  String get reflectionMa2Title => 'Boşluq Heç Nə Deyil';

  @override
  String get reflectionMa2Body =>
      'Qərb düşüncəsində boş məkan çox vaxt yoxluq kimi görülür — doldurulması lazım olan bir şey. Yapon estetikasında isə boşluq varlıqdır. Ənənəvi otaqdakı tokonoma taxa yalnız bir tumar və bir çiçək saxlayır, çünki onların ətrafındakı məkan onlara güc verən şeydir. İndi dorodangonuz istirahət edir və bu istirahət boşa getmir. Hərəkətləriniz arasındakı pauza materialın cavab verməsinə imkan yaradır. Bu bir dialoqudur: siz formalaşdırırsınız, sonra qulaq asırsınız. Sıxışdırırsınız, sonra gözləyirsiniz. Kürə öyrədir ki, məhsuldarlıq və sakinlik bir-birinə zid deyil, hər biri digərini anlamlı edən ortaqlardır.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Fəsil 11), Yapon təfsiri ilə';

  @override
  String get reflectionKintsugi1Title => 'Çatlaqlardakı Qızıl';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi qızıl qarışıqlı lak ilə qırılmış keramikanı onarmaq sənətidir. Zərəri gizlətmək əvəzinə, təmir cismin ən gözəl hissəsinə çevrilir. Tarixi on beşinci əsrə dayanır — Yapon şogun çatlamış çay kasəsini Çinə onartmağa göndərdi və aldığı çirkin metal stapler onu məyus etdi. Yapon sənətkarları daha gözəl bir həll yolu inkişaf etdirdi. Dorodangonuz qurutma zamanı bir çatlaq əmələ gətirirsə, kintsugi anıyla üzləşirsiniz: onu tərk edə bilərsiniz, ya da çatlaqla işləyib onu kürənin hekayəsinə daxil edə bilərsiniz. Ən diqqətəlayiq dorodangolardan bəziləri səthində görünən tarixi daşıyır.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: Yamaqlanmış Yapon Keramikasının Estetikası';

  @override
  String get reflectionKintsugi2Title => 'Qırılan Yerlərdə Daha Güclü';

  @override
  String get reflectionKintsugi2Body =>
      'Kintsugi fəlsəfəsi keramikanın çox ötəsinə uzanır. O göstərir ki, qırılma və təmir bir cismin tarixinin bir hissəsidir, gizlədilməli bir şey deyil. Dorodangoya tətbiq edildikdə bu o deməkdir ki, qarşılaşdığınız qüsurlar — işləmə zamanı kiçik bir çuxur, qeyri-bərabər tozlama, müxtəlif torpaq təbəqələrindən fərqli rəng dəyişikliyi — uğursuzluqlar deyil. Onlar fəsillərdir. Hər iz istehsal prosesinin bir anını qeyd edir. Usta dorodango praktikantları çox vaxt deyirlər ki, kürənin bütün hekayəsini onun səthinə baxaraq oxuya bilirlər, necə ki bir geoloq açıq qayada yerin tarixini oxuyur.';

  @override
  String get reflectionKintsugi2Source => 'Yapon sənət fəlsəfəsi';

  @override
  String get reflectionShokunin1Title => 'Ustanın Ruhu';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin Yaponca usta və ya sənətkar deməkdir, lakin İngilis dilinə çevrilməsindən daha dərin bir məna daşıyır. Shokunin katagi — ustanın ruhu — başqalarının xeyrinə ən yaxşısını etməyə olan sədaqəti ifadə edir ki, bu da bacarığın ötəsinə keçərək əxlaqi sahəyə girir. Shokunin özü üçün bir şey hazırlayanda belə, sanki başqa birinin həyatı işin keyfiyyətindən asılıdır kimi çalışır. Sadə bir palçıq kürəsinə tətbiq edilən bu diqqət intensivliyi, önemsiz ola biləcək bir fəaliyyəti işinizin keyfiyyətinə dərindən əhəmiyyət verməyin nə demək olduğuna dair meditasiyaya çevirir.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Yapon Ağac İşləmə Alətləri';

  @override
  String get reflectionShokunin2Title => 'Torpağın On Min Saatı';

  @override
  String get reflectionShokunin2Body =>
      'Ənənəvi Yapon sənətlərində ustalıq illər ilə deyil, təkrarlamalarla ölçülür. Suşi şefi yalnız düyü hazırlamağı öyrənmək üçün illər keçirir. Qılınc parlaqçısı müstəqil işləməzdən əvvəl on illik çıraqlıq tamamlayır. Dorodango bu yayın sıxışdırılmış versiyasını izləyir: saatlar ərzində məyusluq, can sıxıntısı, axın halı və məmnuniyyət dövrəsindən keçirsiniz. Hazırladığınız hər kürə əvvəlkinin öyrədə bilmədiyini öyrədir. İkinci kürənin nüvəsi daha sıx olacaq. Üçüncünün tozlaması daha bərabər olacaq. Beşinciyə qədər əlləriniz ağlınızın ifadə edə bilmədiyini biləcək. Bu shokunin yoludur — bədəndə yaşayan bilik.';

  @override
  String get reflectionShokunin2Source => 'Yapon çıraqlıq ənənəsi';

  @override
  String get reflectionShokunin3Title => 'Toz Danışır';

  @override
  String get reflectionShokunin3Body =>
      'Bacarıqlı bir tozlama praktikantı barmaqlarının ucu ilə müxtəlif ölçüdəki torpaq hissəcikləri arasındakı fərqi hiss edə bilər. Ən incə hissəciklər — 200 məşlü ələkdən keçənlər — ən hamar səthi və ən dərin parlaqlığı yaradır. Lakin shokunin yanaşması yalnız ən incə tozu istifadə etmək deyil; bunun niyəsini anlamaqdır. Daha kiçik hissəciklər daha sıx paketlənir, işığın saçılması üçün daha az boşluq buraxır. Hər tozlama təbəqəsi bəlkə iyirmi mikron material əlavə edir. Beş-on təbəqə bir kart dəstindən daha nazik, lakin güzgü kimi cilalanmağa güclü bir qabıq yaradır. Bu miqyasda diqqət sənətkarlığın mahiyyətidir.';

  @override
  String get reflectionShokunin3Source => 'Dorodangonun material elmi';

  @override
  String get reflectionShokunin4Title => 'Parlatanın Toxunuşu';

  @override
  String get reflectionShokunin4Body =>
      'Yapon qılınc parlatanları, ya da togishi, bir bıçağın həqiqi xarakterini üzə çıxarmaq sənətini mükəmməlləşdirməyə onilliklər həsr edir. Hər biri daha az material götürən və daha çox detal ortaya çıxaran giderek incələn daşlar silsiləsindən keçirlər. Son mərhələdə barmaq ucu boyda bir daş istifadə edilir ki, az qala heç bir təzyiq tətbiq etmədən poladın üzərində sürüşür. Dorodango cilalaması eyni prinsipi izləyir: səth daha incə hala gəldikcə toxunuşunuz daha yüngül olmalıdır. Hamar bir səthdə güclü təzyiq calalamaq əvəzinə cızıq yaradacaq. Bitirmənin son mərhələsi səthi cəmi qoparmaq üzrədir. Burada ustalıq tətbiq etdiklərinizlə deyil, öyrəndiklərinizi saxlamaqla ölçülür.';

  @override
  String get reflectionShokunin4Source =>
      'Yapon qılınc parlatma ənənəsi (togishi)';

  @override
  String get reflectionSoil1Title => 'Ayaqlarınızın Altındakı Dünya';

  @override
  String get reflectionSoil1Body =>
      'Sağlıklı torpağın bir çay qaşığı Yer üzündəki insan sayından daha çox mikroorqanizm ehtiva edir. Bakteriyalar, göbələklər, protozoa və nematodlar minillər boyunca qurulan canlı bir tor əmələ gətirir. Dorodangonuz üçün topladığınız torpaq bu tarixi daşıyır. Mineral tərkibi geoloji zamanla aşınan altdakı ana qayaya işarə edir. Rəng bir hekayə anladır: qırmızılar və narıncılar dəmir oksidlərini göstərir, tünd qəhvəyilər zəngin üzvi maddəni, bozlar isə gil yataqlarını. Hər dorodango gəldiyi xüsusi yerin portretidir — landşaftının dərin hekayəsini saxlayan kiçik bir kürə.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Torpaq: Sivilizasiyaların Eroziyası';

  @override
  String get reflectionSoil2Title => 'Gil Xatırlayır';

  @override
  String get reflectionSoil2Body =>
      'Gil, yaddaşı sayəsində torpaq komponentləri arasında fərqlənir. Gil hissəcikləri yastı və lövhə şəklindədir; sıxıldıqda paralel təbəqələrdə düzülürlər — bir kart dəstini qarışdırıb düz basmağa bənzər. Bu düzülüş dorodangonuza həm güc, həm də parlaqlıq potensialı verir. Hissəciklər bir dəfə düzüldükdə, nizamsızlığa qayıtmağa müqavimət göstərir. Əllərinizin təzyiqini xatırlayırlar. Bu metafora deyil; fizikadır. Nüvə formalaşdırma zamanındakı hər sıxışdırma milyonlarla hissəciyi daimi olaraq daha güclü bir konfiqurasiyaya yenidən düzür. Kürə sözün tam mənasında qayğınızın formasını alır.';

  @override
  String get reflectionSoil2Source => 'Torpaq elmi, gil mineralogiyası';

  @override
  String get reflectionPatience1Title => 'Yavaş Üzə Çıxış';

  @override
  String get reflectionPatience1Body =>
      'Müasir həyat sürəti optimallaşdırır. Ani çatdırılma, real vaxt yeniləmələri, dərhal nəticələr. Dorodango bütün bunlara müqavimət göstərir. Yalnız qurutma mərhələsi saatlar çəkir və kürəyə zərər vermədən onu tezləşdirməyin yolu yoxdur. Bu məcburi səbr bir hata deyil, bir xüsusiyyətdir. Axın hallarını araşdıran tədqiqatçılar müəyyən etdi ki, yavaş, təkrarlanan əl işləri — toxuculuq, ağac oyma, dulusçuluq — beyindəki default rejim şəbəkəsini aktivləşdirir; bu yaradıcılıq və özünüdərk ilə əlaqəli eyni şəbəkədir. Dorodangonuz indi yalnız qurumuyor; ağlınız bu tələsiksiz məkanda ən maraqlı işlərindən birini görüyor ola bilər.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Axın';

  @override
  String get reflectionPatience2Title => 'Əllərin Bildiyi';

  @override
  String get reflectionPatience2Body =>
      'Yapon bir atalar sözü var: \"Əllər ağıldan əvvəl öyrənir.\" İlk dəfə dorodango hazırlayan uşağa baxın, bunu gözünüzlə görərsiniz. Nə etdiklərini izah edə bilməzdən əvvəl əlləri instinktiv olaraq təzyiqi, fırlanma sürətini və nəmi tənzimləyir. Bu toxunma zəkası — milyonlarla il insan təkamülü boyunca inkişaf etmiş — ən az qiymətləndirilən qabiliyyətlərimizdən biridir. Ekranlar və abstraksiya çağında dorodango, fiziki dünyayı əllərlə formalaşdırmanın əsas insan fəaliyyətinə qayıdışdır. Bu bir addım geri deyil — əsas bir şeylə yenidən bağlantıdır.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, Əl';
}
