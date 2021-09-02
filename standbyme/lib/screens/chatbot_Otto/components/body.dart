import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:standbyme_tcc/screens/chatbot_Luna/chatbot_Luna.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
                padding: EdgeInsets.only(top: 15, bottom: 10),
                child: Text(
                  "Hoje, ${DateFormat("Hm").format(DateTime.now())}",
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
