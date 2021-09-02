import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/calendar/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';

class CalendarScreen extends StatelessWidget {
  static String routeName = "/calendar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
