import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../voice/services/ai_chat_service.dart';

final aiChatServiceProvider = Provider((ref) => AiChatService());

class CreditsNotifier extends StateNotifier<int> {
  final AiChatService _chatService;

  CreditsNotifier(this._chatService) : super(0);

  Future<void> fetch() async {
    try {
      state = await _chatService.getCredits();
    } catch (_) {
      // Keep current value on failure
    }
  }

  void set(int credits) {
    state = credits;
  }
}

final creditsProvider =
    StateNotifierProvider<CreditsNotifier, int>((ref) {
  final chatService = ref.watch(aiChatServiceProvider);
  return CreditsNotifier(chatService);
});

final hasCreditsProvider = Provider<bool>((ref) {
  return ref.watch(creditsProvider) > 0;
});
