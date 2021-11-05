import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/calendar/components/body.dart';
//import 'package:standbyme_tcc/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/screens/chatbot_Luna/components/body.dart';

class CalendarScreen extends StatelessWidget {
  static String routeName = "/calendar";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();

        return BodyCalendar(snapshot.data);
      },
      future: getId(),
    ));
  }

  Future<int> getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt("id");
  }
}
