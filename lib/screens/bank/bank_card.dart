//import 'dart:html';

import 'package:flutter/material.dart';

import 'bank_card_model.dart';

class BankCard extends StatefulWidget {
  static String routeName = "/bankcard";
  const BankCard({
    Key key,
    this.bankCard,
  }) : super(key: key);
  @override
  _BankCardState createState() => _BankCardState(this.bankCard);
  final BankCardModel bankCard;
}

@override
class _BankCardState extends State<BankCard> {
  PageController _pageController;
  final BankCardModel bankCard;

  _BankCardState(this.bankCard);
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bankCard.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(
          35,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image.asset(
                  bankCard.icon,
                  height: 45,
                  width: 45,
                ),
              ),
              Text(
                bankCard.number,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: Colors.white),
              )
            ],
          ),
          Text(
            "\$${bankCard.balance.toStringAsFixed(2)}",
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
