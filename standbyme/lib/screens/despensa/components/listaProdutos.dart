import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/ProductController.dart';
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

  TextEditingController _productController = new TextEditingController();
  bool searched = false;
  String textSearched = "";
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  textSearched = text;
                });
              },
              controller: _productController,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  fillColor: Colors.transparent,
                  hintText: 'Pesquisar...',
                  contentPadding: EdgeInsets.only(left: 10),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                  )),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SizedBox(
              height: 450,
              child: FutureBuilder(
                  future: textSearched.isEmpty
                      ? ProductController().getProducts()
                      : ProductController()
                          .getProductsByName(_productController.text),
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
