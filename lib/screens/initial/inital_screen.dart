import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/initial/components/body.dart';

class InitialScreen extends StatelessWidget {
  static String routeName = "/initial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inicial"),
      ),
      body: Body(),
    );
  }
}
