import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/datas/product.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/product_tile.dart';

class ListaProdutos extends StatefulWidget {
  const ListaProdutos({Key key}) : super(key: key);

  @override
  _ListaProdutosState createState() => _ListaProdutosState();
}

class _ListaProdutosState extends State<ListaProdutos> {
  List<Product> products = List<Product>();
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
  Product product4 = Product(
      "Filé Mignon",
      "https://static.paodeacucar.com/img/uploads/1/792/480792.jpg",
      "Bife de filé mignon fresco");
  Product product5 = Product(
      "Batata",
      "https://onisafra.com/manaus/wp-content/uploads/2020/03/batata-portuguesa.jpg",
      "Batata fresca");
  void addProducts() {
    products[0] = product1;
    products[1] = product2;
    products[2] = product3;
    products[3] = product4;
    products[4] = product5;
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
