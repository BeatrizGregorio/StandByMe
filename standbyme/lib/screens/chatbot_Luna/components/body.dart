import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
//import 'package:standbyme_tcc/screens/chatbot_Luna/chatbot_Luna.dart';
import 'package:intl/intl.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Body extends StatefulWidget {
  Body({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/chatbotLuna/chatbotLuna.json")
            .build();
    Dialogflow dialogflow = await Dialogflow(
        authGoogle: authGoogle, language: Language.portugueseBrazilian);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
    setState(() {
      messsages.insert(0, {
        "data": 0,
        "message": aiResponse.getListMessage()[0]["text"]["text"][0].toString()
      });
    });

    print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor.withOpacity(0.2),
        iconTheme: IconThemeData(color: Colors.transparent),
        title:
            Text("Luna", style: TextStyle(color: kPrimaryColor, fontSize: 24)),
        centerTitle: false,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.only(top: 15, bottom: 10),
                  child: Text(
                    "Hoje, ${DateFormat("Hm").format(DateTime.now())}",
                    style: TextStyle(fontSize: 18),
                  )),
            ),
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              child: ListTile(
                title: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: TextFormField(
                    controller: messageInsert,
                    decoration: InputDecoration(
                        hintText: "Digite uma mensagem...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none),
                    style: TextStyle(fontSize: 16, color: kTextColor),
                  ),
                ),
                trailing: IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 33.0,
                      color: kPrimaryColor,
                    ),
                    onPressed: () {
                      if (messageInsert.text.isEmpty) {
                        print("empty message");
                      } else {
                        setState(() {
                          messsages.insert(
                              0, {"data": 1, "message": messageInsert.text});
                        });
                        print(messageInsert.text);
                        response(messageInsert.text);
                        messageInsert.clear();
                      }
                      FocusScopeNode currentFocus = FocusScope.of(context);
                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                    }),
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment:
            data == 1 ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          data == 0
              ? Container(
                  height: 53,
                  width: 53,
                  child: CircleAvatar(
                    backgroundColor: kPrimaryColor,
                    backgroundImage:
                        AssetImage("assets/chatbotLuna/iconLuna.jpg"),
                  ),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Bubble(
                radius: Radius.circular(13.0),
                color:
                    data == 0 ? kPrimaryColor : kPrimaryColor.withOpacity(0.6),
                elevation: 0.0,
                child: Padding(
                  padding: EdgeInsets.only(left: 1.0, top: 4, bottom: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 3.0,
                      ),
                      Flexible(
                          child: Container(
                        constraints: BoxConstraints(maxWidth: 200),
                        child: Text(
                          message,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ))
                    ],
                  ),
                )),
          ),
          data == 1
              ? Container(
                  height: 53,
                  width: 53,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    backgroundImage: AssetImage("assets/userIcon.png"),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
