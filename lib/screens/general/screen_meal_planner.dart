import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';

class MealPlannerScreen extends StatelessWidget {
  static const String routeName = '/meal_planner';

  final Map<DateTime, List<FoodItem>> mealPlan = {
    DateTime(2024, 11, 6): [
      FoodItem(name: 'Pizza', description: 'Cheese and tomato pizza'),
      FoodItem(name: 'Salad', description: 'Mixed greens with vinaigrette dressing'),
    ],
    DateTime(2024, 11, 7): [
      FoodItem(name: 'Burger', description: 'Beef burger with lettuce and cheese'),
    ],
    DateTime(2024, 11, 8): [
      FoodItem(name: 'Sushi', description: 'Fresh sushi with tuna and salmon'),
      FoodItem(name: 'Pasta', description: 'Spaghetti with marinara sauce'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Planner')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: mealPlan.length,
                itemBuilder: (context, index) {
                  final date = mealPlan.keys.elementAt(index);
                  final foodItems = mealPlan[date];

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text('Meal Plan for ${DateFormat('MMM dd, yyyy').format(date)}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: foodItems!.map((food) => Text(food.name)).toList(),
                      ),
                    ),
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
