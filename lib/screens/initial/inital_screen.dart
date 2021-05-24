import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/initial/components/body.dart';
import 'package:standbyme_tcc/size_config.dart';

class InitialScreen extends StatelessWidget {
  static String routeName = "/initial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: getProportionateScreenHeight(65),
          child: Image.asset(
            "assets/images/logo_porta.PNG",
          ),
        ),
      ),
      body: Body(),
    );
  }
}
