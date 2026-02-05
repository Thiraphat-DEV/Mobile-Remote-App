import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hospital_app/features/home/domain/usecases/get_greeting.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getGreeting) : super(const HomeState.initial()) {
    on<HomeLoadRequested>(_onLoadRequested);
  }

  final GetGreeting _getGreeting;

  Future<void> _onLoadRequested(
    HomeLoadRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      final greeting = await _getGreeting();
      emit(HomeState.loaded(greeting: greeting));
    } catch (e, st) {
      emit(HomeState.failure(message: e.toString()));
    }
  }
}
