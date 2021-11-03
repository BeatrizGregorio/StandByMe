import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/myInfo/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class MyInfo extends StatelessWidget {
  static String routeName = "/my_info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Minha conta",
          style: TextStyle(color: kPrimaryColor, fontSize: 21),
        ),
      ),
      body: Body(),
    );
  }
}
