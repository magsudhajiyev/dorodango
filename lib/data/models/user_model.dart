import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final int credits;
  final DateTime createdAt;

  const UserModel({
    required this.uid,
    required this.credits,
    required this.createdAt,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      credits: data['credits'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() => {
        'credits': credits,
        'createdAt': Timestamp.fromDate(createdAt),
      };
}
