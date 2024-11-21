import 'package:flutter/material.dart';
import 'package:csc322_starter_app/services/chatgpt_service.dart';

class NewRecipeScreen extends StatefulWidget {
  final Function(String name, String details) onSave;

  const NewRecipeScreen({required this.onSave});

  @override
  _NewRecipeScreenState createState() => _NewRecipeScreenState();
}

class _NewRecipeScreenState extends State<NewRecipeScreen> {
  final List<String> ingredients = [];
  final TextEditingController ingredientController = TextEditingController();
  final ChatGPTService chatGPTService = ChatGPTService();
  bool isGenerating = false;

  void addIngredient() {
    final ingredient = ingredientController.text.trim();
    if (ingredient.isNotEmpty) {
      setState(() {
        ingredients.add(ingredient);
        ingredientController.clear();
      });
    }
  }

  Future<void> generateRecipe() async {
    if (ingredients.isEmpty) return;

    setState(() {
      isGenerating = true;
    });

    final recipeDetails = await chatGPTService.generateRecipe(
      'Create a simple recipe using only the following ingredients: ${ingredients.join(', ')}',
    );

    final keyIngredients = ingredients.take(3).join(', ');

    widget.onSave(
      'Recipe with $keyIngredients',
      recipeDetails,
    );

    setState(() {
      isGenerating = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isGenerating
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20),
                    const Text(
                      'Cooking up your recipe...\nThis may take a moment.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Ingredients',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: ingredientController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter an ingredient',
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: addIngredient,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    ingredients.isEmpty
                        ? const Text(
                            'No ingredients added yet.',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            itemCount: ingredients.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(ingredients[index]),
                              );
                            },
                          ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: generateRecipe,
                        child: const Text('Generate Recipe'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}