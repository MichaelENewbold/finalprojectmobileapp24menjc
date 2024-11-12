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
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color:Colors.tealAccent,
              ),
              child: Text('Lists'),
            ),

            // These two list Tiles will need functions to navigate to the proper data set once we have implemented that side of the program
            ListTile( 
              title: const Text('Recipes'), onTap: () {}), 
            ListTile( 
              title: const Text('List1'), onTap: () {})
          ]
         )
       ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              // Will need to update this code to display the proper data set once we have implemented that side of the program
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