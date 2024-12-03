class FoodItem {
  final String name;
  final String description;
  bool isChecked;

  FoodItem({required this.name, required this.description, this.isChecked = false});

  factory FoodItem.fromMap(Map<String, dynamic> map) {
    return FoodItem(
      name: map['name'],
      description: map['description'],
      isChecked: map['isChecked'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'isChecked': isChecked,
    };
  }
}