import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/editCard/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class EditCard extends StatelessWidget {
  static String routeName = "/editCard";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
