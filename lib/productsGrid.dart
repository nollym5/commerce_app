import 'package:commerce_app/product_item.dart';
import 'package:commerce_app/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFaves;

  ProductsGrid(this.showFaves);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    final products = showFaves ? productData.favourites : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: products.length,
      itemBuilder: (context, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
              // products[i].id,
              // products[i].title,
              // products[i].imageUrl,
              ),
        );
      },
    );
  }
}
