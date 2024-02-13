import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = "filter";
  final Function saveFilters;

  const FilterScreen({super.key, required this.saveFilters});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  Widget _buildSwitchListTitle(String title, String description,
      bool currentValue, Function(bool) updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: Text("Filters"),
        actions: [
          IconButton(onPressed: () {
            final selectedFilters = {
              'gluten': _glutenFree,
              'lactose': _lactoseFree,
              'vegan': _vegan,
              'vegetarian': _vegetarian,
            };
            widget.saveFilters(selectedFilters);
          }, icon: const Icon(Icons.save))
        ],
      ),
      drawer: MainDrawer(),
      body: Container(
        color: theme.canvasColor,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection.',
                style: theme.textTheme.titleLarge,
              ),
            ),
            Expanded(
                child: ListView(
                  children: [
                    _buildSwitchListTitle(
                        'Gluten-free',
                        'Only include gluten-free meals', _glutenFree, (
                        newValue) {
                      setState(() {
                        _glutenFree = newValue;
                      });
                    }),
                    _buildSwitchListTitle(
                        'Lactose-free',
                        'Only include lactose-free meals', _lactoseFree, (
                        newValue) {
                      setState(() {
                        _lactoseFree = newValue;
                      });
                    }),
                    _buildSwitchListTitle(
                        'Vegetarian',
                        'Only include vegetarian meals', _vegetarian, (
                        newValue) {
                      setState(() {
                        _vegetarian = newValue;
                      });
                    }),
                    _buildSwitchListTitle(
                        'Vegan',
                        'Only include vegan meals', _vegan, (newValue) {
                      setState(() {
                        _vegan = newValue;
                      });
                    }),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
