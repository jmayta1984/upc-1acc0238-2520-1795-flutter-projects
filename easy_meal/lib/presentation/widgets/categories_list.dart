import 'package:easy_meal/domain/models/category.dart';
import 'package:easy_meal/presentation/pages/category_page.dart';
import 'package:easy_meal/presentation/widgets/category_card.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  final List<Category> categories;
  const CategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return GestureDetector(
          onTap: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryPage(category: category),
              ),
            ),
          child: CategoryCard(category: category));
      },
    );
  }
}
