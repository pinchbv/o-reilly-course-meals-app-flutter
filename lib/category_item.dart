import 'package:flutter/material.dart';
import 'package:meals_app/category_meals_screen.dart';

class CategoryArguments {
  final String id;
  final String title;

  CategoryArguments({
    required this.id,
    required this.title
  });
}

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem({
    Key? key,
    required this.title,
    required this.color,
    required this.id,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: CategoryArguments(id: id, title: title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: theme.primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: theme.textTheme.titleLarge,
        ),
      ),
    );
  }
}
