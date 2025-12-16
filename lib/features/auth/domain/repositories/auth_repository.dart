
import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<String, UserEntity>> signIn({
    required String email,
    required String password,
  });

  Future<Either<String, void>> sendEmailVerification();

  Future<Either<String, void>> signOut();

  Future<Either<String, UserEntity?>> getCurrentUser();

  Stream<UserEntity?> get authStateChanges;
}