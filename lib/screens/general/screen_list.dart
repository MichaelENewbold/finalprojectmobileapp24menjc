import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';

class FoodItem {
  final String name;
  final String description;
  bool isChecked; // New property to track checked state

  FoodItem({required this.name, required this.description, this.isChecked = false});
}

class ScreenList extends StatefulWidget {
  static const String routeName = '/lists';

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
  final List<FoodItem> foodItems = [
    FoodItem(name: 'Pizza', description: 'Cheese and tomato pizza'),
    FoodItem(name: 'Burger', description: 'Beef burger with lettuce and cheese'),
    FoodItem(name: 'Sushi', description: 'Fresh sushi with tuna and salmon'),
    FoodItem(name: 'Pasta', description: 'Spaghetti with marinara sauce'),
    FoodItem(name: 'Salad', description: 'Mixed greens with vinaigrette dressing'),
  ];

  void _toggleCheck(int index) {
    setState(() {
      foodItems[index].isChecked = !foodItems[index].isChecked;
    });
  }

  void _deleteItem(int index) {
    setState(() {
      foodItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food List')),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: Text('Lists'),
            ),
            ListTile(
              title: const Text('Recipes'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('List1'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: foodItems[index].isChecked,
                      onChanged: (value) {
                        _toggleCheck(index);
                      },
                    ),
                    title: Text(foodItems[index].name),
                    subtitle: Text(foodItems[index].description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteItem(index);
                      },
                    ),
                    onTap: () {
                      _toggleCheck(index);
                    },
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
