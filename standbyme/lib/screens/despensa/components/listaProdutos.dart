//import 'package:flutter/gestures.dart';

import 'package:flutter/material.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/ProductController.dart';
//import 'package:standbyme_tcc/models/Product.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/product_tile.dart';

class ListaProdutos extends StatefulWidget {
  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            mainAxisSize: MainAxisSize.max,
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
              child: FutureBuilder(
                  future: ProductController().getProducts(),
                  builder: (context, snapshot) {
                    var products = snapshot.data;
                    if (products == null)
                      return Center(
                        child: SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              valueColor:
                                  new AlwaysStoppedAnimation(kPrimaryColor),
                            )),
                      );
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: ProductTile(products[index]),
                        );
                      },
                    );
                  }),
            ),
          ),
          //_buildListView(),
        ]));
  }
}
