import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/transactions/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class Transactions extends StatelessWidget {
  static String routeName = "/transactions";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
