import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/models/Product.dart';
//import 'package:standbyme_tcc/models/ProductUsuario.dart';
import 'package:standbyme_tcc/size_config.dart';

class UserProductTile extends StatefulWidget {
  final Product data;
  int userId;
  UserProductTile(this.data, this.userId);

  @override
  _UserProductTileState createState() => _UserProductTileState();
}

class _UserProductTileState extends State<UserProductTile> {
  int _currentCount = 1;
  @override
  Widget build(BuildContext context) {
    return /*Dismissible(
      direction: DismissDirection.startToEnd,
      child:*/
        Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
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
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              //height: getProportionateScreenHeight(80),
              width: getProportionateScreenWidth(100),
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
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 85,
            ),
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _createIncrementDicrementButton(
                      Icons.remove, () => _dicrement()),
                  SizedBox(width: 9),
                  Text(_currentCount.toString()),
                  SizedBox(
                    width: 9,
                  ),
                  _createIncrementDicrementButton(
                      Icons.add, () => _increment()),
                ],
              ),
            )
          ],
        ),
      ),
    );
    /*,
    );*/
  }

  void _increment() {
    setState(() {
      _currentCount++;
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 0) _currentCount--;
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: kPrimaryColor,
      child: Icon(
        icon,
        color: Colors.white,
        size: 12.0,
      ),
      shape: CircleBorder(),
    );
  }
}
