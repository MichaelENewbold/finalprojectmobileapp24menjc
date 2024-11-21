import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:csc322_starter_app/services/chatgpt_service.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';
import 'package:csc322_starter_app/screens/general/screen_new_recipe.dart';

class ChefScreen extends StatefulWidget {
  static const String routeName = '/chef';

  @override
  _ChefScreenState createState() => _ChefScreenState();
}

class _ChefScreenState extends State<ChefScreen> {
  final List<Map<String, dynamic>> recipes = [];

  void addRecipe(String name, String details) {
    setState(() {
      recipes.add({
        'name': name,
        'details': details,
        'date': DateTime.now(),
        'expanded': false,
      });
    });
  }

  void toggleRecipeExpansion(int index) {
    setState(() {
      recipes[index]['expanded'] = !(recipes[index]['expanded'] ?? false);
    });
  }

  void removeRecipe(int index) {
    setState(() {
      recipes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chef Garibaldi'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewRecipeScreen(
                    onSave: addRecipe,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: recipes.isEmpty
                  ? const Center(
                      child: Text(
                        'No recipes yet. Tap "+" to create one.',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  recipe['name'],
                                  style: const TextStyle(fontSize: 18),
                                ),
                                subtitle: Text(
                                  DateFormat('MMM dd, yyyy').format(recipe['date']),
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () => removeRecipe(index),
                                ),
                                onTap: () => toggleRecipeExpansion(index),
                              ),
                              if (recipe['expanded'] ?? false)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    recipe['details'],
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 4.0),
        child: NavigationBarWidget(),
      ),
    );
  }
}