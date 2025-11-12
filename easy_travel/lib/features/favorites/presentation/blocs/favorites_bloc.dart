import 'dart:async';
import 'package:easy_travel/core/enums/status.dart';
import 'package:easy_travel/core/typedefs/typedefs.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:easy_travel/shared/domain/repositories/destination_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final DestinationRepository repository;

  FavoritesBloc({required this.repository}) : super(FavoritesState()) {

    on<GetAllFavorites>(_getAllFavorites);

    on<RemoveFavorite>(_removeFavorite);
  }

  FutureOr<void> _getAllFavorites(
    GetAllFavorites event,
    Emitter<FavoritesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final Destinations destinations = await repository
          .getFavoriteDestinations();
      emit(state.copyWith(status: Status.success, destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }

  FutureOr<void> _removeFavorite(
    RemoveFavorite event,
    Emitter<FavoritesState> emit,
  ) async {
    try {
      await repository.toggleFavorite(event.destination);
      final Destinations destinations = await repository
          .getFavoriteDestinations();
      emit(state.copyWith(destinations: destinations));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: e.toString()));
    }
  }
}
