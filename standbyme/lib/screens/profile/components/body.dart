import 'package:flutter/material.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Minha conta",
            icon: Icon(Icons.person),
            press: () => {Navigator.of(context).pushNamed("/my_Info")},
          ),
          ProfileMenu(
            text: "Cartões",
            icon: Icon(Icons.credit_card),
            press: () {
              Navigator.of(context).pushNamed("/bankcard");
            },
          ),
          ProfileMenu(
            text: "Sair",
            icon: Icon(Icons.logout),
            press: () {
              Navigator.popUntil(context, ModalRoute.withName("/initial"));
            },
          ),
        ],
      ),
    );
  }
}
