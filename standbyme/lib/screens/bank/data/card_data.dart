import 'package:flutter/material.dart';
import 'package:standbyme_tcc/screens/bank/constants/color_constants.dart';

class CardModel {
  String cardHolderName;
  String cardNumber;
  String expDate;
  String cvv;
  Color cardColor;

  CardModel({
    this.cardHolderName,
    this.cardNumber,
    this.cvv,
    this.expDate,
    this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    cardHolderName: "Beatriz Gregório",
    cardNumber: "****  ****  ****  1234",
    cvv: "**4",
    expDate: "12/21",
    cardColor: kPrimaryColor,
  ),
  CardModel(
    cardHolderName: "Júlia Kimura",
    cardNumber: "****  ****  ****  4321",
    cvv: "**1",
    expDate: "01/22",
    cardColor: kSecondaryColor,
  ),
  CardModel(
    cardHolderName: "João Rodrigues",
    cardNumber: "****  ****  ****  7655",
    cvv: "**8",
    expDate: "01/23",
    cardColor: Colors.deepOrange,
  ),
];
