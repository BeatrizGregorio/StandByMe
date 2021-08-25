import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/kitchen/components/body.dart';
import 'package:standbyme_tcc/size_config.dart';

class Kitchen extends StatelessWidget {
  static String routeName = "/kitchen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
