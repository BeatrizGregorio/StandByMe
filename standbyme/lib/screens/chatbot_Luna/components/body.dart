import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/screens/chatbot_Luna/chatbot_Luna.dart';
//import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

enum MessageType {
  Sender,
  Receiver,
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /*
          Container(
              child: Column(children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    "Hoje, ${DateFormat("Hm").format(DateTime.now())}",
                    style: TextStyle(fontSize: 20),
                  )),
            ),*/
          ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return;
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 90,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {},
                            color: Colors.grey[500],
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  hintText: "Digite uma mensagem...",
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent)),
                                  hintStyle:
                                      TextStyle(color: Colors.grey[500])),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.send),
                              color: kPrimaryColor,
                              iconSize: 30,
                              onPressed: () {})
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //])),
        ],
      ),
    );
  }
}
