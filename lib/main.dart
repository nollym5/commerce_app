import 'package:commerce_app/cart.dart';
import 'package:commerce_app/cart_screen.dart';
import 'package:commerce_app/edit_prroduct_screen.dart';
import 'package:commerce_app/orders.dart';
import 'package:commerce_app/orders_screen.dart';
import 'package:commerce_app/productScreen.dart';
import 'package:commerce_app/product_detail_screen.dart';
import 'package:commerce_app/products.dart';
import 'package:commerce_app/user_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductsProvider()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.orange,
          fontFamily: 'Lato',
        ),
        home: ProductScreen(),
        routes: {
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          CartScreen.routeName: (context) => CartScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProductScreen.routeName: (context) => UserProductScreen(),
          EditProductScreen.routeName: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
