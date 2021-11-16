import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';

class ReceitasFavoritas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
              child: Text("Receitas favoritas",
                  style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold, color: kPrimaryColor))),
          SizedBox(height: 20),
          //SearchField()

          //_buildListView(),
        ]));
  }
}
