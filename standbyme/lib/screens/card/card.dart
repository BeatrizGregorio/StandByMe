import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/card/components/body.dart';
import 'package:standbyme_tcc/size_config.dart';

class Card extends StatelessWidget {
  static String routeName = "/card";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
