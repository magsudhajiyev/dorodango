import 'package:dorodango/l10n/app_localizations.dart';
import '../../data/models/build_stage.dart';

class StageInstruction {
  final String title;
  final String summary;
  final List<String> steps;
  final String tip;
  final String commonMistake;
  final Duration? suggestedDuration;
  final String voiceReadout;

  const StageInstruction({
    required this.title,
    required this.summary,
    required this.steps,
    required this.tip,
    required this.commonMistake,
    this.suggestedDuration,
    required this.voiceReadout,
  });
}

class StageContent {
  final AppLocalizations _l10n;

  const StageContent(this._l10n);

  StageInstruction getInstruction(BuildStage stage) {
    return switch (stage) {
      BuildStage.coreForming => StageInstruction(
          title: _l10n.stageCoreForming,
          summary: _l10n.coreFormingSummary,
          steps: [
            _l10n.coreFormingStep1,
            _l10n.coreFormingStep2,
            _l10n.coreFormingStep3,
            _l10n.coreFormingStep4,
            _l10n.coreFormingStep5,
          ],
          tip: _l10n.coreFormingTip,
          commonMistake: _l10n.coreFormingMistake,
          suggestedDuration: const Duration(minutes: 20),
          voiceReadout: _l10n.coreFormingVoice,
        ),
      BuildStage.drying => StageInstruction(
          title: _l10n.stageDrying,
          summary: _l10n.dryingSummary,
          steps: [
            _l10n.dryingStep1,
            _l10n.dryingStep2,
            _l10n.dryingStep3,
            _l10n.dryingStep4,
            _l10n.dryingStep5,
          ],
          tip: _l10n.dryingTip,
          commonMistake: _l10n.dryingMistake,
          suggestedDuration: const Duration(hours: 3),
          voiceReadout: _l10n.dryingVoice,
        ),
      BuildStage.dustingCapping => StageInstruction(
          title: _l10n.stageDustingCapping,
          summary: _l10n.dustingCappingSummary,
          steps: [
            _l10n.dustingCappingStep1,
            _l10n.dustingCappingStep2,
            _l10n.dustingCappingStep3,
            _l10n.dustingCappingStep4,
            _l10n.dustingCappingStep5,
          ],
          tip: _l10n.dustingCappingTip,
          commonMistake: _l10n.dustingCappingMistake,
          suggestedDuration: const Duration(hours: 2),
          voiceReadout: _l10n.dustingCappingVoice,
        ),
      BuildStage.polishing => StageInstruction(
          title: _l10n.stagePolishing,
          summary: _l10n.polishingSummary,
          steps: [
            _l10n.polishingStep1,
            _l10n.polishingStep2,
            _l10n.polishingStep3,
            _l10n.polishingStep4,
            _l10n.polishingStep5,
          ],
          tip: _l10n.polishingTip,
          commonMistake: _l10n.polishingMistake,
          suggestedDuration: const Duration(minutes: 45),
          voiceReadout: _l10n.polishingVoice,
        ),
      BuildStage.finished => StageInstruction(
          title: _l10n.stageFinished,
          summary: _l10n.finishedSummary,
          steps: [
            _l10n.finishedStep1,
            _l10n.finishedStep2,
            _l10n.finishedStep3,
            _l10n.finishedStep4,
          ],
          tip: _l10n.finishedTip,
          commonMistake: _l10n.finishedMistake,
          voiceReadout: _l10n.finishedVoice,
        ),
    };
  }

  String helpResponse(BuildStage stage) {
    final instruction = getInstruction(stage);
    return _l10n.helpResponse(stage.order, instruction.title, instruction.summary);
  }

  String dryingTimeResponse(BuildStage stage) {
    if (stage == BuildStage.drying) {
      return _l10n.dryingTimeResponse;
    }
    return _l10n.dryingTimeNotOnStage;
  }

  String whatWentWrongResponse(BuildStage stage) {
    return _l10n.whatWentWrongResponse(getInstruction(stage).commonMistake);
  }

  String diagnoseStubResponse() => _l10n.diagnoseStubResponse;

  String stageName(BuildStage stage) {
    return switch (stage) {
      BuildStage.coreForming => _l10n.stageCoreForming,
      BuildStage.drying => _l10n.stageDrying,
      BuildStage.dustingCapping => _l10n.stageDustingCapping,
      BuildStage.polishing => _l10n.stagePolishing,
      BuildStage.finished => _l10n.stageFinished,
    };
  }
}
