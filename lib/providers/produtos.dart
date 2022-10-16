import 'package:flutter/foundation.dart';

import '../models/item.dart';

class Produtos with ChangeNotifier {
  List<Item> _produtos = <Item>[];
  String _busca = "";

  Produtos() {
    _produtos = [
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/4.jpg", "stock": 4},
      {"name": "Pera", "price": 2.0, "img": "assets/fundo/0.jpg", "stock": 2},
      {"name": "Amora", "price": 2.0, "img": "assets/fundo/1.jpg", "stock": 1},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/3.jpg", "stock": 5},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/8.jpg", "stock": 3},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/4.jpg", "stock": 4},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/9.jpg", "stock": 7},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/6.jpg", "stock": 6},
      {"name": "Maçã", "price": 2.0, "img": "assets/fundo/7.jpg", "stock": 4}
    ].map((e) => Item.fromJson(e)).toList();
  }

  Iterable<Item> getSelectedItems() => _produtos.where((e) => e.qnt > 0);

  Iterable<Item> getSearchedItems() => _busca.isNotEmpty ? _produtos.where((e) => e.name.contains(_busca)) : _produtos;

  double getTotal() => _produtos.fold(0, (sum, e) => sum + (e.price * e.qnt));

  bool isEmpty() => _produtos.any((e) => e.qnt > 0);

  void updateItem(Item e, double val) {
    e.qnt = val;
    notifyListeners();
  }

  void search(String val) {
    _busca = val;
    notifyListeners();
  }
}
