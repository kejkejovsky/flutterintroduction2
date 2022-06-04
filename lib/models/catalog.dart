import 'package:flutter/material.dart';
class CatalogModel {
  static List<String> itemNames = [
    'Item #1',
    'Item #2',
    'Item #3',
    'Item #4',
    'Item #5',
    'Item #6',
    'Item #7',
    'Item #8',
    'Item #9',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final Color color;
  final int price = 42;

  Item(this.id, this.name)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator == (Object other) => other is Item && other.id == id;
}