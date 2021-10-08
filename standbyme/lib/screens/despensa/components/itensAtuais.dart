import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/ProductUsuarioController.dart';
import 'package:standbyme_tcc/models/Product.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/screens/despensa/components/search_field.dart';
import 'package:standbyme_tcc/screens/despensa/tiles/user_product_tile.dart';

class ItensAtuais extends StatefulWidget {
  int userId;

  @override
  _ItensAtuaisState createState() => _ItensAtuaisState();
}

class _ItensAtuaisState extends State<ItensAtuais> {
  List<Product> products = [];
  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.userId = preferences.getInt("id");
    });
  }

  @override
  void initState() {
    super.initState();
    getId();
  }

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
              child: FutureBuilder(
                  future: ProductUsuarioController()
                      .getProductsUsuario(widget.userId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return LinearProgressIndicator();
                    }
                    var products = snapshot.data;
                    return ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: UserProductTile(
                                  products[index], widget.userId));
                        });
                  }),
            ),
          ),
          //_buildListView(),
        ]));
  }
}
