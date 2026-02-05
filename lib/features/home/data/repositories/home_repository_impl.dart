import 'package:hospital_app/features/home/domain/repositories/home_repository.dart';
import 'package:hospital_app/features/home/data/datasources/home_remote_datasource.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl(this._remote);
  final HomeRemoteDataSource _remote;

  @override
  Future<String> getGreeting() => _remote.getGreeting();
}
