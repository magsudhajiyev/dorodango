import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/reflection_content.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../routing/route_names.dart';

class ReflectionsScreen extends StatelessWidget {
  const ReflectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final grouped = <ReflectionTheme, List<Reflection>>{};
    for (final r in ReflectionContent.all) {
      grouped.putIfAbsent(r.theme, () => []).add(r);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reflections',
          style: AppTypography.h2,
        ),
        backgroundColor: AppColors.bg,
        elevation: 0,
        scrolledUnderElevation: 0,
        foregroundColor: AppColors.ink,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.goNamed(RouteNames.home),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.lg,
          vertical: AppSpacing.sm,
        ),
        itemCount: grouped.length,
        itemBuilder: (context, index) {
          final theme = grouped.keys.elementAt(index);
          final reflections = grouped[theme]!;
          return _ThemeSection(theme: theme, reflections: reflections);
        },
      ),
    );
  }
}

class _ThemeSection extends StatelessWidget {
  final ReflectionTheme theme;
  final List<Reflection> reflections;

  const _ThemeSection({required this.theme, required this.reflections});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: AppSpacing.lg,
            bottom: AppSpacing.xs,
          ),
          child: Text(
            theme.displayName,
            style: AppTypography.caption.copyWith(
              color: AppColors.shine,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ...reflections.map((r) => Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _LibraryCard(reflection: r),
            )),
      ],
    );
  }
}

class _LibraryCard extends StatefulWidget {
  final Reflection reflection;

  const _LibraryCard({required this.reflection});

  @override
  State<_LibraryCard> createState() => _LibraryCardState();
}

class _LibraryCardState extends State<_LibraryCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final reflection = widget.reflection;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: AppRadius.smAll,
          border: _expanded
              ? const Border(
                  left: BorderSide(color: AppColors.shine, width: 3),
                )
              : null,
        ),
        padding: const EdgeInsets.all(AppSpacing.sm),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.auto_stories_rounded,
                  size: 16,
                  color: AppColors.shine,
                ),
                const SizedBox(width: AppSpacing.xs),
                Expanded(
                  child: Text(reflection.title, style: AppTypography.label),
                ),
                Icon(
                  _expanded
                      ? Icons.keyboard_arrow_up_rounded
                      : Icons.keyboard_arrow_down_rounded,
                  size: 20,
                  color: AppColors.inkFaint,
                ),
              ],
            ),
            if (_expanded) ...[
              const SizedBox(height: AppSpacing.xs),
              Text(
                reflection.body,
                style: AppTypography.caption.copyWith(color: AppColors.ink),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                reflection.source,
                style: AppTypography.monoSm.copyWith(
                  color: AppColors.inkFaint,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
