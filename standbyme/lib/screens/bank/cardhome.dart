import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/bank/constants/app_textstyle.dart';
import 'package:standbyme_tcc/screens/bank/constants/color_constants.dart';
import 'package:standbyme_tcc/screens/bank/data/card_data.dart';
import 'package:standbyme_tcc/screens/bank/data/transaction_data.dart';
import 'package:standbyme_tcc/screens/bank/widgets/my_card.dart';
import 'package:standbyme_tcc/screens/bank/widgets/transaction_card.dart';

class CardHome extends StatelessWidget {
  const CardHome({Key key}) : super(key: key);
  static String routeName = "/cardhome";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Transações",
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
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/add_transaction_screen');
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0))),
                ),
                child: const Text("ADICIONAR TRANSAÇÃO"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Últimas Transações",
                style: ApptextStyle.BODY_TEXT,
              ),
              SizedBox(
                height: 15,
              ),
              ListView.separated(
                  itemCount: myTransactions.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 10,
                    );
                  },
                  itemBuilder: (context, index) {
                    return TransactionCard(transaction: myTransactions[index]);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
