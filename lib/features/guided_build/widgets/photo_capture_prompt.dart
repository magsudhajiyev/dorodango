import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class PhotoCapturePrompt extends StatelessWidget {
  const PhotoCapturePrompt({super.key});

  static Future<File?> show(BuildContext context) async {
    return showModalBottomSheet<File?>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.lg)),
      ),
      builder: (_) => const PhotoCapturePrompt(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.surfaceSunk,
                borderRadius: AppRadius.pillAll,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              l10n.captureProgress,
              style: AppTypography.h2,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              l10n.captureSubtitle,
              style: AppTypography.body.copyWith(color: AppColors.inkSoft),
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: () => _pickImage(context, ImageSource.camera),
                icon: const Icon(Icons.camera_alt_rounded),
                label: Text(l10n.takePhoto),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () => _pickImage(context, ImageSource.gallery),
                icon: const Icon(Icons.photo_library_rounded),
                label: Text(l10n.chooseFromGallery),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.clay,
                  side: const BorderSide(color: AppColors.clay),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () => Navigator.pop(context, null),
              child: Text(
                l10n.skip,
                style: AppTypography.label.copyWith(color: AppColors.inkSoft),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final image = await picker.pickImage(
      source: source,
      maxWidth: 1200,
      maxHeight: 1200,
      imageQuality: 85,
    );
    if (image != null && context.mounted) {
      Navigator.pop(context, File(image.path));
    }
  }
}
