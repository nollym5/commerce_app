import 'package:commerce_app/appDrawer.dart';
import 'package:commerce_app/badge.dart';
import 'package:commerce_app/cart.dart';
import 'package:commerce_app/cart_screen.dart';
import 'package:commerce_app/productsGrid.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum Options { Favourites, All }

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: [
          PopupMenuButton(
            onSelected: (Options selectedValue) {
              setState(() {
                if (selectedValue == Options.Favourites) {
                  _showOnlyFavourites = true;
                } else {
                  _showOnlyFavourites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: Options.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: Options.All,
              )
            ],
            icon: Icon(Icons.more_vert),
          ),
          Consumer<Cart>(
            builder: (context, cartData, child) => Badge(
              value: cartData.itemCount.toString(),
              child: child!,
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
