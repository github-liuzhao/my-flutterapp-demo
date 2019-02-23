import 'package:flutter/material.dart';
import './product_card.dart';
import 'package:scoped_model/scoped_model.dart';
import '../../model/product.dart';
import '../../scope-model/products.dart';

class Products extends StatelessWidget {

  Products() {
    print('[Products Widget] constructor');
  }

  Widget _buildProductList(List<Product> products) {
    Widget productList = Center(
      child: Text('product list is empty'),
    );
    if (products.length > 0) {
      productList = ListView.builder(
        // Creates a scrollable, linear array of widgets that are created on demand.
        itemBuilder: (BuildContext context, int index){
          return ProductCard(products[index], index);
        },
        itemCount: products.length,
      );
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build');
    return ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model){
        return _buildProductList(model.products);
      },
    );
  }
}
