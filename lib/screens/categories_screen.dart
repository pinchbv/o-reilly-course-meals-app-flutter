import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  // Constants for grid configuration
  static const double _maxCrossAxisExtent = 200;
  static const double _childAspectRatio = 3 / 2;
  static const double _crossAxisSpacing = 20;
  static const double _mainAxisSpacing = 20;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('DeliMeal'),
        backgroundColor: theme.primaryColor,
      ),
      body: Container(
        color: theme.canvasColor,
        child: GridView(
          padding: const EdgeInsets.all(15),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: _maxCrossAxisExtent,
            childAspectRatio: _childAspectRatio,
            crossAxisSpacing: _crossAxisSpacing,
            mainAxisSpacing: _mainAxisSpacing,
          ),
          children: DUMMY_CATEGORIES
              .map(
                (catData) => CategoryItem(
                  title: catData.title,
                  color: catData.color,
                  id: catData.id,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
