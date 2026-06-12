import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final int credits;
  final DateTime createdAt;
  final String? email;

  const UserModel({
    required this.uid,
    required this.credits,
    required this.createdAt,
    this.email,
  });

  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      credits: data['credits'] as int? ?? 0,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      email: data['email'] as String?,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'credits': credits,
        'createdAt': Timestamp.fromDate(createdAt),
        if (email != null) 'email': email,
      };
}
