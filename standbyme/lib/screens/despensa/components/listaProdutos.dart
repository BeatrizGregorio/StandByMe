//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
//import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/ProductController.dart';
import 'package:standbyme_tcc/models/Product.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/product_tile.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  List<Product> products = [];

  @override
  void initState() async {
    super.initState();

    products = await ProductController().getProducts();
    print(products[0].nomeProduto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text("Lista de produtos",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor))),
          SizedBox(height: 20),
          SearchField(),
          SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              height: 450,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: ProductTile(products[index]),
                    );
                  }),
            ),
          ),
          //_buildListView(),
        ]));
  }
}
