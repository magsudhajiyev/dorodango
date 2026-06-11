import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/plant_model.dart';
import '../providers/hunt_provider.dart';
import '../widgets/dorodango_ball.dart';

/// Trophy shelf of every dorodango this user has hunted down.
class CollectionScreen extends ConsumerWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final plantsAsync = ref.watch(foundPlantsProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.myCollection)),
      body: plantsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.clay),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.plantFailed,
                  style:
                      AppTypography.body.copyWith(color: AppColors.inkSoft),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.sm),
                TextButton(
                  onPressed: () => ref.invalidate(foundPlantsProvider),
                  child: Text(l10n.retry),
                ),
              ],
            ),
          ),
        ),
        data: (plants) => plants.isEmpty
            ? _EmptyCollection(l10n: l10n)
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: Text(
                      l10n.collectionCount(plants.length),
                      style: AppTypography.caption,
                    ).animate().fadeIn(duration: 300.ms),
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(AppSpacing.lg),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: AppSpacing.md,
                        crossAxisSpacing: AppSpacing.md,
                        childAspectRatio: 0.92,
                      ),
                      itemCount: plants.length,
                      itemBuilder: (context, index) => _CollectionTile(
                        plant: plants[index],
                        index: index,
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _CollectionTile extends StatelessWidget {
  final PlantModel plant;
  final int index;

  const _CollectionTile({required this.plant, required this.index});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final foundAt = plant.foundAt;
    // Slight size variation per trophy for a collectible feel.
    final ballSize = 60.0 + (plant.id.hashCode.abs() % 16);

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () => _showDetails(context),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.inkSoft.withValues(alpha: 0.15)),
        ),
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DorodangoBall(size: ballSize),
            const SizedBox(height: AppSpacing.sm),
            if (foundAt != null)
              Text(
                DateFormat.yMMMd(locale).format(foundAt),
                style: AppTypography.caption,
              ),
            if (plant.hint != null) ...[
              const SizedBox(height: AppSpacing.xxs),
              Text(
                plant.hint!,
                style: AppTypography.caption.copyWith(
                  color: AppColors.inkFaint,
                  fontStyle: FontStyle.italic,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    )
        .animate(delay: (60 * (index % 10)).ms)
        .fadeIn(duration: 350.ms)
        .scaleXY(begin: 0.9, end: 1, curve: Curves.easeOutBack);
  }

  void _showDetails(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context).toString();
    final foundAt = plant.foundAt;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bg,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const DorodangoBall(size: 96)
                  .animate(onPlay: (c) => c.repeat())
                  .shimmer(
                    delay: 600.ms,
                    duration: 1800.ms,
                    color: AppColors.shine.withValues(alpha: 0.6),
                  ),
              const SizedBox(height: AppSpacing.md),
              if (foundAt != null)
                Text(
                  l10n.foundOnDate(DateFormat.yMMMd(locale).format(foundAt)),
                  style: AppTypography.h2,
                  textAlign: TextAlign.center,
                ),
              if (plant.hint != null) ...[
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '${l10n.hintLabel}: ${plant.hint}',
                  style: AppTypography.body.copyWith(
                    color: AppColors.inkSoft,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyCollection extends StatelessWidget {
  final AppLocalizations l10n;

  const _EmptyCollection({required this.l10n});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Opacity(
              opacity: 0.45,
              child: const DorodangoBall(size: 88)
                  .animate(onPlay: (c) => c.repeat(reverse: true))
                  .moveY(begin: 0, end: -8, duration: 1400.ms,
                      curve: Curves.easeInOut),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.collectionEmpty,
              style: AppTypography.body.copyWith(color: AppColors.inkSoft),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.md),
            TextButton.icon(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.explore_rounded, size: 18),
              label: Text(l10n.goHunting),
              style: TextButton.styleFrom(foregroundColor: AppColors.clay),
            ),
          ],
        ),
      ),
    );
  }
}
