import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/shared/domain/models/destination.dart';
import 'package:easy_travel/shared/domain/repositories/destination_repository.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_event.dart';
import 'package:easy_travel/features/home/presentation/blocs/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DestinationRepository repository;
  HomeBloc({required this.repository}) : super(HomeState()) {
    on<GetDestinationsByCategory>(_getDestinationsByCategory);

    on<ToggleFavorite>(_toggleFavorite);
  }

  FutureOr<void> _toggleFavorite(
    ToggleFavorite event,
    Emitter<HomeState> emit,
  ) async {
    await repository.toggleFavorite(event.destination);
    emit(state.copyWith(destinations: state.destinations.map((destination) {
     return destination.id == event.destination.id
          ? destination.copyWith(isFavorite: !destination.isFavorite)
          : destination;
    }).toList()));
  }

  FutureOr<void> _getDestinationsByCategory(
    GetDestinationsByCategory event,
    Emitter<HomeState> emit,
  ) async {
    if (state.selectedCategory == event.category &&
        state.destinations.isNotEmpty) {
      return;
    }

    emit(
      state.copyWith(status: Status.loading, selectedCategory: event.category),
    );
    try {
      List<Destination> destinations = await repository.getDestinations(
        event.category,
      );
      emit(state.copyWith(status: Status.success, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
