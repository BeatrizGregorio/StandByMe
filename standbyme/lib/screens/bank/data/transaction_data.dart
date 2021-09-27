import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String avatar;
  String currentBalance;
  String month;
  String changePercentageIndicator;
  String changePercentage;
  Color color;

  TransactionModel({
    this.avatar,
    this.changePercentage,
    this.changePercentageIndicator,
    this.currentBalance,
    this.month,
    this.name,
    this.color,
  });
}

List<TransactionModel> myTransactions = [
  TransactionModel(
    avatar: "assets/images/avatar1.png",
    currentBalance: "\$34,90",
    changePercentage: "687,97",
    changePercentageIndicator: "down",
    month: "27 set",
    name: "Padaria Primavera",
    color: Colors.green[100],
  ),
  TransactionModel(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "\$354",
    changePercentageIndicator: "down",
    changePercentage: "333,97",
    month: "15 set",
    name: "Farm Rio",
    color: Colors.orange[100],
  ),
  TransactionModel(
    avatar: "assets/icons/avatar3.png",
    currentBalance: "\$234,45",
    changePercentage: "99,52",
    changePercentageIndicator: "down",
    month: "02 set",
    name: "SANASA",
    color: Colors.red[100],
  ),
  TransactionModel(
    avatar: "assets/icons/avatar4.png",
    currentBalance: "\$5052",
    changePercentageIndicator: "up",
    changePercentage: "656",
    month: "02 set",
    name: "Dalben",
    color: Colors.deepPurple[100],
  ),
  TransactionModel(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "\$900",
    changePercentage: "2300",
    changePercentageIndicator: "up",
    month: "28 ago",
    name: "Salário",
    color: Colors.green[100],
  ),
];
