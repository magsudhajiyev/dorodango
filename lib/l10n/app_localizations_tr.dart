// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Dorodango';

  @override
  String get appSubtitle => 'Toprağı parlatma sanatı';

  @override
  String get retry => 'Tekrar dene';

  @override
  String get skip => 'Atla';

  @override
  String error(String message) {
    return 'Hata: $message';
  }

  @override
  String get soilSourceHint => 'Toprağı nerede buldunuz? (isteğe bağlı)';

  @override
  String get startNewBuild => 'Yeni Proje';

  @override
  String get viewBuildLog => 'Günlüğü Gör';

  @override
  String get buildLog => 'Günlük';

  @override
  String get buildDetail => 'Proje Detayı';

  @override
  String get noBuildsYet => 'Henüz proje yok';

  @override
  String get startFirstDorodango => 'İlk dorodangonuzu başlatın!';

  @override
  String get noStagesRecorded => 'Kaydedilmiş aşama yok.';

  @override
  String get unknownSoil => 'Bilinmeyen toprak';

  @override
  String get statusComplete => 'Tamamlandı';

  @override
  String get statusInProgress => 'Devam ediyor';

  @override
  String get statusAbandoned => 'Terk edildi';

  @override
  String get buildCompleteTitle => 'Dorodangonuz\nTamamlandı';

  @override
  String get buildCompleteBody =>
      'Ham topraktan ayna parlaklığına.\nSerin ve kuru bir yerde saklayın —\nönümüzdeki haftalarda sertleşmeye devam edecek.';

  @override
  String get startAnotherBuild => 'Yeni Proje';

  @override
  String get nextStage => 'Sonraki Aşama';

  @override
  String get completeBuild => 'Projeyi Tamamla';

  @override
  String get tapToSpeak => 'Konuşmak için dokun';

  @override
  String get captureProgress => 'İlerlemenizi kaydedin';

  @override
  String get captureSubtitle => 'Günlüğünüz için bir fotoğraf çekin.';

  @override
  String get takePhoto => 'Fotoğraf Çek';

  @override
  String get chooseFromGallery => 'Galeriden Seç';

  @override
  String suggestedDuration(String duration) {
    return 'Önerilen: ~$duration';
  }

  @override
  String durationHours(int hours) {
    return '${hours}sa';
  }

  @override
  String durationMinutes(int minutes) {
    return '${minutes}dk';
  }

  @override
  String get settings => 'Ayarlar';

  @override
  String get language => 'Dil';

  @override
  String get systemDefault => 'Sistem Varsayılanı';

  @override
  String get stageCoreForming => 'Çekirdek Oluşturma';

  @override
  String get stageDrying => 'Kurutma';

  @override
  String get stageDustingCapping => 'Tozlama ve Kaplama';

  @override
  String get stagePolishing => 'Parlatma';

  @override
  String get stageFinished => 'Tamamlandı';

  @override
  String get coreFormingSummary =>
      'Toprak toplayın ve sıkı bir küreye sıkıştırın.';

  @override
  String get coreFormingStep1 =>
      'Kil ve ince kum karışımı olan toprak bulun — saf kil veya kumdan kaçının.';

  @override
  String get coreFormingStep2 =>
      'Sıkıldığında bir arada durana kadar yavaşça su ekleyin.';

  @override
  String get coreFormingStep3 =>
      'Yaklaşık tenis topu büyüklüğünde kaba bir top oluşturun.';

  @override
  String get coreFormingStep4 =>
      'Yuvarlak şeklini korumak için sürekli döndürerek sıkıca sıkıştırın.';

  @override
  String get coreFormingStep5 =>
      'Çekirdek sağlam hissedilene kadar 15–20 dakika sıkıştırmaya devam edin.';

  @override
  String get coreFormingTip =>
      'Çekirdek boyutuna göre yoğun ve ağır hissetmelidir. Ufalanıyorsa biraz daha su ekleyin.';

  @override
  String get coreFormingMistake =>
      'Çok fazla su çekirdeği yapışkan ve şekillendirmesi zor yapar. Düşündüğünüzden daha kuru başlayın.';

  @override
  String get coreFormingVoice =>
      'Çekirdeğinizi oluşturma zamanı. Kil ve ince kum karışımı olan iyi bir toprak bulun. Yavaşça su ekleyin ve tenis topu büyüklüğünde sıkı bir topa sıkıştırın. On beş ila yirmi dakika döndürüp sıkıştırarak sağlam ve yoğun hale getirin.';

  @override
  String get dryingSummary =>
      'Şekli koruyarak nemin yüzeye göç etmesini sağlayın.';

  @override
  String get dryingStep1 =>
      'Küreyi yumuşak bir yüzeye koyun veya nazikçe tutun.';

  @override
  String get dryingStep2 =>
      'Nemin yüzeye göç etmesi için 20–30 dakika bekleyin.';

  @override
  String get dryingStep3 =>
      'Yüzey nemli hissettiğinde gevşek malzemeyi nazikçe fırçalayın.';

  @override
  String get dryingStep4 =>
      'Döngüyü tekrarlayın — bu aşama birkaç saat sürebilir.';

  @override
  String get dryingStep5 =>
      'Yüzey artık ıslak hissedilmediğinde küre tozlamaya hazırdır.';

  @override
  String get dryingTip =>
      'Burada sabır her şeydir. Acele etmek çatlaklara neden olur.';

  @override
  String get dryingMistake =>
      'Doğrudan güneşte çok hızlı kurutma yüzey çatlaklarına neden olur. Gölgede yavaşça kurutun.';

  @override
  String get dryingVoice =>
      'Şimdi kurutuyoruz. Kürenizi nazikçe koyun ve nemin yüzeye ulaşması için yirmi ila otuz dakika bekleyin. Nemli olduğunda gevşek malzemeyi fırçalayın. Bu döngüyü tekrarlayın. Yüzey artık ıslak hissedilmediğinde küre tozlamaya hazırdır. Bu sabır gerektirir — genellikle birkaç saat.';

  @override
  String get dustingCappingSummary =>
      'Pürüzsüz bir dış kabuk oluşturmak için ince kuru toprak katmanları uygulayın.';

  @override
  String get dustingCappingStep1 =>
      'Toprağı ince bir elekle eleyin ve ultra ince kuru toz elde edin.';

  @override
  String get dustingCappingStep2 =>
      'Kürenin üzerine ince bir toz tabakası serpin.';

  @override
  String get dustingCappingStep3 =>
      'Avuç içiniz veya baş parmağınızla tozu yüzeye nazikçe sürün.';

  @override
  String get dustingCappingStep4 => 'Katlar arasında 10–15 dakika dinlendirin.';

  @override
  String get dustingCappingStep5 =>
      'Yüzey düzgün şekilde pürüzsüz olana kadar 5–10 kat uygulayın.';

  @override
  String get dustingCappingTip =>
      'Toz ne kadar ince olursa son parlaklık o kadar iyi olur. Bulabildiğiniz en ince partikülleri kullanın.';

  @override
  String get dustingCappingMistake =>
      'Tozu çok kalın uygulamak soyulmaya neden olur. İnce, düzgün katmanlar anahtardır.';

  @override
  String get dustingCappingVoice =>
      'Tozlama ve kaplama zamanı. Toprağınızı eleyerek en ince tozu elde edin. Kürenin üzerine ince bir tabaka serpin ve avuç içinizle nazikçe sürün. Katlar arasında on ila on beş dakika dinlendirin. Yüzey düzgün şekilde pürüzsüz olana kadar beş ila on kat uygulayın.';

  @override
  String get polishingSummary =>
      'Doğal bir parlaklık elde etmek için yüzeyi ciralayın.';

  @override
  String get polishingStep1 => 'Yüzeyin tamamen kuru olduğundan emin olun.';

  @override
  String get polishingStep2 =>
      'Pürüzsüz bir yüzeyle (plastik poşet, cam kavanoz veya yumuşak bez) küreyi nazikçe ovalayın.';

  @override
  String get polishingStep3 =>
      'Dairesel hareketlerle hafif, tutarlı basınç uygulayın.';

  @override
  String get polishingStep4 =>
      'Eşit parlaklık için sık sık döndürerek tüm yüzeyi çalışın.';

  @override
  String get polishingStep5 =>
      '30–60 dakika devam edin. Parlaklık yavaşça gelişir.';

  @override
  String get polishingTip =>
      'Daha az basınç daha iyidir. Aracın kaymasına izin verin — zorlamak yüzeyi çizebilir.';

  @override
  String get polishingMistake =>
      'Tamamen kurumadan önce parlatma nem hapseder ve mat lekeler oluşturur.';

  @override
  String get polishingVoice =>
      'Parlatma zamanı. Yüzeyin tamamen kuru olduğundan emin olun. Plastik poşet veya cam kavanoz gibi pürüzsüz bir yüzeyle küreyi dairesel hareketlerle nazikçe ovalayın. Basıncı hafif ve tutarlı tutun. Tüm yüzeyi otuz ila altmış dakika çalışın. Parlaklık yavaşça gelişecektir.';

  @override
  String get finishedSummary =>
      'Dorodangonuz tamamlandı. Eserinize hayran olun!';

  @override
  String get finishedStep1 => 'Tamamlanmış kürenizin son fotoğrafını çekin.';

  @override
  String get finishedStep2 =>
      'Doğrudan güneş ışığından uzak, serin ve kuru bir yerde saklayın.';

  @override
  String get finishedStep3 =>
      'Küre önümüzdeki haftalarda sertleşmeye devam edecek.';

  @override
  String get finishedStep4 =>
      'Dikkatli tutun — cilalı yüzey kırılgan olabilir.';

  @override
  String get finishedTip =>
      'Yumuşak bir yüzeyde sergileyin. Bazı yapımcılar ahşap standlar yapar.';

  @override
  String get finishedMistake =>
      'Düşürmek! Nazikçe tutun. Cilalı kabuk incedir.';

  @override
  String get finishedVoice =>
      'Tebrikler! Dorodangonuz tamamlandı. Son fotoğrafını çekin ve serin, kuru bir yerde saklayın. Önümüzdeki haftalarda sertleşmeye devam edecek. Dikkatli tutun ve eserinizin tadını çıkarın.';

  @override
  String helpResponse(int order, String title, String summary) {
    return 'Aşama $order/5\'tesiniz: $title. $summary';
  }

  @override
  String get dryingTimeResponse =>
      'Kurutma genellikle iki ila dört saat sürer. Sabırlı olun ve her yirmi ila otuz dakikada kontrol edin.';

  @override
  String get dryingTimeNotOnStage =>
      'Şu anda kurutma aşamasında değilsiniz. Kurutma, çekirdek oluşturmadan sonra gelir.';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'Bu aşamada yaygın hata: $mistake';
  }

  @override
  String get diagnoseStubResponse =>
      'Fotoğraf tanısı gelecek bir güncellemede kullanılabilir olacak. Şimdilik mevcut aşamanızın yaygın hatalarını kontrol edin.';

  @override
  String get alreadyComplete => 'Dorodangonuz zaten tamamlandı!';

  @override
  String get voiceUnknownCommand =>
      'Bunu anlamadım. Sonraki, tekrar, yardım veya sorun demeyi deneyin.';

  @override
  String get continueBuild => 'Projeye devam et';

  @override
  String stageProgress(int order, String stageName) {
    return 'Aşama $order/5 — $stageName';
  }

  @override
  String get reflections => 'Yansımalar';

  @override
  String get readMore => 'Devamını oku';

  @override
  String get listenLabel => 'Dinle';

  @override
  String get sourcePrefix => 'Kaynak: ';

  @override
  String estimatedReadTime(int minutes) {
    return '~$minutes dk okuma';
  }

  @override
  String get analyzingPhoto => 'Fotoğrafınız analiz ediliyor...';

  @override
  String get diagnosisError =>
      'Fotoğraf analiz edilemedi. Tekrar denemek için dokunun.';

  @override
  String get photoUnclear => 'Fotoğraf net değil';

  @override
  String get detectSoil => 'Konumumdan toprağı algıla';

  @override
  String get soilDetecting => 'Yerel toprak okunuyor…';

  @override
  String get soilTypeLabel => 'Yerel toprak türü';

  @override
  String get soilClay => 'Kil';

  @override
  String get soilSand => 'Kum';

  @override
  String get soilSilt => 'Silt';

  @override
  String get soilSuitabilityGood =>
      'Kil bakımından zengin — iyi tutunur ve güzel bir parlaklık alır.';

  @override
  String get soilSuitabilityOkay =>
      'Orta düzeyde killi — ince eleyin ve sıkıca bastırın.';

  @override
  String get soilSuitabilitySandy =>
      'Kumlu — dağılabilir. Mümkünse kil açısından zengin toprak karıştırın.';

  @override
  String get soilLocationDenied =>
      'Konum kullanılamıyor. Toprağı algılamak için konum erişimine izin verin.';

  @override
  String get soilLookupFailed => 'Bu konum için toprak verileri okunamadı.';

  @override
  String get soilMap => 'Toprak haritası';

  @override
  String get soilMapHint => 'Toprağı incelemek için haritaya dokunun';

  @override
  String get predictResult => 'Dorodangomu tahmin et';

  @override
  String get predictingResult => 'Yapay zeka koçuna danışılıyor…';

  @override
  String get predictionTitle => 'Yapay zeka tahmini';

  @override
  String get predictionFailed => 'Tahmin başarısız oldu. Tekrar deneyin.';

  @override
  String get outOfCredits => 'Krediler tükendi.';

  @override
  String get hunt => 'Dorodango Avı';

  @override
  String get plantDorodango => 'Bu dorodangoyu ek';

  @override
  String get plantExplainer =>
      'Bitmiş dorodangonuzu halka açık bir yere saklayın. Yakındaki avcılara haber gidecek — belki biri onu bulur.';

  @override
  String get plantHintHint => 'Avcılar için bir ipucu bırakın (isteğe bağlı)';

  @override
  String get plantItHere => 'Buraya ek';

  @override
  String get planting => 'Ekiliyor…';

  @override
  String get planted => 'Ekildi! Yakındaki avcılar haberdar olacak.';

  @override
  String get plantFailed => 'Olmadı. Tekrar deneyin.';

  @override
  String get noPlantsNearby =>
      'Yakınlarda henüz ekili dorodango yok. İlk siz olun!';

  @override
  String get foundIt => 'Buldum!';

  @override
  String metersAway(int distance) {
    return '$distance m uzakta';
  }

  @override
  String get getCloser => 'Almak için yaklaşın';

  @override
  String get foundCongrats => 'Bir dorodango buldunuz!';

  @override
  String get hintLabel => 'İpucu';

  @override
  String get huntLocationNeeded =>
      'Ava katılmak için konum erişimine izin verin.';

  @override
  String get myCollection => 'Koleksiyonum';

  @override
  String collectionCount(int count) {
    return '$count bulundu';
  }

  @override
  String get collectionEmpty => 'Henüz boş — ilk dorodangonuzu bulun!';

  @override
  String foundOnDate(String date) {
    return '$date tarihinde bulundu';
  }

  @override
  String get goHunting => 'Ava çık';

  @override
  String get handsFreeHint => 'Eller serbest — bitirmek için “dur” deyin';

  @override
  String get voiceGoodbye =>
      'İyi parlatmalar! Bana tekrar ihtiyacın olursa küreye dokun.';

  @override
  String get profile => 'Profil';

  @override
  String get guestUser => 'Misafir usta';

  @override
  String creditsBalance(int count) {
    return '$count kredi';
  }

  @override
  String get buyCredits => 'Kredi al';

  @override
  String get statsBuilds => 'Dorodango';

  @override
  String get statsPlanted => 'Ekilen';

  @override
  String get statsFound => 'Bulunan';

  @override
  String get paywallTitle => 'Yapay Zeka Koç kredileri';

  @override
  String get paywallSubtitle =>
      'Krediler sesli koçu, fotoğraf teşhisini ve tahminleri çalıştırır — etkileşim başına 1 kredi.';

  @override
  String get paywallUnavailable =>
      'Bu sürümde satın almalar henüz kullanılamıyor.';

  @override
  String get restorePurchases => 'Satın almaları geri yükle';

  @override
  String get purchaseSuccess => 'Krediler eklendi. İyi çalışmalar!';

  @override
  String get purchaseFailed =>
      'Satın alma tamamlanmadı. Sizden ücret alınmadı.';

  @override
  String get packBestValue => 'En avantajlı';
}
