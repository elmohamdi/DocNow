import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.isEmailVerified,
    required super.createdAt,
  });


  factory UserModel.fromFirebase({
    required String uid,
    required String name,
    required String email,
    required bool isEmailVerified,
    required DateTime createdAt,
  }) {
    return UserModel(
      uid: uid,
      name: name,
      email: email,
      isEmailVerified: isEmailVerified,
      createdAt: createdAt,
    );
  }


  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      isEmailVerified: data['isEmailVerified'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }


  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }


  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,
      isEmailVerified: isEmailVerified,
      createdAt: createdAt,
    );
  }
}