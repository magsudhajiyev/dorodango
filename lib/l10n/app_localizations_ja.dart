// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => '泥だんご';

  @override
  String get appSubtitle => '土を磨く芸術';

  @override
  String get retry => '再試行';

  @override
  String get skip => 'スキップ';

  @override
  String error(String message) {
    return 'エラー：$message';
  }

  @override
  String get soilSourceHint => '土はどこで見つけましたか？（任意）';

  @override
  String get startNewBuild => '新しいプロジェクト';

  @override
  String get viewBuildLog => '記録を見る';

  @override
  String get buildLog => '記録';

  @override
  String get buildDetail => 'プロジェクト詳細';

  @override
  String get noBuildsYet => 'まだプロジェクトはありません';

  @override
  String get startFirstDorodango => '最初の泥だんごを始めましょう！';

  @override
  String get noStagesRecorded => '段階が記録されていません。';

  @override
  String get unknownSoil => '不明な土';

  @override
  String get statusComplete => '完了';

  @override
  String get statusInProgress => '進行中';

  @override
  String get statusAbandoned => '中断';

  @override
  String get buildCompleteTitle => 'あなたの泥だんご\nは完成です';

  @override
  String get buildCompleteBody =>
      '生の土から鏡のような輝きへ。\n涼しく乾燥した場所に保管してください。\n数週間かけてさらに硬くなります。';

  @override
  String get startAnotherBuild => '新しいプロジェクト';

  @override
  String get nextStage => '次の段階';

  @override
  String get completeBuild => 'プロジェクト完了';

  @override
  String get tapToSpeak => 'タップして話す';

  @override
  String get captureProgress => '進捗を記録';

  @override
  String get captureSubtitle => '記録用に写真を撮りましょう。';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromGallery => 'ギャラリーから選択';

  @override
  String suggestedDuration(String duration) {
    return '推奨：約$duration';
  }

  @override
  String durationHours(int hours) {
    return '$hours時間';
  }

  @override
  String durationMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String get settings => '設定';

  @override
  String get language => '言語';

  @override
  String get systemDefault => 'システムの設定';

  @override
  String get stageCoreForming => '芯の形成';

  @override
  String get stageDrying => '乾燥';

  @override
  String get stageDustingCapping => '粉かけと被覆';

  @override
  String get stagePolishing => '磨き';

  @override
  String get stageFinished => '完成';

  @override
  String get coreFormingSummary => '土を集めて固い球体に圧縮します。';

  @override
  String get coreFormingStep1 => '粘土と細かい砂が混ざった土を見つけます。純粋な粘土や砂は避けましょう。';

  @override
  String get coreFormingStep2 => '握った時にまとまるまで徐々に水を加えます。';

  @override
  String get coreFormingStep3 => 'テニスボール程度の大きさの球を作ります。';

  @override
  String get coreFormingStep4 => '丸い形を保つために常に回転させながら、しっかりと握って圧縮します。';

  @override
  String get coreFormingStep5 => '芯が固く感じるまで15〜20分間圧縮を続けます。';

  @override
  String get coreFormingTip => '芯はサイズの割に密度が高く重く感じるべきです。崩れる場合は、もう少し水を加えてください。';

  @override
  String get coreFormingMistake =>
      '水が多すぎると芯がベタベタして形が作りにくくなります。思ったより乾いた状態から始めましょう。';

  @override
  String get coreFormingVoice =>
      '芯を形成する時間です。粘土と細かい砂がよく混ざった土を見つけましょう。徐々に水を加えて、テニスボール程度の固い球に絞ります。15分から20分間回転させながら圧縮し、固くて密度のある状態にします。';

  @override
  String get dryingSummary => '形を維持しながら水分を表面に移動させます。';

  @override
  String get dryingStep1 => '球を柔らかい面に置くか、優しく持ちます。';

  @override
  String get dryingStep2 => '水分が表面に移動するまで20〜30分待ちます。';

  @override
  String get dryingStep3 => '表面が湿ったら、緩い材料を優しく払い落とします。';

  @override
  String get dryingStep4 => 'サイクルを繰り返します。この段階は数時間かかることがあります。';

  @override
  String get dryingStep5 => '表面がもう湿っていなければ、粉かけの準備ができています。';

  @override
  String get dryingTip => 'ここでは忍耐がすべてです。急ぐとひび割れの原因になります。';

  @override
  String get dryingMistake => '直射日光で急速に乾燥させると表面にひびが入ります。日陰でゆっくり乾かしましょう。';

  @override
  String get dryingVoice =>
      '次は乾燥です。球を優しく置いて、水分が表面に達するまで20分から30分待ちます。湿ったら、緩い材料を払い落とします。このサイクルを繰り返します。表面がもう湿っていなければ粉かけの準備ができています。忍耐が必要です。通常数時間かかります。';

  @override
  String get dustingCappingSummary => '乾いた細かい土の層を塗布して滑らかな外殻を作ります。';

  @override
  String get dustingCappingStep1 => '土を細かいメッシュでふるいにかけ、超微粉を得ます。';

  @override
  String get dustingCappingStep2 => '球の上に薄く粉を振りかけます。';

  @override
  String get dustingCappingStep3 => '手のひらや親指で表面に粉を優しくすり込みます。';

  @override
  String get dustingCappingStep4 => '塗布の間に10〜15分休ませます。';

  @override
  String get dustingCappingStep5 => '表面が均一に滑らかになるまで5〜10回塗布します。';

  @override
  String get dustingCappingTip => '粉が細かいほど、最終的な輝きが良くなります。見つけられる最も細かい粒子を使いましょう。';

  @override
  String get dustingCappingMistake => '粉を厚く塗りすぎると剥がれの原因になります。薄く均一な層がカギです。';

  @override
  String get dustingCappingVoice =>
      '粉かけと被覆の時間です。土をふるいにかけて最も細かい粉を得ます。球の上に薄い層を振りかけ、手のひらで優しくすり込みます。塗布の間に10分から15分休ませます。表面が均一に滑らかになるまで5回から10回塗布します。';

  @override
  String get polishingSummary => '表面を磨いて自然な輝きを出します。';

  @override
  String get polishingStep1 => '表面が完全に乾いていることを確認します。';

  @override
  String get polishingStep2 => '滑らかな面（ビニール袋、ガラス瓶、柔らかい布）で球を優しくこすります。';

  @override
  String get polishingStep3 => '円を描く動きで軽く一定の圧力をかけます。';

  @override
  String get polishingStep4 => '均一な輝きのために頻繁に回転させながら全表面を磨きます。';

  @override
  String get polishingStep5 => '30〜60分間続けます。輝きは徐々に現れます。';

  @override
  String get polishingTip => '圧力は少ない方が良いです。道具を滑らせましょう。強く押すと表面を傷つけることがあります。';

  @override
  String get polishingMistake => '完全に乾く前に磨くと水分が閉じ込められ、くすんだ斑点ができます。';

  @override
  String get polishingVoice =>
      '磨く時間です。表面が完全に乾いていることを確認してください。ビニール袋やガラス瓶のような滑らかな面で、球を円を描くように優しくこすります。圧力は軽く一定に保ちます。30分から60分間全表面を磨きます。輝きは徐々に現れます。';

  @override
  String get finishedSummary => '泥だんごが完成しました。作品を鑑賞しましょう！';

  @override
  String get finishedStep1 => '完成した球の最後の写真を撮ります。';

  @override
  String get finishedStep2 => '直射日光の当たらない涼しく乾燥した場所に保管します。';

  @override
  String get finishedStep3 => '球は数週間かけてさらに硬くなります。';

  @override
  String get finishedStep4 => '丁寧に扱いましょう。磨いた表面は壊れやすいです。';

  @override
  String get finishedTip => '柔らかい面の上に飾りましょう。木製の台を作る人もいます。';

  @override
  String get finishedMistake => '落とさないで！優しく扱いましょう。磨いた殻は薄いです。';

  @override
  String get finishedVoice =>
      'おめでとうございます！泥だんごが完成しました。最後の写真を撮って、涼しく乾燥した場所に保管してください。数週間かけてさらに硬くなります。丁寧に扱い、作品を楽しんでください。';

  @override
  String helpResponse(int order, String title, String summary) {
    return '今は段階$order/5：$titleです。$summary';
  }

  @override
  String get dryingTimeResponse => '乾燥には通常2〜4時間かかります。忍耐強く、20〜30分ごとに確認してください。';

  @override
  String get dryingTimeNotOnStage => '現在乾燥の段階ではありません。乾燥は芯の形成の後に来ます。';

  @override
  String whatWentWrongResponse(String mistake) {
    return 'この段階でよくある間違い：$mistake';
  }

  @override
  String get diagnoseStubResponse =>
      '写真診断は将来のアップデートで利用可能になります。今のところ、現在の段階のよくある間違いを確認してください。';

  @override
  String get alreadyComplete => '泥だんごはすでに完成しています！';

  @override
  String get voiceUnknownCommand => '理解できませんでした。次、繰り返し、ヘルプ、または問題と言ってみてください。';

  @override
  String get continueBuild => '制作を再開';

  @override
  String stageProgress(int order, String stageName) {
    return '段階$order/5 — $stageName';
  }

  @override
  String get reflections => '考察';

  @override
  String get readMore => '続きを読む';

  @override
  String get listenLabel => '聴く';

  @override
  String get sourcePrefix => '出典：';

  @override
  String estimatedReadTime(int minutes) {
    return '約$minutes分で読めます';
  }

  @override
  String get analyzingPhoto => '写真を分析中...';

  @override
  String get diagnosisError => '写真を分析できませんでした。タップして再試行。';

  @override
  String get photoUnclear => '写真が不鮮明';
}
