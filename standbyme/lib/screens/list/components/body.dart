import 'package:flutter/material.dart';

import 'package:standbyme_tcc/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(200, 153, 51, 153),
            iconTheme: IconThemeData(color: Colors.black),
            shadowColor: Colors.transparent,
            title: Image.asset(
              "assets/images/logo_porta.PNG",
              height: SizeConfig.screenHeight * 0.08,
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10.0),
              ),
            ]),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "Lista de compras",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(20),
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1.5),
            )
          ],
        )));
  }
}
