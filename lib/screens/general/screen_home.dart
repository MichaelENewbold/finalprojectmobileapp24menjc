import 'package:flutter/material.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';

class ScreenHome extends StatelessWidget {
  static const String routeName = '/home';

  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(255, 190, 230, 255)),
              ),
              onPressed: () {},
              child: const Text('Login'),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: const Text(
                'Garibaldi',
                style: TextStyle(
                  fontSize: 36.0, // Increase font size by 50%
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 34, 85, 130),
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 40.0),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 200,
                    color: const Color.fromARGB(255, 0, 146, 70),
                    
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                  Container(
                    width: 100,
                    height: 200,
                    color: const Color.fromARGB(255, 206, 43, 55),
                  ),
                ],
              ),
            ),
            const Spacer(),
            const NavigationBarWidget(),
          ],
        ),
      ),
    );
  }
}
