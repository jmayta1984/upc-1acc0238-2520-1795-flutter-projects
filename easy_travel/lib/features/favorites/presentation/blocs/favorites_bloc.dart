import 'package:easy_travel/features/favorites/presentation/blocs/favorites_event.dart';
import 'package:easy_travel/features/favorites/presentation/blocs/favorites_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class  FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc():super(FavoritesState()) {

    on<GetAllFavorites>((event, emit) {
      
    },);

    on<RemoveFavorite>((event, emit) {
      
    },);
  }
  
}