import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:permission_handler/permission_handler.dart';

class MealPlannerScreen extends StatefulWidget {
  static const String routeName = '/meal_planner';

  const MealPlannerScreen({super.key});

  @override
  _MealPlannerScreenState createState() => _MealPlannerScreenState();
}

class _MealPlannerScreenState extends State<MealPlannerScreen> {
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

  void _addFoodItem(DateTime date, FoodItem foodItem) {
    setState(() {
      if (mealPlan.containsKey(date)) {
        mealPlan[date]!.add(foodItem);
      } else {
        mealPlan[date] = [foodItem];
      }
    });
  }

  void _removeFoodItem(DateTime date, FoodItem foodItem) {
    setState(() {
      mealPlan[date]?.remove(foodItem);
      if (mealPlan[date]?.isEmpty ?? true) {
        mealPlan.remove(date);
      }
    });
  }

  Future<void> _requestCalendarPermission() async {
    final status = await Permission.calendarWriteOnly.request();
    if (status.isGranted) {
      // Permissions granted, continue with adding the event
    } else {
      // Handle permission denial
    }
  }

  void _addToCalendar(DateTime date, FoodItem foodItem) {
    final Event event = Event(
      title: foodItem.name,
      description: foodItem.description,
      location: 'Home',
      startDate: DateTime.now(),
      endDate: DateTime.now().add(Duration(hours: 1)),
    );

    Add2Calendar.addEvent2Cal(event);
  }
  
  Future<void> _addToCalendarWithPermission(DateTime date, FoodItem foodItem) async {
    final status = await Permission.calendarWriteOnly.request();
    if (status.isGranted) {
      _addToCalendar(date, foodItem);
    } else if (status.isDenied) {
      // Handle permission denial
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Calendar permission denied')),
      );
    } else if (status.isPermanentlyDenied) {
      // Handle permanent permission denial
      openAppSettings();
    }
  }

  Future<void> _showAddFoodItemDialog() async {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Food Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Food Name'),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: 24.0),
            GestureDetector(
              onTap: () async {
                final DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2101),
                );
                if (picked != null && picked != selectedDate) {
                  setState(() {
                    selectedDate = picked;
                  });
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Date:',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(width: 8.0),
                      Text(
                        DateFormat('MMM dd, yyyy').format(selectedDate),
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text;
              final description = descriptionController.text;

              if (name.isNotEmpty && description.isNotEmpty) {
                final newFoodItem = FoodItem(name: name, description: description);
                _addFoodItem(selectedDate, newFoodItem);
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
          TextButton(
            onPressed: () {
              final name = nameController.text;
              final description = descriptionController.text;

              if (name.isNotEmpty && description.isNotEmpty) {
                final newFoodItem = FoodItem(name: name, description: description);
                _addFoodItem(selectedDate, newFoodItem);
                _addToCalendar(selectedDate, newFoodItem); // Add directly to calendar
                Navigator.pop(context);
              }
            },
            child: const Text('Add 2 both Calendars'),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddFoodItemDialog,
          ),
        ],
      ),
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
                      title: Text(
                        'Meal Plan for ${DateFormat('MMM dd, yyyy').format(date)}',
                        textAlign: TextAlign.center, // Centered Date Text
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.center, // Centered food item list
                        children: foodItems!.map((food) {
                          return ListTile(
                            title: Text(
                              food.name,
                              textAlign: TextAlign.center, // Centered Food Item Name
                            ),
                            subtitle: Text(
                              food.description,
                              textAlign: TextAlign.center, // Centered Description
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                _removeFoodItem(date, food);
                              },
                            ),
                          );
                        }).toList(),
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