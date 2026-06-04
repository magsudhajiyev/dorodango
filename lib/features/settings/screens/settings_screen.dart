import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/providers/locale_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final currentLocale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.go('/home'),
        ),
        title: Text(l10n.settings, style: AppTypography.h2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Text(l10n.language, style: AppTypography.label),
          const SizedBox(height: AppSpacing.sm),

          // System default option
          _LanguageTile(
            name: l10n.systemDefault,
            isSelected: currentLocale == null,
            onTap: () => ref.read(localeProvider.notifier).clearLocale(),
          ),
          const SizedBox(height: AppSpacing.xs),

          // Language options
          ...supportedLocales.map((locale) {
            final code = locale.languageCode;
            final name = localeNativeNames[code] ?? code;
            return Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: _LanguageTile(
                name: name,
                isSelected: currentLocale?.languageCode == code,
                onTap: () =>
                    ref.read(localeProvider.notifier).setLocale(locale),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageTile({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.clay.withValues(alpha: 0.08) : Colors.white,
          borderRadius: AppRadius.smAll,
          border: Border.all(
            color: isSelected ? AppColors.clay : AppColors.surfaceSunk,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                name,
                style: AppTypography.body.copyWith(
                  color: isSelected ? AppColors.clay : AppColors.ink,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_rounded, color: AppColors.clay, size: 20),
          ],
        ),
      ),
    );
  }
}
