import 'package:flutter/material.dart';

class Items {
  String ProductName;
  String Price;

  Items({required this.ProductName, required this.Price});
}

class Change extends ChangeNotifier {
  List<Items> items = [];
  List<Items> get _items => items;
  void addItem() {
    items.add(Items(ProductName: '', Price: ''));
    notifyListeners();
  }

  void updateItem(int index, String name, String price) {
    items[index] = Items(ProductName: name, Price: price);
    // notifyListeners();
    sum();
  }

  void delete(int index) {
    items.removeAt(index);
    sum();
    notifyListeners();
  }

  double total = 0;

  sum() {
    total = 0;
    for (int i = 0; i < items.length; i++) {
      total += (items[i].Price) != '' ? double.parse(items[i].Price) : 0;
    }
    notifyListeners();
  }
}
