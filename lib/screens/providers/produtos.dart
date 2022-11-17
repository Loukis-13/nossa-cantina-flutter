import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nossa_cantina/controllers/auth_controller.dart';
import 'package:nossa_cantina/models/item.dart';
import 'package:nossa_cantina/screens/util.dart';

class Produtos with ChangeNotifier {
  List<Item> _produtos = <Item>[];
  String _busca = "";

  Produtos() {
    String escola = AuthController.user["éEscola"] ? AuthController.user["uid"] : AuthController.user["escola"];

    FirebaseFirestore.instance.collection('itens').where('escola', isEqualTo: escola).get().then((value) {
      _produtos = value.docs.map((e) => Item.fromJsonAndId(e.id, e.data())).toList();
      notifyListeners();
    }).catchError((e) {
      print(e);
      return null;
    });
  }

  void createItem(BuildContext context, Item item) {
    FirebaseFirestore.instance.collection('itens').add({
      "escola": AuthController.user["uid"],
      "name": item.name,
      "img": item.img,
      "price": item.price,
      "stock": item.stock,
    }).then((value) {
      item.id = value.id;
      _produtos.add(item);
      notifyListeners();
    }).catchError((e) {
      erro(context, 'Falha ao salvar item.');
    });
  }

  void updateItem(BuildContext context, Item item) {
    FirebaseFirestore.instance.collection('itens').doc(item.id).update({
      "name": item.name,
      "img": item.img,
      "price": item.price,
      "stock": item.stock,
    }).then((value) {
      notifyListeners();
    }).catchError((e) {
      erro(context, 'Falha ao salvar item. $e');
    });
  }

  void pagar() {
    var carrinho = getSelectedItems();

    FirebaseFirestore.instance.collection("carrinho").add({
      "usuario": FirebaseAuth.instance.currentUser!.uid,
      "data": DateTime.now(),
      "total": getTotal(),
      "pedidos": carrinho.map((e) => e.toJson()).toList(),
    });

    for (Item i in carrinho) {
      i.stock -= i.qnt;
      i.qnt = 0;

      FirebaseFirestore.instance.collection("itens").doc(i.id).update({"stock": i.stock});
    }

    notifyListeners();
  }

  void updateCarrinho(Item e, int val) {
    e.qnt = val;
    notifyListeners();
  }

  void search(String val) {
    _busca = val;
    notifyListeners();
  }

  Iterable<Item> getSelectedItems() => _produtos.where((e) => e.qnt > 0);

  Iterable<Item> getSearchedItems() => _busca.isNotEmpty ? _produtos.where((e) => e.name.contains(_busca)) : _produtos;

  double getTotal() => _produtos.fold(0, (sum, e) => sum + (e.price * e.qnt));

  bool isEmpty() => _produtos.any((e) => e.qnt > 0);
}
