import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/sign_in/components/body.dart';

import '../../size_config.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: SizedBox(
        height: getProportionateScreenHeight(65),
        child: Image.asset(
          "assets/images/logo_porta.PNG",
        ),
      )
          //Image.asset(
          //"assets/images/logo.jpeg",
          //scale: 3,
          //),
          ),
      body: Body(),
    );
  }
}
