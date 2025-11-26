import 'package:easy_meal/domain/models/category.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Hero(
          tag: category.id,
          child: Image.network(
            category.posterPath,
            height: 150,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Text(category.name, style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }
}
