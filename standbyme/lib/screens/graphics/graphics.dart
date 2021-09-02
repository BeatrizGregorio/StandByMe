import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/graphics/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class Graphics extends StatelessWidget {
  static String routeName = "/graphics";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
