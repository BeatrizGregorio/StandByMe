import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/bank/constants/app_textstyle.dart';
import 'package:standbyme_tcc/screens/bank/constants/color_constants.dart';
import 'package:standbyme_tcc/screens/bank/data/card_data.dart';
import 'package:standbyme_tcc/screens/bank/widgets/my_card.dart';

class BankCard extends StatelessWidget {
  const BankCard({Key key}) : super(key: key);
  static String routeName = "/bankcard";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Meus cartões",
            style: TextStyle(
              fontFamily: "Poppins",
              color: kPrimaryColor,
            ),
          ),
          actions: [
            IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 27,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile_screen');
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: myCards.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                    itemBuilder: (context, index) {
                      return MyCard(
                        card: myCards[index],
                      );
                    }),
              ),
              CircleAvatar(
                radius: 40,
                child: Icon(Icons.add, size: 50),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
