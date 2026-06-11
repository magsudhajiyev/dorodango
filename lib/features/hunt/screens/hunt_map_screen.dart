import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/plant_model.dart';
import '../../soil/providers/soil_provider.dart';
import '../providers/hunt_provider.dart';
import '../widgets/dorodango_ball.dart';

/// How close (in meters) a hunter must be to claim a find.
const double _claimRadiusMeters = 30;

class HuntMapScreen extends ConsumerStatefulWidget {
  const HuntMapScreen({super.key});

  @override
  ConsumerState<HuntMapScreen> createState() => _HuntMapScreenState();
}

class _HuntMapScreenState extends ConsumerState<HuntMapScreen> {
  late final ConfettiController _confetti;
  PlantModel? _selected;
  bool _claiming = false;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: const Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(huntProvider.notifier).load();
    });
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  Future<void> _claim(PlantModel plant) async {
    final l10n = AppLocalizations.of(context);
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _claiming = true);
    try {
      // Claiming needs the hunter's actual current spot — request a fresh
      // high-accuracy fix (still time-capped by the location service).
      final position = await ref
          .read(locationServiceProvider)
          .getCurrentPosition(fresh: true);
      const distance = Distance();
      final meters = distance.as(
        LengthUnit.Meter,
        LatLng(position.latitude, position.longitude),
        LatLng(plant.latitude, plant.longitude),
      );
      if (meters > _claimRadiusMeters) {
        messenger.showSnackBar(SnackBar(
          content: Text(
            '${l10n.getCloser} — ${l10n.metersAway(meters.round())}',
          ),
        ));
        return;
      }
      await ref.read(huntProvider.notifier).markFound(plant);
      if (!mounted) return;
      setState(() => _selected = null);
      _confetti.play();
      messenger.showSnackBar(SnackBar(
        content: Text(l10n.foundCongrats),
        backgroundColor: AppColors.moss,
      ));
    } catch (_) {
      messenger.showSnackBar(SnackBar(content: Text(l10n.plantFailed)));
    } finally {
      if (mounted) setState(() => _claiming = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hunt = ref.watch(huntProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.hunt),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () => ref.read(huntProvider.notifier).refresh(),
          ),
        ],
      ),
      body: switch (hunt.status) {
        HuntStatus.idle || HuntStatus.locating || HuntStatus.loading =>
          const Center(
            child: CircularProgressIndicator(color: AppColors.clay),
          ),
        HuntStatus.locationDenied => _CenteredMessage(
            message: l10n.huntLocationNeeded,
            onRetry: () => ref.read(huntProvider.notifier).load(),
            retryLabel: l10n.retry,
          ),
        HuntStatus.error => _CenteredMessage(
            message: l10n.plantFailed,
            onRetry: () => ref.read(huntProvider.notifier).refresh(),
            retryLabel: l10n.retry,
          ),
        HuntStatus.ready => _buildMap(l10n, hunt),
      },
    );
  }

  Widget _buildMap(AppLocalizations l10n, HuntState hunt) {
    final center = LatLng(hunt.latitude!, hunt.longitude!);

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: center,
            initialZoom: 14,
            minZoom: 3,
            maxZoom: 18,
            onTap: (_, _) => setState(() => _selected = null),
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.dorodango.dorodango',
            ),
            MarkerLayer(
              markers: [
                // The hunter.
                Marker(
                  point: center,
                  width: 26,
                  height: 26,
                  child: const _HunterMarker(),
                ),
                // Planted dorodangos, pulsing to invite a tap.
                for (final plant in hunt.plants)
                  Marker(
                    point: LatLng(plant.latitude, plant.longitude),
                    width: 52,
                    height: 52,
                    child: GestureDetector(
                      onTap: () => setState(() => _selected = plant),
                      child: _PulsingPlantMarker(
                        selected: _selected?.id == plant.id,
                      ),
                    ),
                  ),
              ],
            ),
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution('OpenStreetMap contributors'),
              ],
            ),
          ],
        ),

        // Confetti for a successful find.
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confetti,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 36,
            maxBlastForce: 24,
            minBlastForce: 8,
            gravity: 0.25,
            colors: const [
              AppColors.shine,
              AppColors.clay,
              AppColors.moss,
              AppColors.ochre,
            ],
          ),
        ),

        if (hunt.plants.isEmpty)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(AppSpacing.md),
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm,
              ),
              decoration: BoxDecoration(
                color: AppColors.bg.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(l10n.noPlantsNearby, style: AppTypography.caption),
            ).animate().fadeIn(duration: 400.ms).moveY(begin: 16, end: 0),
          )
        else if (_selected != null)
          Align(
            alignment: Alignment.bottomCenter,
            child: _PlantDetailPanel(
              plant: _selected!,
              origin: center,
              claiming: _claiming,
              onClaim: () => _claim(_selected!),
            ),
          ),
      ],
    );
  }
}

class _HunterMarker extends StatelessWidget {
  const _HunterMarker();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xFF4A7FB5),
        border: Border.all(color: Colors.white, width: 3),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.3),
            blurRadius: 6,
          ),
        ],
      ),
    );
  }
}

class _PulsingPlantMarker extends StatelessWidget {
  final bool selected;

  const _PulsingPlantMarker({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Soft halo breathing behind the ball.
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.shine.withValues(alpha: selected ? 0.6 : 0.35),
          ),
        )
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .scaleXY(begin: 0.7, end: 1.15, duration: 1100.ms,
                curve: Curves.easeInOut)
            .fade(begin: 0.5, end: 1, duration: 1100.ms),
        const DorodangoBall(size: 30)
            .animate(onPlay: (c) => c.repeat(reverse: true))
            .moveY(begin: 0, end: -3, duration: 1100.ms,
                curve: Curves.easeInOut),
      ],
    );
  }
}

class _PlantDetailPanel extends StatelessWidget {
  final PlantModel plant;
  final LatLng origin;
  final bool claiming;
  final VoidCallback onClaim;

  const _PlantDetailPanel({
    required this.plant,
    required this.origin,
    required this.claiming,
    required this.onClaim,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    const distance = Distance();
    final meters = distance
        .as(LengthUnit.Meter, origin, LatLng(plant.latitude, plant.longitude));
    final withinReach = meters <= _claimRadiusMeters;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.18),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const DorodangoBall(size: 40),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.metersAway(math.max(0, meters.round())),
                      style: AppTypography.label,
                    ),
                    if (!withinReach)
                      Text(
                        l10n.getCloser,
                        style: AppTypography.caption,
                      ),
                  ],
                ),
              ),
            ],
          ),
          if (plant.hint != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              '${l10n.hintLabel}: ${plant.hint}',
              style: AppTypography.body.copyWith(
                color: AppColors.inkSoft,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: claiming ? null : onClaim,
              icon: claiming
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(Icons.celebration_rounded),
              label: Text(l10n.foundIt),
            ),
          ),
        ],
      ),
    ).animate().moveY(begin: 60, end: 0, duration: 300.ms,
        curve: Curves.easeOutCubic).fadeIn(duration: 250.ms);
  }
}

class _CenteredMessage extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  final String retryLabel;

  const _CenteredMessage({
    required this.message,
    required this.onRetry,
    required this.retryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              style: AppTypography.body.copyWith(color: AppColors.inkSoft),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(onPressed: onRetry, child: Text(retryLabel)),
          ],
        ),
      ),
    );
  }
}
