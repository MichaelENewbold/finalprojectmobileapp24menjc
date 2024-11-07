import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:csc322_starter_app/widgets/general/widget_recipe_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';


class ChefScreen extends StatelessWidget {
  static const String routeName = '/chef';

  final List<RecipeItem> recipes = [
    RecipeItem(
      name: 'Spaghetti Bolognese',
      flavorText: 'Rich, savory, tomato-based sauce.',
      date: DateTime(2024, 11, 6),
    ),
    RecipeItem(
      name: 'Chicken Curry',
      flavorText: 'Spicy, aromatic, and rich.',
      date: DateTime(2024, 11, 7),
    ),
    RecipeItem(
      name: 'Caesar Salad',
      flavorText: 'Crisp, creamy, tangy, and fresh.',
      date: DateTime(2024, 11, 8),
    ),
    RecipeItem(
      name: 'Grilled Salmon',
      flavorText: 'Tender, smoky, with citrus zest.',
      date: DateTime(2024, 11, 9),
    ),
    RecipeItem(
      name: 'Vegetable Stir-Fry',
      flavorText: 'Fresh, crunchy, with savory sauce.',
      date: DateTime(2024, 11, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chef Recipes')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: recipes.length,
                itemBuilder: (context, index) {
                  final recipe = recipes[index];
                  final formattedDate = DateFormat('MMM dd, yyyy').format(recipe.date);

                  return ListTile(
                    title: Text(recipe.name),
                    subtitle: Text('${recipe.flavorText}\n$formattedDate'),
                    isThreeLine: true,
                    onTap: () {},
                  );
                },
              ),
            ),
            const NavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
