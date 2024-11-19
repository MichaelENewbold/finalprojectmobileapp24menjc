class FoodItem {
  final String name;
  final String description;
  bool isChecked; // New property to track checked state

  FoodItem({required this.name, required this.description, this.isChecked = false});
}