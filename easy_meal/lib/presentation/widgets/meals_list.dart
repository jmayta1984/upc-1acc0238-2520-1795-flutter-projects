import 'package:easy_meal/core/enums/status.dart';
import 'package:easy_meal/presentation/blocs/meals_bloc.dart';
import 'package:easy_meal/presentation/blocs/meals_state.dart';
import 'package:easy_meal/presentation/widgets/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealsList extends StatelessWidget {
  const MealsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealsBloc, MealsState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            return const Center(child: CircularProgressIndicator());
          case Status.success:
            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: state.meals.length,
              itemBuilder: (context, index) {
                final meal = state.meals[index];
                return MealCard(meal: meal);
              },
            );
          case Status.failure:
            return Center(child: Text(state.message ?? 'Unknown error'));

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
