import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/login_success/components/body.dart';

import '../../size_config.dart';

class LoginSucessScreen extends StatelessWidget {
  static String routeName = "/login_success";
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
