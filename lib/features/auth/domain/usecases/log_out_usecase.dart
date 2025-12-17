import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository repository;

  SignOutUseCase(this.repository);

  Future<Either<String, void>> call() async {
    return await repository.signOut();
  }
}
