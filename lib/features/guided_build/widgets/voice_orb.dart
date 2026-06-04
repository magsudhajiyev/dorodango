import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../data/models/voice_state.dart';
import '../../voice/providers/voice_provider.dart';
import '../providers/build_session_provider.dart';

class VoiceOrb extends ConsumerStatefulWidget {
  const VoiceOrb({super.key});

  @override
  ConsumerState<VoiceOrb> createState() => _VoiceOrbState();
}

class _VoiceOrbState extends ConsumerState<VoiceOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: AppDurations.easeCurve,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updateAnimation(VoiceState voiceState) {
    switch (voiceState) {
      case VoiceState.idle:
        _controller.stop();
        _controller.value = 0;
      case VoiceState.listening:
        _controller.repeat(reverse: true);
      case VoiceState.processing:
        // Slow pulse for processing
        if (!_controller.isAnimating) {
          _controller.duration = const Duration(milliseconds: 3000);
          _controller.repeat(reverse: true);
        }
      case VoiceState.speaking:
        _controller.duration = const Duration(milliseconds: 2200);
        _controller.repeat(reverse: true);
    }
  }

  Color _orbColor(VoiceState voiceState) {
    switch (voiceState) {
      case VoiceState.idle:
        return AppColors.inkFaint;
      case VoiceState.listening:
        return AppColors.clay;
      case VoiceState.processing:
        return AppColors.ochre;
      case VoiceState.speaking:
        return AppColors.shine;
    }
  }

  IconData _orbIcon(VoiceState voiceState) {
    switch (voiceState) {
      case VoiceState.idle:
      case VoiceState.listening:
        return Icons.mic_rounded;
      case VoiceState.processing:
        return Icons.auto_awesome_rounded;
      case VoiceState.speaking:
        return Icons.volume_up_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final voiceState = ref.watch(
      buildSessionProvider.select((s) => s.voiceState),
    );

    _updateAnimation(voiceState);

    return GestureDetector(
      onTap: () async {
        final voice = ref.read(voiceControllerProvider);
        if (voiceState == VoiceState.listening) {
          await voice.stopListening();
        } else if (voiceState == VoiceState.idle) {
          await voice.startListening();
        }
        // Ignore taps during processing/speaking
      },
      child: AnimatedBuilder(
        animation: _pulseAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: voiceState == VoiceState.idle ? 1.0 : _pulseAnimation.value,
            child: child,
          );
        },
        child: AnimatedContainer(
          duration: AppDurations.medium,
          curve: AppDurations.easeCurve,
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _orbColor(voiceState).withValues(alpha: 0.15),
            border: Border.all(
              color: _orbColor(voiceState),
              width: 3,
            ),
          ),
          child: Icon(
            _orbIcon(voiceState),
            color: _orbColor(voiceState),
            size: 24,
          ),
        ),
      ),
    );
  }
}
