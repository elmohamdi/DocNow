
import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String name,
    required String email,
    required String password,
  }) async {
    return await repository.signUp(
      name: name,
      email: email,
      password: password,
    );
  }
}