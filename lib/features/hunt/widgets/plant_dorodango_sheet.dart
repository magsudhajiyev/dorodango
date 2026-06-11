import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../auth/providers/auth_provider.dart';
import '../../soil/providers/soil_provider.dart';
import '../../soil/services/location_service.dart';
import '../providers/hunt_provider.dart';
import 'dorodango_ball.dart';

/// Bottom sheet flow for planting a finished dorodango at the user's
/// current location, ending in a celebratory drop-and-ripple animation.
class PlantDorodangoSheet extends ConsumerStatefulWidget {
  final String? buildId;

  const PlantDorodangoSheet({super.key, this.buildId});

  static Future<void> show(BuildContext context, {String? buildId}) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => PlantDorodangoSheet(buildId: buildId),
    );
  }

  @override
  ConsumerState<PlantDorodangoSheet> createState() =>
      _PlantDorodangoSheetState();
}

enum _Phase { form, planted, locationDenied, error }

class _PlantDorodangoSheetState extends ConsumerState<PlantDorodangoSheet> {
  final _hintController = TextEditingController();
  _Phase _phase = _Phase.form;

  @override
  void dispose() {
    _hintController.dispose();
    super.dispose();
  }

  Future<void> _plant() async {
    final uid = ref.read(authStateProvider).valueOrNull?.uid;
    if (uid == null) {
      setState(() => _phase = _Phase.error);
      return;
    }
    // Optimistic: start the celebration immediately; the location fetch and
    // write almost always finish well within the animation. On failure the
    // sheet swaps to the error state.
    setState(() => _phase = _Phase.planted);
    try {
      final position =
          await ref.read(locationServiceProvider).getCurrentPosition();
      await ref.read(huntRepositoryProvider).plant(
            ownerUid: uid,
            latitude: position.latitude,
            longitude: position.longitude,
            buildId: widget.buildId,
            hint: _hintController.text,
          );
      // Register for hunt pushes too, so planting also opts you in.
      // ignore: unawaited_futures
      ref.read(huntNotificationServiceProvider).register(
            uid: uid,
            latitude: position.latitude,
            longitude: position.longitude,
          );
    } on LocationPermissionException {
      if (mounted) setState(() => _phase = _Phase.locationDenied);
    } catch (_) {
      if (mounted) setState(() => _phase = _Phase.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.lg,
        right: AppSpacing.lg,
        top: AppSpacing.lg,
        bottom: MediaQuery.of(context).viewInsets.bottom + AppSpacing.lg,
      ),
      child: AnimatedSize(
        duration: 300.ms,
        curve: Curves.easeOut,
        child: switch (_phase) {
          _Phase.form => _buildForm(l10n),
          _Phase.planted => _PlantedCelebration(l10n: l10n),
          _Phase.locationDenied => _buildMessage(
              l10n.soilLocationDenied,
              l10n,
              isError: true,
            ),
          _Phase.error => _buildMessage(l10n.plantFailed, l10n, isError: true),
        },
      ),
    );
  }

  Widget _buildForm(AppLocalizations l10n) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: const DorodangoBall(size: 72)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .moveY(begin: 0, end: -6, duration: 1200.ms, curve: Curves.easeInOut),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          l10n.plantDorodango,
          style: AppTypography.h2,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          l10n.plantExplainer,
          style: AppTypography.body.copyWith(color: AppColors.inkSoft),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.lg),
        TextField(
          controller: _hintController,
          decoration: InputDecoration(hintText: l10n.plantHintHint),
          textCapitalization: TextCapitalization.sentences,
          maxLength: 120,
        ),
        const SizedBox(height: AppSpacing.md),
        SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            onPressed: _plant,
            icon: const Icon(Icons.park_rounded),
            label: Text(l10n.plantItHere),
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(String message, AppLocalizations l10n,
      {bool isError = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: AppTypography.body
                .copyWith(color: isError ? AppColors.error : AppColors.ink),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          TextButton(
            onPressed: () => setState(() => _phase = _Phase.form),
            child: Text(l10n.retry),
          ),
        ],
      ),
    );
  }
}

/// Ball drops with a bounce, ripple rings spread, sparkles pop,
/// then the confirmation text shimmers in.
class _PlantedCelebration extends StatelessWidget {
  final AppLocalizations l10n;

  const _PlantedCelebration({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Ripple rings expanding from the landing spot.
                for (var i = 0; i < 3; i++)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 60,
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(999),
                        border: Border.all(
                          color: AppColors.earth.withValues(alpha: 0.45),
                          width: 2,
                        ),
                      ),
                    )
                        .animate(delay: (650 + i * 220).ms)
                        .scaleXY(begin: 0.4, end: 2.4, duration: 900.ms)
                        .fadeOut(duration: 900.ms),
                  ),
                // Sparkles popping around the landing spot.
                for (final (dx, delayMs) in [(-58.0, 800), (52.0, 950), (-30.0, 1100), (38.0, 1250)])
                  Positioned(
                    bottom: 40 + (delayMs % 3) * 10,
                    left: 0,
                    right: 0,
                    child: Transform.translate(
                      offset: Offset(dx, 0),
                      child: const Icon(
                        Icons.auto_awesome,
                        size: 18,
                        color: AppColors.shine,
                      ),
                    ),
                  )
                      .animate(delay: delayMs.ms)
                      .fadeIn(duration: 250.ms)
                      .scaleXY(begin: 0.3, end: 1.2, duration: 350.ms)
                      .then()
                      .fadeOut(duration: 400.ms),
                // The dorodango drops in and settles.
                Padding(
                  padding: const EdgeInsets.only(bottom: 6),
                  child: const DorodangoBall(size: 84)
                      .animate()
                      .moveY(
                        begin: -150,
                        end: 0,
                        duration: 750.ms,
                        curve: Curves.bounceOut,
                      )
                      .then(delay: 50.ms)
                      .scaleY(begin: 1, end: 0.94, duration: 90.ms)
                      .then()
                      .scaleY(begin: 0.94, end: 1, duration: 140.ms),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.planted,
            style: AppTypography.h2,
            textAlign: TextAlign.center,
          )
              .animate(delay: 900.ms)
              .fadeIn(duration: 400.ms)
              .shimmer(delay: 300.ms, duration: 1200.ms, color: AppColors.shine),
          const SizedBox(height: AppSpacing.lg),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(MaterialLocalizations.of(context).closeButtonLabel),
          ).animate(delay: 1400.ms).fadeIn(),
        ],
      ),
    );
  }
}
