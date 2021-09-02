import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/profile/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
