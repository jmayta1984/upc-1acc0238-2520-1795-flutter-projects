import 'dart:async';

import 'package:easy_meal/core/enums/status.dart';
import 'package:easy_meal/domain/repositories/meal_repository.dart';
import 'package:easy_meal/presentation/blocs/meals_event.dart';
import 'package:easy_meal/presentation/blocs/meals_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsBloc extends Bloc<MealsEvent, MealsState> {
  final MealRepository repository;

  MealsBloc({required this.repository}) : super(const MealsState()) {
    on<GetMealsByCategory>(_getMealsByCategory);
    on<ToggleFavoriteMeal>(_toggleFavoriteMeal);
  }

  FutureOr<void> _getMealsByCategory(
    GetMealsByCategory event,
    Emitter<MealsState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final meals = await repository.getMealsByCategory(event.category);
      emit(state.copyWith(status: Status.success, meals: meals));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: "$e"));
    }
  }

  FutureOr<void> _toggleFavoriteMeal(
    ToggleFavoriteMeal event,
    Emitter<MealsState> emit,
  ) async {
    await repository.toggleFavorite(event.meal);
    final meals = state.meals.map((meal) {
      if (meal.id == event.meal.id) {
        return meal.copyWith(isFavorite: !meal.isFavorite);
      }
      return meal;
    }).toList();
    emit(state.copyWith(status: Status.success, meals: meals));
  }
}
