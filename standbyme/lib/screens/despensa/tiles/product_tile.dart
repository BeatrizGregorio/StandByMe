import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/despensa/datas/product.dart';

import '../../../constants.dart';

class ProductTile extends StatefulWidget {
  final Product data;
  ProductTile(this.data);

  @override
  _ProductTileState createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  bool bought = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
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
            Column(
              children: [
                Text(
                  this.widget.data.title,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                Text(
                  this.widget.data.description,
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 11, left: 120),
              child: SizedBox(
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
            )
          ],
        ),
      ),
    );
  }
}
