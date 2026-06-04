import 'package:flutter/material.dart';
import 'package:dorodango/l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/stage_content.dart';
import '../../../core/providers/locale_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/build_stage.dart';
import '../../../routing/route_names.dart';
import '../../auth/providers/auth_provider.dart';
import '../../voice/providers/voice_provider.dart';
import '../providers/build_session_provider.dart';
import '../providers/credits_provider.dart';
import '../providers/stage_timer_provider.dart';
import '../widgets/credit_badge.dart';
import '../widgets/drying_timer.dart';
import '../widgets/photo_capture_prompt.dart';
import '../widgets/stage_card.dart';
import '../widgets/stage_progress_bar.dart';
import '../widgets/transcript_bubbles.dart';
import '../widgets/voice_orb.dart';
import '../../reflections/widgets/reflection_card.dart';
import '../providers/diagnosis_provider.dart';
import '../widgets/diagnosis_card.dart';

class StageScreen extends ConsumerStatefulWidget {
  final String buildId;

  const StageScreen({super.key, required this.buildId});

  @override
  ConsumerState<StageScreen> createState() => _StageScreenState();
}

class _StageScreenState extends ConsumerState<StageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final session = ref.read(buildSessionProvider);
      final timerNotifier = ref.read(stageTimerProvider.notifier);
      final timer = ref.read(stageTimerProvider);
      if (!timer.isRunning) {
        // If resuming, start from elapsed time since stage was entered
        if (session.stageEnteredAt != null) {
          final elapsed =
              DateTime.now().difference(session.stageEnteredAt!).inSeconds;
          timerNotifier.startFrom(elapsed > 0 ? elapsed : 0);
        } else {
          timerNotifier.start();
        }
      }
      // Update voice controller locale
      final l10n = AppLocalizations.of(context);
      final locale = ref.read(localeProvider);
      final langCode = locale?.languageCode ?? 'en';
      final voice = ref.read(voiceControllerProvider);
      voice.updateLocale(langCode, l10n);

      // Wire up conversation updates
      voice.onConversationChanged = (messages) {
        if (mounted) {
          ref.read(conversationProvider.notifier).state = messages;
        }
      };

      // Fetch credits
      ref.read(creditsProvider.notifier).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    final session = ref.watch(buildSessionProvider);
    final stage = session.currentStage;
    final l10n = AppLocalizations.of(context);
    final stageContent = StageContent(l10n);
    final instruction = stageContent.getInstruction(stage);
    final conversation = ref.watch(conversationProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            children: [
              // Progress bar
              Padding(
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                child: StageProgressBar(currentStage: stage),
              ),

              // Timer
              DryingTimer(suggestedDuration: instruction.suggestedDuration),

              const SizedBox(height: AppSpacing.sm),

              // Stage card + reflection (scrollable, takes remaining space above transcript)
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      StageCard(stage: stage, stageContent: stageContent),
                      const SizedBox(height: AppSpacing.sm),
                      DiagnosisCard(
                        buildId: widget.buildId,
                        stageKey: stage.firestoreValue,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      ReflectionCard(stage: stage),
                    ],
                  ),
                ),
              ),

              // Transcript bubbles
              TranscriptBubbles(
                messages: conversation,
                voiceState: session.voiceState,
              ),

              const SizedBox(height: AppSpacing.xs),

              // Next stage button
              if (!stage.isTerminal)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                  child: SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: session.isLoading ? null : _advanceStage,
                      child: session.isLoading
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              stage == BuildStage.polishing
                                  ? l10n.completeBuild
                                  : l10n.nextStage,
                            ),
                    ),
                  ),
                ),

              // Credit badge + Voice orb row
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CreditBadge(),
                    const SizedBox(width: AppSpacing.md),
                    const VoiceOrb(),
                    const SizedBox(width: AppSpacing.sm),
                    Text(
                      l10n.tapToSpeak,
                      style: AppTypography.caption.copyWith(
                        color: AppColors.inkSoft,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _advanceStage() async {
    // Reset previous diagnosis
    ref.read(diagnosisProvider.notifier).reset();

    // Prompt for photo
    final photo = await PhotoCapturePrompt.show(context);

    final session = ref.read(buildSessionProvider);
    final previousStage = session.currentStage;
    final notifier = ref.read(buildSessionProvider.notifier);

    await notifier.advanceToNextStage(photo: photo);

    // Trigger diagnosis if photo was taken
    if (photo != null) {
      final uid =
          ref.read(ensureAuthProvider).valueOrNull?.uid ?? '';
      final stages = await ref
          .read(buildRepositoryProvider)
          .getStages(uid, widget.buildId);
      final completedStage = stages
          .where((s) => s.stage == previousStage)
          .lastOrNull;
      if (completedStage?.photoUrl != null) {
        ref.read(diagnosisProvider.notifier).diagnose(
              buildId: widget.buildId,
              stageKey: previousStage.firestoreValue,
              photoUrl: completedStage!.photoUrl!,
            );
      }
    }

    // Reset timer for next stage
    ref.read(stageTimerProvider.notifier).reset();
    ref.read(stageTimerProvider.notifier).start();

    // Check if build is complete
    final newState = ref.read(buildSessionProvider);
    if (newState.currentStage.isTerminal && mounted) {
      ref.read(stageTimerProvider.notifier).stop();
      context.goNamed(
        RouteNames.buildComplete,
        pathParameters: {'buildId': widget.buildId},
      );
    }
  }
}
