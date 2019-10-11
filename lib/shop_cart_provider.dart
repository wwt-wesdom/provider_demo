import 'package:flutter/material.dart' show ChangeNotifier;
import 'dart:async' show Future;

class ShopCartModel with ChangeNotifier {
  List<ShopCartItemModel> _shopCartList = [];
  Map<String, dynamic> item = {
    'title': '连衣裙',
    'count': 10,
    'img': 'assets/images/ic_launcher.png',
    'price': 100
  };
  List<ShopCartItemModel> get shopCartList => _shopCartList;
  ShopCartModel() {
    init();
  }
  void init() async {
    void getList() {
      for (var i = 0; i < 10; ++i) {
        _shopCartList.add(ShopCartItemModel.fromJson(item));
      }
    }
    await Future.delayed(Duration(milliseconds: 1500),getList);
    notifyListeners();
  }
  void addCart() {
    print('_shopCartList:$_shopCartList');
    _shopCartList.add(ShopCartItemModel.fromJson(item));
    print(_shopCartList);
    notifyListeners();
  }
  void deleteCartItem(index) {
    print('cart-item-index:$index');
    _shopCartList.removeAt(index);
    notifyListeners();
  }
}

class ShopCartItemModel {
  String title;
  int count;
  String img;
  num price;
  ShopCartItemModel.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.count = json['count'];
    this.img = json['img'];
    this.price = json['price'];
  }
}