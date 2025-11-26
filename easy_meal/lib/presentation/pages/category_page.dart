import 'package:easy_meal/domain/models/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  final Category category;
  const CategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: category.id,
                child: Image.network(category.posterPath, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
        body: Column(
          children: [
            Text(
              category.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
