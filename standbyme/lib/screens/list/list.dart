import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/list/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class ListCompras extends StatelessWidget {
  static String routeName = "/list";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
