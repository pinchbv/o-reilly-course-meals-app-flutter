import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildListTile(String title, IconData iconData, Function tapHandler) {
      return ListTile(
        leading: Icon(iconData), // Create an Icon widget from the IconData
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () => tapHandler(),
      );
    }

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            color: theme.canvasColor,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              'Cooking up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: theme.primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile('Filters', Icons.settings, (){
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
