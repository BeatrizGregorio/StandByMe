import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/despensa/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class Despensa extends StatelessWidget {
  static String routeName = "/despensa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
