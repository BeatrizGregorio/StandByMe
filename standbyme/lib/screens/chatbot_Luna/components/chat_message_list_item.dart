import 'package:bubble/bubble.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/screens/chatbot_Luna/components/chat_message.dart';
import 'package:flutter/material.dart';

class ChatMessageListItem extends StatelessWidget {
  final ChatMessage chatMessage;

  ChatMessageListItem({this.chatMessage});

  @override
  Widget build(BuildContext context) {
    return chatMessage.type == ChatMessageType.sent
        ? _showSentMessage()
        : _showReceivedMessage();
  }

  Widget _showSentMessage({EdgeInsets padding, TextAlign textAlign}) {
    return ListTile(
        contentPadding: EdgeInsets.fromLTRB(64.0, 0.0, 8.0, 0.0),
        trailing: CircleAvatar(
          child: Text(
            chatMessage.name.toUpperCase()[0],
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kPrimaryLightColor,
        ),
        title: Text(chatMessage.name, textAlign: TextAlign.right),
        subtitle: Bubble(
          radius: Radius.circular(13.0),
          child: Text(chatMessage.text,
              textAlign: TextAlign.left, style: TextStyle(color: Colors.white)),
          color: Color.fromARGB(255, 182, 95, 207),
        ));
  }

  Widget _showReceivedMessage() {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(8.0, 0.0, 64.0, 0.0),
      leading: CircleAvatar(
        child: Image.asset("assets/images/luna_preta.png"),
        backgroundColor: kPrimaryLightColor,
      ),
      title: Text(chatMessage.name, textAlign: TextAlign.left),
      subtitle: Bubble(
          radius: Radius.circular(13.0),
          color: Colors.grey[100],
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
                    chatMessage.text,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ))
              ],
            ),
          )),
    );
  }
}
