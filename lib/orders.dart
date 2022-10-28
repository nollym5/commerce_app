import 'package:commerce_app/cart.dart';
import 'package:flutter/material.dart';

class OrderItems {
  final String id;
  final double amount;
  final List<CartItem> product;
  final DateTime dateTime;
  OrderItems({
    required this.id,
    required this.amount,
    required this.product,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItems> _orders = [];
  List<OrderItems> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItems(
          id: DateTime.now().toString(),
          amount: total,
          product: cartProducts,
          dateTime: DateTime.now(),
        ));
    notifyListeners();
  }
}
