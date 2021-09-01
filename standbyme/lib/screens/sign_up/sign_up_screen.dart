import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/sign_up/components/body.dart';

import '../../size_config.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/logo_porta.PNG",
          height: SizeConfig.screenHeight * 0.08,
        ),
      ),
      body: Body(),
    );
  }
}
