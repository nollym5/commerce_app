import 'package:commerce_app/appDrawer.dart';
import 'package:commerce_app/order_item.dart';
import 'package:commerce_app/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: (context, i) {
          return OrderItem(orderData.orders[i]);
        },
      ),
    );
  }
}
