import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:csc322_starter_app/screens/general/screen_home.dart';
import 'package:csc322_starter_app/screens/general/screen_list.dart';
import 'package:csc322_starter_app/screens/general/screen_meal_planner.dart';
import 'package:csc322_starter_app/screens/general/screen_chef.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              context.go(ScreenHome.routeName);
            },
            child: const Text('Home'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(ScreenList.routeName);
            },
            child: const Text('List'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(MealPlannerScreen.routeName);
            },
            child: const Text('Planner'),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(ChefScreen.routeName);
            },
            child: const Text('Chef'),
          ),
        ],
      ),
    );
  }
}
