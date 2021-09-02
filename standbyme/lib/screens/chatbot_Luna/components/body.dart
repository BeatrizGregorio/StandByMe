import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:standbyme_tcc/screens/chatbot_Luna/chatbot_Luna.dart';
import 'package:intl/intl.dart';

class Body extends StatelessWidget {
  final messageController = TextEditingController();
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
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      color: Colors.black),
                )),
          ),
          Divider(
            height: 5,
            color: Color.fromARGB(200, 153, 51, 153),
          ),
          Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.camera_alt,
                    color: Color.fromARGB(200, 153, 51, 153), size: 30),
              ),
              title: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color.fromARGB(50, 153, 51, 153)),
                padding: EdgeInsets.only(left: 0),
                child: TextFormField(
                  controller: messageController,
                  decoration: InputDecoration(
                    hintText: "Pergunte algo",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(100, 153, 51, 153)),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
