import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/screens/chatbot_Luna/chatbot_Luna.dart';
//import 'package:intl/intl.dart';

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
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 60,
                      width: double.infinity,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.emoji_emotions_outlined,
                            color: Colors.grey[500],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  enabledBorder: InputBorder.none,
                                  hintText: "Digite uma mensagem...",
                                  hintStyle:
                                      TextStyle(color: Colors.grey[500])),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
