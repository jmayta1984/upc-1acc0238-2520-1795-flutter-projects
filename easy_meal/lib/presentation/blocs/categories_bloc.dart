import 'dart:async';

import 'package:easy_meal/core/enums/status.dart';
import 'package:easy_meal/domain/models/category.dart';
import 'package:easy_meal/domain/repositories/category_repository.dart';
import 'package:easy_meal/presentation/blocs/categories_event.dart';
import 'package:easy_meal/presentation/blocs/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoryRepository repository;
  CategoriesBloc({required this.repository}) : super(const CategoriesState()) {
    on<GetAllCategories>(_onGetAllCategories);
  }

  FutureOr<void> _onGetAllCategories(
    GetAllCategories event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      List<Category> categories = await repository.getAllCategories();
      emit(state.copyWith(status: Status.success, categories: categories));
    } catch (e) {
      emit(state.copyWith(status: Status.failure, message: "$e"));
    }
  }
}
