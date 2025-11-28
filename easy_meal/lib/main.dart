import 'package:easy_meal/data/local/meal_dao.dart';
import 'package:easy_meal/data/remote/category_service.dart';
import 'package:easy_meal/data/remote/meal_service.dart';
import 'package:easy_meal/data/repositories/category_repository_impl.dart';
import 'package:easy_meal/data/repositories/meal_repository_impl.dart';
import 'package:easy_meal/domain/repositories/category_repository.dart';
import 'package:easy_meal/domain/repositories/meal_repository.dart';
import 'package:easy_meal/presentation/blocs/categories_bloc.dart';
import 'package:easy_meal/presentation/blocs/categories_event.dart';
import 'package:easy_meal/presentation/blocs/meals_bloc.dart';
import 'package:easy_meal/presentation/pages/categories_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryRepository repository = CategoryRepositoryImpl(
      service: CategoryService(),
    );
    final MealRepository mealRepository = MealRepositoryImpl(
      service: MealService(),
      dao: MealDao(),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CategoriesBloc(repository: repository)..add(GetAllCategories()),
        ),
        BlocProvider(
          create: (context) => MealsBloc(repository: mealRepository),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategoriesPage(),
      ),
    );
  }
}
