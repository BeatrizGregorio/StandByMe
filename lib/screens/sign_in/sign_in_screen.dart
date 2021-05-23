import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        //Image.asset(
        //"assets/images/logo.jpeg",
        //scale: 3,
        //),
      ),
      body: Body(),
    );
  }
}
