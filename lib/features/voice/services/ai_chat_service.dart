import 'package:cloud_functions/cloud_functions.dart';
import '../../../data/models/chat_message.dart';

class AiChatService {
  final FirebaseFunctions _functions;

  AiChatService({FirebaseFunctions? functions})
      : _functions = functions ??
            FirebaseFunctions.instanceFor(region: 'us-east4');

  /// Sends a message to the AI coach and returns the response.
  /// Throws [FirebaseFunctionsException] on failure.
  Future<({String message, int creditsRemaining})> sendMessage({
    required String message,
    required String buildId,
    required List<ChatMessage> conversationHistory,
  }) async {
    final callable = _functions.httpsCallable(
      'sendMessage',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 60)),
    );

    final result = await callable.call<Map<String, dynamic>>({
      'message': message,
      'buildId': buildId,
      'conversationHistory':
          conversationHistory.map((m) => m.toJson()).toList(),
    });

    return (
      message: result.data['message'] as String,
      creditsRemaining: result.data['creditsRemaining'] as int,
    );
  }

  /// Sends a photo for AI diagnosis and returns the result.
  Future<({String diagnosis, int creditsRemaining})> diagnosePhoto({
    required String buildId,
    required String stageKey,
    required String photoUrl,
  }) async {
    final callable = _functions.httpsCallable(
      'diagnosePhoto',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 90)),
    );

    final result = await callable.call<Map<String, dynamic>>({
      'buildId': buildId,
      'stageKey': stageKey,
      'photoUrl': photoUrl,
    });

    return (
      diagnosis: result.data['diagnosis'] as String,
      creditsRemaining: result.data['creditsRemaining'] as int,
    );
  }

  /// Asks the AI coach to predict the dorodango result for the given soil.
  Future<({String prediction, int creditsRemaining})> predictDorodango({
    String? wrbClass,
    double? clayPct,
    double? sandPct,
    double? siltPct,
  }) async {
    final callable = _functions.httpsCallable(
      'predictDorodango',
      options: HttpsCallableOptions(timeout: const Duration(seconds: 60)),
    );

    final result = await callable.call<Map<String, dynamic>>({
      'wrbClass': ?wrbClass,
      'clayPct': ?clayPct,
      'sandPct': ?sandPct,
      'siltPct': ?siltPct,
    });

    return (
      prediction: result.data['prediction'] as String,
      creditsRemaining: result.data['creditsRemaining'] as int,
    );
  }

  /// Fetches current credit balance.
  Future<int> getCredits() async {
    final callable = _functions.httpsCallable('getCredits');
    final result = await callable.call<Map<String, dynamic>>();
    return result.data['credits'] as int;
  }
}
