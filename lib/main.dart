import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/general/screen_chef.dart';
import 'screens/general/screen_home.dart';
import 'screens/general/screen_list.dart';
import 'screens/general/screen_meal_planner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: ScreenHome.routeName,
    routes: [
      GoRoute(
        path: ScreenHome.routeName,
        builder: (context, state) => ScreenHome(),
      ),
      GoRoute(
        path: ChefScreen.routeName,
        builder: (context, state) => ChefScreen(),
      ),
      GoRoute(
        path: ScreenList.routeName,
        builder: (context, state) => ScreenList(),
      ),
      GoRoute(
        path: MealPlannerScreen.routeName,
        builder: (context, state) => MealPlannerScreen(),
      ),
    ],
  );

  final ColorScheme kColorScheme = ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 96, 59, 181),
  );

  final ColorScheme kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 5, 99, 125),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'My App',
      theme: ThemeData(
        colorScheme: kColorScheme,
        useMaterial3: true, // Optional: Enables Material 3 design
      ),
      darkTheme: ThemeData(
        colorScheme: kDarkColorScheme,
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system, // System-based dark/light theme
      debugShowCheckedModeBanner: false,
    );
  }
}