import 'dart:math';
import '../../data/models/build_stage.dart';
import '../../l10n/app_localizations.dart';

enum ReflectionTheme {
  dorodangoOrigins,
  wabiSabi,
  ma,
  kintsugi,
  shokunin,
  soil,
  patience;

  String displayName(AppLocalizations l10n) => switch (this) {
        dorodangoOrigins => l10n.themeDorodangoOrigins,
        wabiSabi => l10n.themeWabiSabi,
        ma => l10n.themeMa,
        kintsugi => l10n.themeKintsugi,
        shokunin => l10n.themeShokunin,
        soil => l10n.themeSoil,
        patience => l10n.themePatience,
      };
}

class Reflection {
  final String id;
  final ReflectionTheme theme;
  final String Function(AppLocalizations) title;
  final String Function(AppLocalizations) body;
  final String Function(AppLocalizations) source;
  final List<BuildStage> relevantStages;
  final int estimatedReadTime;

  const Reflection({
    required this.id,
    required this.theme,
    required this.title,
    required this.body,
    required this.source,
    required this.relevantStages,
    required this.estimatedReadTime,
  });
}

abstract final class ReflectionContent {
  static List<Reflection> get all => _reflections;

  static List<Reflection> forStage(BuildStage stage) {
    return _reflections
        .where((r) => r.relevantStages.contains(stage))
        .toList();
  }

  static Reflection? pickForStage(BuildStage stage, Set<String> shownIds) {
    final candidates = forStage(stage)
        .where((r) => !shownIds.contains(r.id))
        .toList();
    if (candidates.isEmpty) return null;
    candidates.shuffle(Random());
    return candidates.first;
  }

  static Reflection? pickForCompletion(Set<String> shownIds) {
    return pickForStage(BuildStage.finished, shownIds);
  }

  static final List<Reflection> _reflections = [
    // --- dorodangoOrigins (4) ---
    Reflection(
      id: 'origins-1',
      theme: ReflectionTheme.dorodangoOrigins,
      title: (l10n) => l10n.reflectionOrigins1Title,
      body: (l10n) => l10n.reflectionOrigins1Body,
      source: (l10n) => l10n.reflectionOrigins1Source,
      relevantStages: [BuildStage.coreForming, BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'origins-2',
      theme: ReflectionTheme.dorodangoOrigins,
      title: (l10n) => l10n.reflectionOrigins2Title,
      body: (l10n) => l10n.reflectionOrigins2Body,
      source: (l10n) => l10n.reflectionOrigins2Source,
      relevantStages: [BuildStage.coreForming, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'origins-3',
      theme: ReflectionTheme.dorodangoOrigins,
      title: (l10n) => l10n.reflectionOrigins3Title,
      body: (l10n) => l10n.reflectionOrigins3Body,
      source: (l10n) => l10n.reflectionOrigins3Source,
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'origins-4',
      theme: ReflectionTheme.dorodangoOrigins,
      title: (l10n) => l10n.reflectionOrigins4Title,
      body: (l10n) => l10n.reflectionOrigins4Body,
      source: (l10n) => l10n.reflectionOrigins4Source,
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),

    // --- wabiSabi (4) ---
    Reflection(
      id: 'wabi-1',
      theme: ReflectionTheme.wabiSabi,
      title: (l10n) => l10n.reflectionWabi1Title,
      body: (l10n) => l10n.reflectionWabi1Body,
      source: (l10n) => l10n.reflectionWabi1Source,
      relevantStages: [BuildStage.drying, BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'wabi-2',
      theme: ReflectionTheme.wabiSabi,
      title: (l10n) => l10n.reflectionWabi2Title,
      body: (l10n) => l10n.reflectionWabi2Body,
      source: (l10n) => l10n.reflectionWabi2Source,
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'wabi-3',
      theme: ReflectionTheme.wabiSabi,
      title: (l10n) => l10n.reflectionWabi3Title,
      body: (l10n) => l10n.reflectionWabi3Body,
      source: (l10n) => l10n.reflectionWabi3Source,
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'wabi-4',
      theme: ReflectionTheme.wabiSabi,
      title: (l10n) => l10n.reflectionWabi4Title,
      body: (l10n) => l10n.reflectionWabi4Body,
      source: (l10n) => l10n.reflectionWabi4Source,
      relevantStages: [BuildStage.polishing, BuildStage.finished],
      estimatedReadTime: 2,
    ),

    // --- ma (2) ---
    Reflection(
      id: 'ma-1',
      theme: ReflectionTheme.ma,
      title: (l10n) => l10n.reflectionMa1Title,
      body: (l10n) => l10n.reflectionMa1Body,
      source: (l10n) => l10n.reflectionMa1Source,
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'ma-2',
      theme: ReflectionTheme.ma,
      title: (l10n) => l10n.reflectionMa2Title,
      body: (l10n) => l10n.reflectionMa2Body,
      source: (l10n) => l10n.reflectionMa2Source,
      relevantStages: [BuildStage.drying, BuildStage.finished],
      estimatedReadTime: 1,
    ),

    // --- kintsugi (2) ---
    Reflection(
      id: 'kintsugi-1',
      theme: ReflectionTheme.kintsugi,
      title: (l10n) => l10n.reflectionKintsugi1Title,
      body: (l10n) => l10n.reflectionKintsugi1Body,
      source: (l10n) => l10n.reflectionKintsugi1Source,
      relevantStages: [BuildStage.drying, BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'kintsugi-2',
      theme: ReflectionTheme.kintsugi,
      title: (l10n) => l10n.reflectionKintsugi2Title,
      body: (l10n) => l10n.reflectionKintsugi2Body,
      source: (l10n) => l10n.reflectionKintsugi2Source,
      relevantStages: [BuildStage.dustingCapping, BuildStage.polishing],
      estimatedReadTime: 1,
    ),

    // --- shokunin (4) ---
    Reflection(
      id: 'shokunin-1',
      theme: ReflectionTheme.shokunin,
      title: (l10n) => l10n.reflectionShokunin1Title,
      body: (l10n) => l10n.reflectionShokunin1Body,
      source: (l10n) => l10n.reflectionShokunin1Source,
      relevantStages: [BuildStage.coreForming, BuildStage.dustingCapping, BuildStage.polishing],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'shokunin-2',
      theme: ReflectionTheme.shokunin,
      title: (l10n) => l10n.reflectionShokunin2Title,
      body: (l10n) => l10n.reflectionShokunin2Body,
      source: (l10n) => l10n.reflectionShokunin2Source,
      relevantStages: [BuildStage.coreForming, BuildStage.polishing],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'shokunin-3',
      theme: ReflectionTheme.shokunin,
      title: (l10n) => l10n.reflectionShokunin3Title,
      body: (l10n) => l10n.reflectionShokunin3Body,
      source: (l10n) => l10n.reflectionShokunin3Source,
      relevantStages: [BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'shokunin-4',
      theme: ReflectionTheme.shokunin,
      title: (l10n) => l10n.reflectionShokunin4Title,
      body: (l10n) => l10n.reflectionShokunin4Body,
      source: (l10n) => l10n.reflectionShokunin4Source,
      relevantStages: [BuildStage.polishing],
      estimatedReadTime: 1,
    ),

    // --- soil (2) ---
    Reflection(
      id: 'soil-1',
      theme: ReflectionTheme.soil,
      title: (l10n) => l10n.reflectionSoil1Title,
      body: (l10n) => l10n.reflectionSoil1Body,
      source: (l10n) => l10n.reflectionSoil1Source,
      relevantStages: [BuildStage.coreForming, BuildStage.drying],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'soil-2',
      theme: ReflectionTheme.soil,
      title: (l10n) => l10n.reflectionSoil2Title,
      body: (l10n) => l10n.reflectionSoil2Body,
      source: (l10n) => l10n.reflectionSoil2Source,
      relevantStages: [BuildStage.coreForming, BuildStage.drying],
      estimatedReadTime: 1,
    ),

    // --- patience (2) ---
    Reflection(
      id: 'patience-1',
      theme: ReflectionTheme.patience,
      title: (l10n) => l10n.reflectionPatience1Title,
      body: (l10n) => l10n.reflectionPatience1Body,
      source: (l10n) => l10n.reflectionPatience1Source,
      relevantStages: [BuildStage.drying],
      estimatedReadTime: 1,
    ),
    Reflection(
      id: 'patience-2',
      theme: ReflectionTheme.patience,
      title: (l10n) => l10n.reflectionPatience2Title,
      body: (l10n) => l10n.reflectionPatience2Body,
      source: (l10n) => l10n.reflectionPatience2Source,
      relevantStages: [BuildStage.coreForming, BuildStage.drying, BuildStage.dustingCapping],
      estimatedReadTime: 1,
    ),
  ];
}
