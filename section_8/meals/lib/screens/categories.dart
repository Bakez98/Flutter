import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    // Navigator.push(context, route)
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(meals: [], title: "Test Test"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Your Category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          //availableCategories.map((category) =>CategoryGridItem(category: category) );
          for (final category in availableCategories)
            CategoryGridItem(
                category: category, onSelectCategory: (){
                  _selectCategory(context);
                }),
        ],
      ),
    );
  }
}