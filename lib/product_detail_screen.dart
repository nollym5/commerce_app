import 'package:commerce_app/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context, listen: true);
    //final products = productData.items;
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    final theProduct = productData.findById(productId);
    //print(productId);
    //print(productData.firstWhere((prod) => prod.id==productId));
    //final theProduct= productData.firstWhere((prod) => prod.id==productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(theProduct.title),
      ),
      body: Card(
        child: Column(
          children: [
            Image.network(
              theProduct.imageUrl,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'R ${theProduct.price}',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              theProduct.description,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
