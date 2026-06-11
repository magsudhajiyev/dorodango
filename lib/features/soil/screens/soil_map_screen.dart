import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/soil_data.dart';
import '../providers/soil_prediction_provider.dart';
import '../providers/soil_provider.dart';
import '../widgets/soil_card.dart';
import '../widgets/soil_prediction_card.dart';

/// World soil map: OpenStreetMap base tiles with the ISRIC SoilGrids
/// WRB classification overlaid as a WMS layer. Pinch to zoom; tap a point
/// to fetch its soil data and an optional AI dorodango prediction.
class SoilMapScreen extends ConsumerStatefulWidget {
  const SoilMapScreen({super.key});

  @override
  ConsumerState<SoilMapScreen> createState() => _SoilMapScreenState();
}

class _SoilMapScreenState extends ConsumerState<SoilMapScreen> {
  LatLng? _tappedPoint;

  void _onMapTap(TapPosition tapPosition, LatLng point) {
    setState(() => _tappedPoint = point);
    ref.read(soilPredictionProvider.notifier).reset();
    ref.read(mapSoilProvider.notifier).lookup(point.latitude, point.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    // Start at the soil detected on the home screen, if there is one.
    final homeSoil = ref.read(soilProvider)?.valueOrNull;
    final initialCenter = homeSoil != null
        ? LatLng(homeSoil.latitude, homeSoil.longitude)
        : const LatLng(20, 0);
    final initialZoom = homeSoil != null ? 8.0 : 2.0;

    final soilState = ref.watch(mapSoilProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.soilMap)),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: initialCenter,
              initialZoom: initialZoom,
              minZoom: 2,
              maxZoom: 17,
              onTap: _onMapTap,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.dorodango.dorodango',
              ),
              // WRB soil classification overlay from ISRIC SoilGrids.
              Opacity(
                opacity: 0.55,
                child: TileLayer(
                  wmsOptions: WMSTileLayerOptions(
                    baseUrl: 'https://maps.isric.org/mapserv?map=/map/wrb.map&',
                    layers: const ['MostProbable'],
                    format: 'image/png',
                    transparent: true,
                  ),
                  userAgentPackageName: 'com.dorodango.dorodango',
                ),
              ),
              if (_tappedPoint != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _tappedPoint!,
                      width: 36,
                      height: 36,
                      alignment: Alignment.topCenter,
                      child: const Icon(
                        Icons.place,
                        size: 36,
                        color: AppColors.clayDeep,
                      ),
                    ),
                  ],
                ),
              RichAttributionWidget(
                attributions: [
                  TextSourceAttribution('OpenStreetMap contributors'),
                  TextSourceAttribution('ISRIC SoilGrids'),
                ],
              ),
            ],
          ),
          if (soilState == null)
            // Hint shown until the first tap.
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.all(AppSpacing.md),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.bg.withValues(alpha: 0.9),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(l10n.soilMapHint, style: AppTypography.caption),
              ),
            )
          else
            Align(
              alignment: Alignment.bottomCenter,
              child: _SoilResultPanel(soilState: soilState),
            ),
        ],
      ),
    );
  }
}

class _SoilResultPanel extends ConsumerWidget {
  final AsyncValue<SoilData> soilState;

  const _SoilResultPanel({required this.soilState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(AppSpacing.md),
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.45,
      ),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(AppSpacing.sm),
      child: SingleChildScrollView(
        child: soilState.when(
          loading: () => Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.inkSoft,
                  ),
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(l10n.soilDetecting, style: AppTypography.caption),
              ],
            ),
          ),
          error: (_, _) => Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Text(
              l10n.soilLookupFailed,
              style: AppTypography.caption.copyWith(color: AppColors.error),
              textAlign: TextAlign.center,
            ),
          ),
          data: (data) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SoilCard(data: data),
              const SizedBox(height: AppSpacing.xs),
              SoilPredictionCard(soil: data),
            ],
          ),
        ),
      ),
    );
  }
}
