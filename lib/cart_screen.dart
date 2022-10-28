import 'package:commerce_app/cart.dart' show Cart;
import 'package:commerce_app/cart_item.dart';
import 'package:commerce_app/orders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'R ${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline1!
                              .color),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  cart.totalAmount == 0
                      ? SizedBox()
                      : TextButton(
                          onPressed: () {
                            Provider.of<Orders>(context, listen: false)
                                .addOrder(
                              cart.items.values.toList(),
                              cart.totalAmount,
                            );
                            cart.clear();
                          },
                          child: Text('ORDER NOW'),
                        )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) {
              return CartItem(
                id: cart.items.values.toList()[i].id,
                productId: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].title,
              );
            },
            itemCount: cart.itemCount,
          ))
        ],
      ),
    );
  }
}
