import 'package:flutter/material.dart';
import 'package:csc322_starter_app/widgets/general/widget_recipe_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';

class ScreenHome extends StatelessWidget {
  static const String routeName = '/home';

  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            const NavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
