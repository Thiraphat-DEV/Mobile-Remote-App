import 'package:get_it/get_it.dart';
import 'package:hospital_app/features/home/domain/repositories/home_repository.dart';
import 'package:hospital_app/features/home/domain/usecases/get_greeting.dart';
import 'package:hospital_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:hospital_app/features/home/data/datasources/home_remote_datasource.dart';
import 'package:hospital_app/features/home/presentation/bloc/home_bloc.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies() async {
  // ========== Features: Home ==========
  // Data
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt()),
  );
  // Domain
  getIt.registerLazySingleton<GetGreeting>(() => GetGreeting(getIt()));
  // Presentation - BLoC (factory = new instance per screen)
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt()));
}
