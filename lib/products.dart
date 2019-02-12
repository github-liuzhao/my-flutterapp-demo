import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function delProductItem;

  Products(this.products, {this.delProductItem}) {
    print('[Products Widget] constructor');
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('查看'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => ProductPage(products[index]['title'], products[index]['image'])
                    // no matter if load data with route or if you load them by embedding them into anther widget, 
                    // use the constructor to pass data around
                  ) // MaterialPageRoute自带转场动画
                )
                .then((value) {
                // this is essentially an ongoing operation where we can listen to when the page is removed
                  if(value == true){
                    delProductItem(index);
                  }
                }), 
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productList = Center(
      child: Text('click button, add a new product'),
    );
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] build');
    return _buildProductList();
  }
}
