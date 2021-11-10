import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/despensa/components/body.dart';
import 'package:standbyme_tcc/size_config.dart';

class Despensa extends StatelessWidget {
  static String routeName = "/despensa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          shadowColor: Colors.transparent,
          title: Image.asset(
            "assets/images/logo_porta_branca.png",
            height: SizeConfig.screenHeight * 0.08,
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10.0),
            )
          ]),
      body: Body(),
    );
  }
}
