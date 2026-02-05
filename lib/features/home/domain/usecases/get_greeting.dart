import 'package:hospital_app/features/home/domain/repositories/home_repository.dart';

class GetGreeting {
  const GetGreeting(this._repository);
  final HomeRepository _repository;

  Future<String> call() => _repository.getGreeting();
}
