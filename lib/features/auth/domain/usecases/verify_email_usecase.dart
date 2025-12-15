import 'package:dartz/dartz.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';

class SendEmailVerificationUseCase {
  final AuthRepository repository;

  SendEmailVerificationUseCase(this.repository);

  Future<Either<String, void>> call() async {
    return await repository.sendEmailVerification();
  }
}
