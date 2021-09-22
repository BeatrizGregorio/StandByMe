import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/datas/product.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/user_product_tile.dart';

class ItensAtuais extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = List<Product>.generate(
        2,
        (index) => Product(
            "Tomate",
            "https://superprix.vteximg.com.br/arquivos/ids/178639-292-292/Tomate-1-unidade-aprox-250g.png?v=636868090295370000",
            "Tomate fresco"));
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text("Itens atuais",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor))),
          SizedBox(height: 20),
          SearchField(),
          Expanded(
            child: SizedBox(
              height: 450,
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: UserProductTile(products[index]));
                  }),
            ),
          ),
          //_buildListView(),
        ]));
  }
}