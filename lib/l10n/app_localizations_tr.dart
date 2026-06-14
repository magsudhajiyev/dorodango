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
  String get handsFreeHint => 'Eller serbest — bitirmek için \"dur\" deyin';

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

  @override
  String get welcomeBegin => 'Başla';

  @override
  String welcomeFreeCredits(int count) {
    return '$count ücretsiz yapay zeka koç kredisi dahil';
  }

  @override
  String get welcomeFeatureGuide =>
      'Çamurdan ayna parlaklığına, sakin ve adım adım bir rehber';

  @override
  String get welcomeFeatureCoach =>
      'Elleriniz kildeyken eller serbest yapay zeka koçu';

  @override
  String get welcomeFeatureHunt =>
      'Bitmiş dorodangonuzu ekin ve yakındakileri avlayın';

  @override
  String get logout => 'Çıkış yap';

  @override
  String get logoutWarning =>
      'Misafir hesabından çıkarsanız dorodangolarınız, kredileriniz ve koleksiyonunuz kaybolur. Devam edilsin mi?';

  @override
  String get cancel => 'İptal';

  @override
  String get signInTitle => 'Giriş yap';

  @override
  String get registerTitle => 'Hesap oluştur';

  @override
  String get emailHint => 'E-posta';

  @override
  String get passwordHint => 'Şifre';

  @override
  String get authToggleToRegister => 'Yeni misiniz? Hesap oluşturun';

  @override
  String get authToggleToLogin => 'Zaten hesabınız var mı? Giriş yapın';

  @override
  String get continueAsGuest => 'Misafir olarak devam et';

  @override
  String get authErrorInvalidCredentials => 'E-posta veya şifre hatalı.';

  @override
  String get authErrorEmailInUse => 'Bu e-posta ile bir hesap zaten var.';

  @override
  String get authErrorWeakPassword => 'Şifre en az 6 karakter olmalıdır.';

  @override
  String get authErrorGeneric => 'Giriş yapılamadı. Lütfen tekrar deneyin.';

  @override
  String get wakeWordTooltip => '\"Hey Doro\" uyandırma sözü';

  @override
  String get sayHeyDoro => 'Bana ihtiyacın olduğunda \"Hey Doro\" de';

  @override
  String get wakeAck => 'Evet?';

  @override
  String get themeDorodangoOrigins => 'Dorodango\'nun Kökenleri';

  @override
  String get themeWabiSabi => 'Wabi-Sabi';

  @override
  String get themeMa => 'Ma (間)';

  @override
  String get themeKintsugi => 'Kintsugi';

  @override
  String get themeShokunin => 'Shokunin';

  @override
  String get themeSoil => 'Toprak';

  @override
  String get themePatience => 'Sabır';

  @override
  String get reflectionOrigins1Title => 'Okul Bahçesinin Çocukları';

  @override
  String get reflectionOrigins1Body =>
      'Hikaru dorodango, Japon okul bahçelerinde doğdu; çocuklar sıradan çamurun yalnızca sabırla olağanüstü bir şeye dönüştürülebileceğini keşfetti. Kyoto Eğitim Üniversitesi\'nden Profesör Fumio Kayo, bu geleneği 1990\'ların sonunda belgeledi ve Japonya\'nın neredeyse her bölgesinde çocukların tekniği bağımsız olarak geliştirdiğini ortaya koydu. Kimse onlara öğretmemişti; birbirlerinden öğrendiler, bilgiyi yukarıdan aşağıya değil yatay olarak aktardılar. Bunda derin bir şey var: ham toprağı aynaya dönüştürme arzusu öğretilmez, keşfedilir.';

  @override
  String get reflectionOrigins1Source =>
      'Fumio Kayo, Kyoto Eğitim Üniversitesi';

  @override
  String get reflectionOrigins2Title => 'Kelimenin Kendisi';

  @override
  String get reflectionOrigins2Body =>
      'Hikaru «parlamak» veya «parlayan» anlamına gelir. Dorodango ise doro (çamur) ve dango (köfte) kelimelerinden oluşur. Parlayan çamur köftesi — bu isim, ayna cilasına ulaşabilen bir nesne için şaşırtıcı derecede alçakgönüllü. Bu alçakgönüllülük Japon isimlendirmesinde kasıtlıdır. En olağanüstü şeyler çoğunlukla en sade adları alır; çünkü nesne kendisi adına konuşur. Bitmiş bir dorodango tuttuğunuzda, ne olduğunu kimsenin açıklaması gerekmez. Cilalı toprak küresi dili aşarak doğrudan iletişim kurar — sabrın ve dikkatın en sıradan malzemeden neler çıkarabileceğinin tanıklığını yapar.';

  @override
  String get reflectionOrigins2Source => 'Japonca etimoloji';

  @override
  String get reflectionOrigins3Title => 'Bruce Gardner ve Batı';

  @override
  String get reflectionOrigins3Body =>
      'Amerikalı sanatçı Bruce Gardner, Japon zanaat geleneklerini araştırırken dorodango ile tanıştı ve süreci ayrıntılı biçimde belgeleyen ilk Batılı uygulayıcılardan biri oldu. Çalışması kültürler arasında köprü kurarak toprağı dönüştürme çekiciliğinin evrensel olduğunu gösterdi. Gardner, Batılı öğrencilerin en çok kurutma aşamasında zorlandığını not etti — teknik nedenlerle değil, sabırsızlıktan. Küre sizi beklemeye davet eder; bu bekleme içinde bir şeyler değişir. Malzemeyi zorlamayı bırakır ve onu dinlemeye başlarsınız. Gardner\'a göre bu ders, pratiğin gerçek armağanıdır.';

  @override
  String get reflectionOrigins3Source => 'Bruce Gardner, dorodango.com';

  @override
  String get reflectionOrigins4Title => 'Toprak Ayna Olarak';

  @override
  String get reflectionOrigins4Body =>
      'Dorodango\'nun son aşaması neredeyse paradoksal bir şey başarır: toprak aynaya dönüşür. Dünyanın en donuk maddesi — kir — yeterince sabırlı bir dikkat verildiğinde ışığı yansıtır. Antik Japon felsefesi burada hiçbir çelişki görmez. Parlaklık potansiyeli her zaman toprakta mevcuttu; usta yalnızca zaten orada olanı ortaya çıkardı. Bu, Japon estetiğinde tekrar eden bir fikirdir: zanatkâr güzelliği malzemeye dayatmaz, onu uyandırır. Elleriniz bu toprakla bir diyalog içindeydi ve parlaklık, toprağın size verdiği yanıttır.';

  @override
  String get reflectionOrigins4Source => 'Japon estetik felsefesi';

  @override
  String get reflectionWabi1Title => 'Kusursuzluğun Güzelliği';

  @override
  String get reflectionWabi1Body =>
      'Wabi-sabi, kusuru ve geçiciliği kabul etmeye dayanan Japon estetiğidir. Çatlak bir çay kasesi, eskimiş bir ahşap kiriş, taşlar arasında büyüyen yosun — bunlar kusur değil, zamanın ve kullanımın imzasıdır. Dorodangonuz mükemmel bir küre olmayacak. Ellerinizin özgün izini, toprağınızın özel bileşimini, yapıldığı günün nemini taşıyacak. Bu farklılıklar düzeltilmesi gereken hatalar değil, kürenizi yalnızca size ait kılan şeylerdir. Hiçbir iki dorodango birbirine benzemez ve asıl mesele de tam budur.';

  @override
  String get reflectionWabi1Source =>
      'Leonard Koren, Wabi-Sabi: for Artists, Designers, Poets & Philosophers';

  @override
  String get reflectionWabi2Title => 'Hiçbir Şey Sürmez';

  @override
  String get reflectionWabi2Body =>
      'Wabi-sabi\'nin üç temelinden biri geçiciliktir — hiçbir şey sürmez, hiçbir şey bitmez, hiçbir şey mükemmel değildir. Dorodangonuz tamamlandığında bile değişmeye devam eder. Haftalarca sertleşecektir. Aylar ve yıllar içinde yüzeyi ince ton değişimleri yaşayabilir. Düşerse kırılır ve kesit, çalışmanızın katmanlarını jeolojik tabakalar gibi gözler önüne serer. Bu geçicilik nesneyi küçültmez; derinleştirir. Sonsuz bir şey inşa etmiyorsunuz. Tıpkı kendiniz gibi, zamanın içinde güzelce var olan bir şey inşa ediyorsunuz.';

  @override
  String get reflectionWabi2Source => 'Richard Powell, Wabi Sabi Simple';

  @override
  String get reflectionWabi3Title => 'Araçların Yoksulluğu, Sonucun Zenginliği';

  @override
  String get reflectionWabi3Body =>
      'Wabi başlangıçta toplumdan uzakta, doğada yaşamanın yalnızlığını tanımlıyordu. Yüzyıllar içinde sadeliğin ve araçların yoksulluğunun güzelliğini takdir etmek üzere evrildi. Dorodango bu durumun belki de en saf ifadesidir: malzemeniz toprak ve su. Pahalı araç yok, özel ekipman yok, nadir malzeme yok. Sonucun zenginliği tamamen dikkatinizden kaynaklanır. Maliyeti genellikle kaliteyle eşitleyen bir dünyada, ayaklarınızın altındaki topraktan güzel bir nesne yapmak sessizce köktenci bir şeydir. Malzeme maliyeti sıfır. Yatırım, var olmaktır.';

  @override
  String get reflectionWabi3Source => 'Kakuzo Okakura, The Book of Tea';

  @override
  String get reflectionWabi4Title => 'Zaten Orada Olanı Görmek';

  @override
  String get reflectionWabi4Body =>
      'Wabi-sabi ustası güzellik yaratmaz; onu ortaya çıkarır. Bir bahçe tasarımcısı tek bir taş yerleştirmeden önce mevcut manzarayı görür. Bir çay ustası en gösterişli kaseyi değil, mevsime uygun olanı seçer. Dorodangonuzu cilaladığınızda, çamura güzellik boyamıyorsunuz; toprak parçacıklarının zaten sahip olduğu gizli parlaklığı açığa çıkarıyorsunuz. Sıkıştırılıp düzeltilmiş küçük mineral tanelerinin hizalanması ışığı doğal olarak yansıtır. Parlaklığı siz eklemediniş. Onu gizleyen her şeyi çıkardınız. Wabi-sabi yolu budur: eklemek değil çıkarmak, süslemek değil açığa çıkarmak.';

  @override
  String get reflectionWabi4Source =>
      'Soetsu Yanagi, The Beauty of Everyday Things';

  @override
  String get reflectionMa1Title => 'Aradaki Boşluk';

  @override
  String get reflectionMa1Body =>
      'Ma (間), Japon negatif alan kavramıdır — müziğe biçimini veren notalar arasındaki duraklama, bir odayı kullanılabilir kılan boşluk, anlamın yerleşmesine izin veren konuşmadaki sessizlik. Dorodango\'da kurutma aşaması saf ma\'dır. Gözle görünür hiçbir şey olmaz; ancak yüzeyin altında her şey değişir. Nem, kılcal etki yoluyla dışarı göç eder; parçacıklar oturur ve birbirine bağlanır. Küre, elleriniz çalışmadığında da çalışır. Bu görünmez sürece güvenmeyi öğrenmek — beklemeye de yapıp-etme kadar değer vermek — pratiğin sunduğu en derin derslerden biridir.';

  @override
  String get reflectionMa1Source => 'Arata Isozaki, MA: Space-Time in Japan';

  @override
  String get reflectionMa2Title => 'Boşluk Hiçlik Değildir';

  @override
  String get reflectionMa2Body =>
      'Batı düşüncesinde boş alan çoğunlukla yokluk olarak görülür — doldurulması gereken bir şey. Japon estetiğinde ise boşluk bir varlıktır. Geleneksel bir odadaki tokonoma nişi yalnızca bir tomar ve bir çiçek barındırır; çünkü etraflarındaki alan onlara güç verendir. Şu an dorodangonuz dinleniyor ve bu dinlenme boşa harcanan zaman değil. Eylemleriniz arasındaki duraklama malzemenin yanıt vermesine izin verir. Bu bir diyalogdur: şekillendirirsiniz, sonra dinlersiniz; sıkıştırırsınız, sonra beklersiniz. Küre, üretkenliğin ve dinginliğin zıt değil, ortak olduğunu öğretir; her biri diğerini anlamlı kılar.';

  @override
  String get reflectionMa2Source =>
      'Lao Tzu, Tao Te Ching (Bölüm 11), Japon yorumuyla';

  @override
  String get reflectionKintsugi1Title => 'Çatlaklardaki Altın';

  @override
  String get reflectionKintsugi1Body =>
      'Kintsugi, kırık seramiği altınla karıştırılmış lakla onarma sanatıdır. Hasarı gizlemek yerine onarım, nesnenin en güzel parçasına dönüşür. Tarihi on beşinci yüzyıla dayanır; bir Japon şogunun çatlak bir çay kasesini onarım için Çin\'e gönderdiği ve geri aldığı çirkin metal zımbalardan hayal kırıklığına uğradığı zamanlara. Japon ustalar daha güzel bir çözüm geliştirdi. Dorodangonuz kurutma sırasında çatlarsa bir kintsugi anıyla karşı karşıya kalırsınız: onu terk edebilir ya da çatlakla çalışarak onu kürenin hikâyesine katabilirsiniz. En çarpıcı dorodangolardan bazıları yüzeylerinde görünür bir tarih taşır.';

  @override
  String get reflectionKintsugi1Source =>
      'Christy Bartlett, Flickwerk: The Aesthetics of Mended Japanese Ceramics';

  @override
  String get reflectionKintsugi2Title => 'Kırılan Yerlerde Daha Güçlü';

  @override
  String get reflectionKintsugi2Body =>
      'Kintsugi felsefesi seramiğin çok ötesine geçer. Kırılma ve onarımın bir nesnenin tarihinin parçası olduğunu, gizlenmesi gereken bir şey olmadığını öne sürer. Dorodango\'ya uygulandığında bu şu anlama gelir: karşılaştığınız kusurlar — kullanımdan kaynaklanan küçük bir çukur, düzensiz bir tozlama bölgesi, farklı toprak katmanlarından gelen hafif renk farkı — başarısızlık değildir. Bunlar bölümlerdir. Her iz, yapım sürecinin bir anını kaydeder. Deneyimli dorodango ustaları, bir jeologun açığa çıkmış kayada yerin tarihini okuması gibi, bir kürenin tüm hikâyesini yüzeyinden okuyabildiklerini söyler.';

  @override
  String get reflectionKintsugi2Source => 'Japon zanaat felsefesi';

  @override
  String get reflectionShokunin1Title => 'Ustanın Ruhu';

  @override
  String get reflectionShokunin1Body =>
      'Shokunin Japonca\'da zanaatkâr veya usta anlamına gelir; ancak İngilizce çevirisinin önerdiğinden daha derin bir anlam taşır. Shokunin katagi — ustanın ruhu — kişinin zanaatına olan bağlılığını, becerinin ötesine geçerek ahlaki bir alana taşır. Shokunin, başkalarının yararına elinden gelenin en iyisini yapma konusunda toplumsal bir sorumluluk hisseder. Kendiniz için bir şey yaparken bile, kalite başkasının hayatına bağlıymış gibi çalışırsınız. Basit bir çamur küresine uygulanan bu odaklanma yoğunluğu, önemsiz görünebilecek bir etkinliği işinizin kalitesine gerçekten önem vermenin ne anlama geldiğine dair bir meditasyona dönüştürür.';

  @override
  String get reflectionShokunin1Source =>
      'Tashio Odate, Japanese Woodworking Tools';

  @override
  String get reflectionShokunin2Title => 'On Bin Saat Toprak';

  @override
  String get reflectionShokunin2Body =>
      'Geleneksel Japon zanaatlarında ustalık yıllarla değil, tekrar sayısıyla ölçülür. Bir suşi şefi yıllarını yalnızca pirinç hazırlamayı öğrenerek geçirir. Bir kılıç cilacısı bağımsız çalışmadan önce on yıllık çıraklığını tamamlar. Dorodango bu yolculuğun sıkıştırılmış bir versiyonunu izler: saatler içinde hayal kırıklığı, sıkıntı, akış ve tatmin döngüsünden geçersiniz. Yaptığınız her küre bir öncekinin öğretemeyeceği şeyleri öğretir. İkinci kürenin çekirdeği daha yoğun olacak. Üçüncünün tozlaması daha düzgün. Beşinciye gelindiğinde elleriniz zihninizin ifade edemeyeceği şeyleri bilecek. Bu shokunin yoludur — bedende yaşayan bilgi.';

  @override
  String get reflectionShokunin2Source => 'Japon çıraklık geleneği';

  @override
  String get reflectionShokunin3Title => 'Toz Konuşur';

  @override
  String get reflectionShokunin3Body =>
      'Yetenekli bir tozlama ustası, parmak uçlarıyla farklı boyutlardaki toprak parçacıkları arasındaki farkı hissedebilir. En ince parçacıklar — 200 gözenekli elekten geçenler — en pürüzsüz yüzeyi ve en derin parlaklığı yaratır. Ancak shokunin yaklaşımı yalnızca en ince tozu kullanmak değil; nedenini anlamaktır. Küçük parçacıklar daha sıkı paketlenir ve ışığın saçılması için daha az boşluk bırakır. Her tozlama katmanı yaklaşık yirmi mikron malzeme ekler. Beş ila on kat, bir oyun kartından daha ince ama ayna gibi cilalanabilecek kadar güçlü bir kabuk oluşturur. Bu ölçekte dikkat göstermek, zanaatkârlığın özüdür.';

  @override
  String get reflectionShokunin3Source => 'Dorodango malzeme bilimi';

  @override
  String get reflectionShokunin4Title => 'Cilacının Dokunuşu';

  @override
  String get reflectionShokunin4Body =>
      'Japon kılıç cilacıları, togishi, bir bıçağın gerçek karakterini ortaya çıkarma sanatını onlarca yıl boyunca mükemmelleştirir. Giderek daha ince taşlardan oluşan bir seriyle çalışırlar; her biri daha az malzeme kaldırır ve daha fazla ayrıntı ortaya çıkarır. Son aşamada parmak ucu büyüklüğünde bir taş çeliğin üzerinde neredeyse hiç basınç uygulamadan kayar. Dorodango parlatmak aynı ilkeyi izler: yüzey inceldikçe dokunuşunuz da hafiflemek zorundadır. Pürüzsüz bir yüzeye uygulanan ağır basınç cilalar değil, çizer. Son bitirme aşaması yüzeye neredeyse değmez. Buradaki ustalık, uyguladıklarınızla değil, uygulamamayı öğrendiklerinizle ölçülür.';

  @override
  String get reflectionShokunin4Source =>
      'Japon kılıç cilalama geleneği (togishi)';

  @override
  String get reflectionSoil1Title => 'Ayaklarınızın Altındaki Dünya';

  @override
  String get reflectionSoil1Body =>
      'Sağlıklı toprağın tek bir çay kaşığı, Dünya\'daki insanlardan daha fazla mikroorganizma içerir. Bakteriler, mantarlar, protozoa ve nematodlar binlerce yıldır oluşmakta olan canlı bir ağ kurar. Dorodangunuz için topladığınız toprak bu tarihi taşır. Mineral bileşimi, jeolojik zaman içinde aşınan alttaki ana kayayı yansıtır. Renk bir hikâye anlatır: kırmızı ve turuncular demir oksitlere, koyu kahverengi zengin organik maddeye, griler kil birikintilerine işaret eder. Her dorodango, geldiği yerin özgün bir portresidir — manzarasının derin hikâyesini taşıyan küçük bir küre.';

  @override
  String get reflectionSoil1Source =>
      'David Montgomery, Dirt: The Erosion of Civilizations';

  @override
  String get reflectionSoil2Title => 'Kil Hatırlar';

  @override
  String get reflectionSoil2Body =>
      'Kil, hafızası nedeniyle toprak bileşenleri arasında dikkat çekicidir. Kil parçacıkları düz ve plaka biçimlidir; sıkıştırıldıklarında paralel katmanlar halinde hizalanırlar — tıpkı bir kart destesini karıştırıp düz şekilde basmak gibi. Dorodangonuza mukavemetini ve parlaklık potansiyelini kazandıran işte bu hizalanmadır. Parçacıklar bir kez hizalandıktan sonra düzensizliğe dönmeye direnirler. Ellerinizin baskısını hatırlarlar. Bu bir metafor değil; fiziktir. Çekirdek oluşturma sırasındaki her sıkıştırma, milyonlarca parçacığı kalıcı olarak daha güçlü bir yapılandırmaya yeniden düzenler. Küre kelimenin tam anlamıyla özenizin biçimini alır.';

  @override
  String get reflectionSoil2Source => 'Toprak bilimi, kil mineralojisi';

  @override
  String get reflectionPatience1Title => 'Yavaş Açılış';

  @override
  String get reflectionPatience1Body =>
      'Modern hayat hıza göre optimize edilmiştir. Anında teslimat, gerçek zamanlı güncellemeler, anlık sonuçlar. Dorodango tüm bunlara direnir. Yalnızca kurutma aşaması saatler alır ve küreye zarar vermeden hızlandırmanın yolu yoktur. Bu dayatılmış sabır bir kusur değil, bir özelliktir. Akış hallerini araştıran bilim insanları, yavaş ve tekrarlı el işlerinin — örgü, ahşap oyma, çömlekçilik — beyindeki varsayılan mod ağını etkinleştirdiğini bulmuştur; bu ağ yaratıcılık ve öz-yansımayla ilişkili aynı ağdır. Dorodangonuz şu an yalnızca kurumakla kalmıyor; zihniniz bu acelesiz alanda en ilginç çalışmasını yapıyor olabilir.';

  @override
  String get reflectionPatience1Source => 'Mihaly Csikszentmihalyi, Flow';

  @override
  String get reflectionPatience2Title => 'Ellerin Bildikleri';

  @override
  String get reflectionPatience2Body =>
      'Japonca\'da bir atasözü vardır: «Eller, zihin anlamadan önce öğrenir.» Bir çocuğun ilk kez dorodango yaptığını izleyin ve bunu eylemde göreceksiniz. Ne yaptıklarını açıklayamadan önce, elleri basıncı, dönüş hızını ve nemi içgüdüsel olarak ayarlamaya başlar. Milyonlarca yıllık insan evrimi boyunca geliştirilen bu dokunsal zekâ, en az takdir gören kapasitelerimizden biridir. Ekranlar ve soyutlama çağında dorodango, fiziksel dünyayı kendi ellerinizle şekillendirme gibi temel insani eyleme bir geri dönüştür. Bu geriye değil, esasa yeniden bağlanmaktır.';

  @override
  String get reflectionPatience2Source => 'Frank Wilson, The Hand';

  @override
  String get voiceOutOfCredits =>
      'Yapay zeka krediniz bitti. Yine de ileri, tekrar ve yardım gibi komutlara yanıt verebilirim.';

  @override
  String get voiceError =>
      'Bir şeyler ters gitti. Tekrar denemek için küreye dokunun.';

  @override
  String get voiceConnectionLost =>
      'Bağlantı koptu. İnternetinizi kontrol edip küreye dokunun.';

  @override
  String get huntRadius => 'Arama yarıçapı';

  @override
  String radiusKm(int km) {
    return '$km km';
  }

  @override
  String get logoutConfirm => 'Hesabınızdan çıkış yapılsın mı?';

  @override
  String get wakeWordSetup =>
      '“Hey Doro” başlatılamadı. Bağlantınızı kontrol edip tekrar deneyin.';

  @override
  String get wakeWordPreparing =>
      '“Hey Doro” hazırlanıyor (tek seferlik indirme)…';
}
