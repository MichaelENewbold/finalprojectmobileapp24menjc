import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';

class ScreenList extends StatelessWidget {
  static const String routeName = '/lists';

  final List<FoodItem> foodItems = [
    FoodItem(name: 'Pizza', description: 'Cheese and tomato pizza'),
    FoodItem(name: 'Burger', description: 'Beef burger with lettuce and cheese'),
    FoodItem(name: 'Sushi', description: 'Fresh sushi with tuna and salmon'),
    FoodItem(name: 'Pasta', description: 'Spaghetti with marinara sauce'),
    FoodItem(name: 'Salad', description: 'Mixed greens with vinaigrette dressing'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food List')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(foodItems[index].name),
                    subtitle: Text(foodItems[index].description),
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