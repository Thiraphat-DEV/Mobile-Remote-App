part of 'home_bloc.dart';

enum HomeStatus { initial, loading, loaded, failure }

final class HomeState extends Equatable {
  const HomeState({
    required this.status,
    this.greeting,
    this.message,
  });

  const HomeState.initial()
      : this(status: HomeStatus.initial);

  const HomeState.loading()
      : this(status: HomeStatus.loading);

  const HomeState.loaded({required String greeting})
      : this(status: HomeStatus.loaded, greeting: greeting);

  const HomeState.failure({required String message})
      : this(status: HomeStatus.failure, message: message);

  final HomeStatus status;
  final String? greeting;
  final String? message;

  @override
  List<Object?> get props => [status, greeting, message];
}
