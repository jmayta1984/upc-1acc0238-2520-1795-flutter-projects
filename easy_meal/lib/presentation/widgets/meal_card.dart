import 'package:easy_meal/domain/models/meal.dart';
import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  final Meal meal;
  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        spacing: 8,
        children: [
          ClipOval(
            child: Image.network(
              meal.posterPath,
              height: 40,
              width: 40,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Text(
              meal.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
    );
  }
}
