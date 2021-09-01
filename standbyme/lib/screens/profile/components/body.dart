import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/profile/profile_screen.dart';

import 'package:standbyme_tcc/size_config.dart';

class Body extends StatelessWidget {
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
            centerTitle: true,
            actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.0),
          )
        ]));
  }
}
