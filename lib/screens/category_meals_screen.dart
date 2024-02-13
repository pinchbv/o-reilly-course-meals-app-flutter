import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widgets/meal_item.dart';

import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals, {super.key});

  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List<Meal>? displayMeals;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }


  void _removeMeal(String mealId) {
    setState(() {
      displayMeals?.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: theme.primaryColor,
          title: Text(categoryTitle!),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              title: displayMeals![index].title,
              imageUrl: displayMeals![index].imageUrl,
              duration: displayMeals![index].duration,
              complexity: displayMeals![index].complexity,
              affordability: displayMeals![index].affordability,
              id: displayMeals![index].id,
              removeItem: _removeMeal,
            );
          },
          itemCount: displayMeals?.length,
        ));
  }
}
