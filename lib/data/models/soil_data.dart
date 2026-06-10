enum SoilSuitability { good, okay, sandy }

class SoilData {
  /// World Reference Base soil class, e.g. "Cambisols".
  final String? wrbClass;

  /// Topsoil (0–5 cm) composition in percent.
  final double? clayPct;
  final double? sandPct;
  final double? siltPct;

  final double latitude;
  final double longitude;

  const SoilData({
    required this.latitude,
    required this.longitude,
    this.wrbClass,
    this.clayPct,
    this.sandPct,
    this.siltPct,
  });

  bool get hasComposition =>
      clayPct != null && sandPct != null && siltPct != null;

  /// Dorodango needs enough clay to bind; sandy soil crumbles.
  SoilSuitability? get suitability {
    final clay = clayPct;
    if (clay == null) return null;
    if (clay >= 25) return SoilSuitability.good;
    if (clay >= 12) return SoilSuitability.okay;
    return SoilSuitability.sandy;
  }
}
