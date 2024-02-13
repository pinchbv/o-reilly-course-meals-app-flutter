import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  static const routeName = "filter";

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("Filters"),
      ),
        drawer: MainDrawer(),
      body: Center(
        child: Text("ddd"),
      ),
    );
  }
}
