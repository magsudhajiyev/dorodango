import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../data/models/chat_message.dart';
import '../../../data/models/voice_state.dart';

class TranscriptBubbles extends StatelessWidget {
  final List<ChatMessage> messages;
  final VoiceState voiceState;

  const TranscriptBubbles({
    super.key,
    required this.messages,
    required this.voiceState,
  });

  @override
  Widget build(BuildContext context) {
    // Show last 4 messages
    final visible =
        messages.length > 4 ? messages.sublist(messages.length - 4) : messages;

    final showTypingIndicator = voiceState == VoiceState.processing;

    if (visible.isEmpty && !showTypingIndicator) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: 160,
      child: ListView(
        reverse: true,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        children: [
          if (showTypingIndicator) const _TypingIndicator(),
          ...visible.reversed.map((msg) => _Bubble(message: msg)),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  final ChatMessage message;

  const _Bubble({required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: AppSpacing.xxs,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? AppColors.clay.withValues(alpha: 0.12)
              : AppColors.surface,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppRadius.sm),
            topRight: const Radius.circular(AppRadius.sm),
            bottomLeft:
                isUser ? const Radius.circular(AppRadius.sm) : Radius.zero,
            bottomRight:
                isUser ? Radius.zero : const Radius.circular(AppRadius.sm),
          ),
        ),
        child: Text(
          message.content,
          style: AppTypography.body.copyWith(
            color: AppColors.ink,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatefulWidget {
  const _TypingIndicator();

  @override
  State<_TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<_TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.xxs),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs + 2,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppRadius.sm),
            topRight: Radius.circular(AppRadius.sm),
            bottomRight: Radius.circular(AppRadius.sm),
          ),
        ),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(3, (i) {
                final delay = i * 0.2;
                final t = (_controller.value - delay).clamp(0.0, 1.0);
                final opacity = 0.3 + 0.7 * (0.5 + 0.5 * _wave(t));
                return Container(
                  width: 7,
                  height: 7,
                  margin: EdgeInsets.only(right: i < 2 ? 4 : 0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.inkFaint.withValues(alpha: opacity),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }

  double _wave(double t) {
    // Simple sine wave 0..1..0
    return (t * 3.14159 * 2).clamp(0, 6.28) == 0
        ? 0
        : (1 - (2 * t - 1).abs());
  }
}
