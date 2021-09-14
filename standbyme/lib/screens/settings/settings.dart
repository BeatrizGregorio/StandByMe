import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/settings/components/body.dart';
import '../../size_config.dart';
import 'package:standbyme_tcc/constants.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        shadowColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo_porta.PNG",
          height: SizeConfig.screenHeight * 0.08,
        ),
        //backgroundColor: kPrimaryColor.withOpacity(0.7),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
