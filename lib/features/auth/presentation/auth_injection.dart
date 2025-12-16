import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:i_clinic/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:i_clinic/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:i_clinic/features/auth/domain/repositories/auth_repository.dart';
import 'package:i_clinic/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:i_clinic/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:i_clinic/features/auth/domain/usecases/verify_email_usecase.dart';
import 'package:i_clinic/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> initAuthDependencies() async {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(firebaseAuth: sl(), firestore: sl()),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SendEmailVerificationUseCase(sl()));

  sl.registerFactory(
    () => AuthBloc(
      signUpUseCase: sl(),
      signInUseCase: sl(),
      // sendEmailVerificationUseCase: sl(),
    ),
  );
}
