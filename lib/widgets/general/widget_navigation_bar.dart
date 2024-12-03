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
      child: DropShadow(
        blurRadius: 5,
        offset: const Offset(0, 3),
        color: Colors.black.withOpacity(0.2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 146, 70),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
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
                backgroundColor: const Color.fromARGB(255, 254, 254, 254),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                context.go(MealPlannerScreen.routeName);
              },
              icon: const Icon(Icons.restaurant, size: 30, color: Color.fromARGB(255, 0, 0, 0)),
              label: const Text(
                'Meal Planner',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 16),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 200, 23, 29),
                minimumSize: const Size(100, 80),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {
                context.go(ChefScreen.routeName);
              },
              icon: const Icon(Icons.kitchen, size: 30, color: Colors.white),
              label: const Text(
                'Chef',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
