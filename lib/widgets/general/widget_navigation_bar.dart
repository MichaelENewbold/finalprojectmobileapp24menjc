import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:csc322_starter_app/screens/general/screen_list.dart';
import 'package:csc322_starter_app/screens/general/screen_meal_planner.dart';
import 'package:csc322_starter_app/screens/general/screen_chef.dart';
import 'package:drop_shadow/drop_shadow.dart';

class NavigationBarWidget extends StatelessWidget {
  const NavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 146, 70),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                context.go(ScreenList.routeName);
              },
              icon: const Icon(Icons.list, size: 30, color: Colors.white),
              label: const Text(
                'List',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                context.go(MealPlannerScreen.routeName);
              },
              icon: const Icon(Icons.calendar_today, size: 30, color: Colors.black),
              label: const Text(
                'Planner',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 206, 43, 55),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                context.go(ChefScreen.routeName);
              },
              icon: const Icon(Icons.lightbulb, size: 30, color: Colors.white),
              label: const Text(
                'Chef',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      );
  }
}
