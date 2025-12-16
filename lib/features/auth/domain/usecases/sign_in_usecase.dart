import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<String, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.signIn(email: email, password: password);
  }
}
