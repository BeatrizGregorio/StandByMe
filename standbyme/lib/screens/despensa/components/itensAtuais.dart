import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/models/Product.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/user_product_tile.dart';

class ItensAtuais extends StatelessWidget {
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    //addProducts();
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

  /*void addProducts() {
    Product product1 = Product(
        "Tomate",
        "https://superprix.vteximg.com.br/arquivos/ids/178639-210-210/Tomate-1-unidade-aprox-250g.png?v=636868090295370000",
        "Tomate fresco");
    Product product2 = Product(
        "Feijão",
        "https://armazemsaovito.fbitsstatic.net/img/p/feijao-carioca-150269/346758.jpg?w=344&h=344&v=no-change",
        "Feijão Carioca");
    Product product3 = Product(
        "Arroz",
        "https://pubimg.band.uol.com.br/files/fea2747ceb5cf1febf1f.png",
        "Arroz branco");

    products[0] = product1;
    products[1] = product2;
    products[2] = product3;
  }*/
}
