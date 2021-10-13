import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/controllers/ProductUsuarioController.dart';
import 'package:standbyme_tcc/models/Product.dart';
import 'package:standbyme_tcc/models/ProductUsuario.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../constants.dart';

class ProductTile extends StatefulWidget {
  final Product data;
  ProductTile(this.data);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool bought = false;
  ProductUsuario productUsuario;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                      image: NetworkImage(this.widget.data.image),
                    ))),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 60,
              width: 225,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    this.widget.data.nomeProduto,
                    style: TextStyle(fontSize: 20.0, color: Colors.black),
                  ),
                  Text(
                    this.widget.data.descricaoProduto,
                    style: TextStyle(fontSize: 14.0, color: Colors.black),
                  )
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: bought ? Colors.grey[200] : kPrimaryColor,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(12),
                ),
                onPressed: () {
                  if (bought == true)
                    setState(() {
                      bought = false;
                    });
                  else
                    setState(() {
                      addProductUsuario();
                      bought = true;
                    });
                },
                child: Icon(
                  bought ? Icons.check : Icons.add,
                  size: 25,
                  color: bought ? kPrimaryColor : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  addProductUsuario() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      int userId = preferences.getInt("id");
      ProductUsuario productUsuario =
          new ProductUsuario(userId, widget.data.id, 1);
      print(productUsuario.userId);
      await ProductUsuarioController().createProductUsuario(productUsuario);
    } on Exception catch (e) {
      print(e.toString());
      return Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
