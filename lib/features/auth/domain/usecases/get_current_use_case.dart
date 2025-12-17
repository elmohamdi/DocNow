import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/entities/user_entity.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';

class GetCurrentUserUseCase {
  final AuthRepository repository;

  GetCurrentUserUseCase(this.repository);

  Future<Either<String, UserEntity?>> call() async {
    return await repository.getCurrentUser();
  }
}
