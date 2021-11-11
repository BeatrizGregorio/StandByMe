import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/components/default_button.dart';
import 'package:standbyme_tcc/controllers/TransacaoController.dart';
import 'package:standbyme_tcc/models/Transacao.dart';
import 'package:standbyme_tcc/screens/bank/widgets/transaction_card.dart';
import 'package:standbyme_tcc/screens/sign_in/sign_in_screen.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/size_config.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
  static String routeName = "/add_transaction_screen";
  int userId;
}

enum TipoTransacao { adicionar, retirar }

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  List<dynamic> _transactions = [];
  bool isAdicionar = true;

  void initState() {
    super.initState();
    getTransactionByUser(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ADICIONAR TRANSAÇÃO",
          style: TextStyle(
            fontFamily: "Poppins",
            color: kPrimaryColor,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 300,
              child: Container(
                padding: EdgeInsets.only(top: 50, left: 20),
                color: kPrimaryColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Adicionar",
                          style: TextStyle(
                            fontSize: 25,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: " Transação",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Preencha os campos:",
                      style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          buildBottomHalfContainer(true),

          AnimatedPositioned(
            duration: Duration(milliseconds: 700),
            curve: Curves.bounceInOut,
            top: 130,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 270,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Column(
                            children: [
                              Text(
                                "NOVA TRANSAÇÃO",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                height: 2,
                                width: 55,
                                color: kPrimaryColor,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    buildSignupSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          // Bottom buttons
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.push_pin_outlined,
                  color: kPrimaryLightColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                contentPadding: EdgeInsets.all(10),
                hintText: 'Nome',
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: valorController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.money,
                  color: kPrimaryLightColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: kPrimaryColor),
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                contentPadding: EdgeInsets.all(10),
                hintText: 'Valor',
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAdicionar = true;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isAdicionar
                                ? kPrimaryColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: isAdicionar
                                    ? Colors.transparent
                                    : kPrimaryColor),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.add,
                          color:
                              isAdicionar ? Colors.white : kPrimaryLightColor,
                        ),
                      ),
                      Text(
                        "ADICIONAR",
                        style: TextStyle(color: kPrimaryColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isAdicionar = false;
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: isAdicionar
                                ? Colors.transparent
                                : kPrimaryColor,
                            border: Border.all(
                                width: 1,
                                color: isAdicionar
                                    ? kPrimaryColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          Icons.remove_rounded,
                          color:
                              isAdicionar ? kPrimaryLightColor : Colors.white,
                        ),
                      ),
                      Text(
                        "RETIRAR",
                        style: TextStyle(color: kPrimaryColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  Future<Transacao> createTransaction() async {
    log(widget.userId.toString());
    Transacao transacao = new Transacao(
        nome: nomeController.text,
        tipo: TipoTransacao.values.toString(),
        valor: 1, //achar um jeito melhor
        userId: widget.userId);
    setState(() {
      _transactions.add(transacao);
    });
    return new TransacaoController().createTransaction(transacao);
  }

  void salvarEsair() async {
    createTransaction();
    Navigator.of(context).pop(false);
  }

  void getTransactionByUser(int userId) async {
    var response =
        await (new TransacaoController().findTransactionByUser(userId));
    setState(() {});
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          side: BorderSide(width: 1, color: Colors.grey),
          minimumSize: Size(145, 40),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: 355,
        right: 0,
        left: 0,
        child: Center(
          child: Container(
            height: 90,
            width: 90,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  if (showShadow)
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      spreadRadius: 1.5,
                      blurRadius: 10,
                    )
                ]),
            child: GestureDetector(
              onTap: salvarEsair,
              child: !showShadow
                  ? Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                kPrimaryLightColor.withOpacity(0.1),
                                kPrimaryColor
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 1))
                          ]),
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    )
                  : Center(),
            ),
          ),
        ));
  }
}
