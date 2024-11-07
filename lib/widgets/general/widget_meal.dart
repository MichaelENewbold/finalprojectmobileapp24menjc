import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';

class Meal {
  final DateTime date;
  final List<FoodItem> foodItems;

  Meal({required this.date, required this.foodItems});
}
