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
            icon: "",
            press: () => {Navigator.of(context).pushNamed("/my_Info")},
          ),
          ProfileMenu(
            text: "Cartões",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Sair",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
