import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:csc322_starter_app/widgets/general/widget_navigation_bar.dart';
import 'package:csc322_starter_app/widgets/general/widget_food_item.dart';

class ScreenList extends StatefulWidget {
  static const String routeName = '/lists';

  @override
  _ScreenListState createState() => _ScreenListState();
}

class _ScreenListState extends State<ScreenList> {
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  Map<String, List<FoodItem>> lists = {
    'Main List': [
      FoodItem(name: 'Pizza', description: 'Cheese and tomato pizza'),
      FoodItem(name: 'Burger', description: 'Beef burger with lettuce and cheese'),
      FoodItem(name: 'Sushi', description: 'Fresh sushi with tuna and salmon'),
      FoodItem(name: 'Pasta', description: 'Spaghetti with marinara sauce'),
      FoodItem(name: 'Salad', description: 'Mixed greens with vinaigrette dressing'),
    ],
    'Desserts': [
      FoodItem(name: 'Ice Cream', description: 'Vanilla ice cream with chocolate syrup'),
      FoodItem(name: 'Cake', description: 'Chocolate cake with frosting'),
      FoodItem(name: 'Pie', description: 'Apple pie with whipped cream'),
      FoodItem(name: 'Cookies', description: 'Chocolate chip cookies'),
      FoodItem(name: 'Brownies', description: 'Fudge brownies with walnuts'),
    ],
    'Favorite Foods': [],
  };

  String currentList = 'Main List';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    _database.child('lists').once().then((DatabaseEvent event) {
      DataSnapshot snapshot = event.snapshot;
      if (snapshot.value != null) {
        Map<String, dynamic> data = Map<String, dynamic>.from(snapshot.value as Map);
        setState(() {
          lists = data.map((key, value) {
            List<FoodItem> items = List<FoodItem>.from(
              value.map((item) => FoodItem.fromMap(Map<String, dynamic>.from(item))),
            );
            return MapEntry(key, items);
          });
        });
      }
    });
  }

  void _saveData() {
    Map<String, dynamic> data = lists.map((key, value) {
      List<Map<String, dynamic>> items = value.map((item) => item.toMap()).toList();
      return MapEntry(key, items);
    });
    _database.child('lists').set(data);
  }

  void _addItem(String name, String description) {
    setState(() {
      lists[currentList]!.add(FoodItem(name: name, description: description));
    });
    _saveData();
    Navigator.pop(context); // Close the bottom drawer after adding.
  }

  void _switchList(String listName) {
    setState(() {
      currentList = listName;
    });
    Navigator.pop(context); // Close the drawer.
  }

  void _toggleCheck(int index) {
    setState(() {
      lists[currentList]![index].isChecked =
          !lists[currentList]![index].isChecked;
    });
    _saveData();
  }

  void _deleteItem(int index) {
    setState(() {
      lists[currentList]!.removeAt(index);
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(currentList)),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
              child: Text('Lists'),
            ),
            for (var listName in lists.keys)
              ListTile(
                title: Text(listName),
                onTap: () {
                  _switchList(listName);
                },
              ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: lists[currentList]!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Checkbox(
                      value: lists[currentList]![index].isChecked,
                      onChanged: (value) {
                        _toggleCheck(index);
                      },
                    ),
                    title: Text(lists[currentList]![index].name),
                    subtitle: Text(lists[currentList]![index].description),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _deleteItem(index);
                      },
                    ),
                    onTap: () {
                      _toggleCheck(index);
                    },
                  );
                },
              ),
            ),
            const NavigationBarWidget(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context, builder: (context){
          final TextEditingController nameController = TextEditingController();
          final TextEditingController descriptionController = TextEditingController();

          return Padding(padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, 
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
              ),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(onPressed: (){
                _addItem(nameController.text, descriptionController.text);
              }, child: const Text('Add Item')),
          ],),);
        });
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}