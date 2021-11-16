import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/controllers/CartaoController.dart';
import 'package:standbyme_tcc/models/Cartao.dart';
import 'package:standbyme_tcc/constants.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
  static String routeName = "/add_card_screen";
  int userId;
}

class _AddCardState extends State<AddCard> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController dataExpController = TextEditingController();
  List<dynamic> _cards = [];

  void initState() {
    super.initState();
    getId();
  }

  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.userId = preferences.getInt("id");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ADICIONAR CARTÃO",
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
                padding: EdgeInsets.only(top: 30, left: 20),
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
                              text: " Cartão",
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
            top: 105,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: 330,
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
                                "NOVO CARTÃO",
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: nomeController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
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
              keyboardType: TextInputType.number,
              controller: numeroController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.credit_card,
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
                hintText: 'Número',
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: cvvController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
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
                hintText: 'CVV',
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextField(
              controller: dataExpController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.calendar_today,
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
                hintText: 'Data de Vencimento (**/**/****)',
                hintStyle: TextStyle(fontSize: 14, color: kPrimaryColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
          ),
        ],
      ),
    );
  }

  Future<Cartao> createCard() async {
    log(widget.userId.toString());
    log(nomeController.text);
    log(numeroController.text);
    log(cvvController.text);
    log(dataExpController.text);

    if (cvvController.text.length == 3) {
      Cartao cartao = new Cartao(
          nome: nomeController.text,
          numero: numeroController.text,
          cvv: cvvController.text,
          dataExp: dataExpController.text,
          userId: widget.userId);
      setState(() {
        _cards.add(cartao);
      });
      return new CartaoController().createCard(cartao, widget.userId);
    } else {
      Fluttertoast.showToast(msg: "CVV incorreto!");
    }
  }

  void salvarEsair() async {
    createCard();
    Navigator.of(context).pop(false);
    setState(() {
      getCardsByUser(widget.userId);
    });
  }

  void getCardsByUser(int userId) async {
    var response = await new CartaoController().findCardsByUser(userId);
    for (var cartao in response) {
      _cards.add(cartao);
    }
    log(_cards.length.toString());
    for (var cartao in _cards) {
      log(cartao.nome);
    }
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
        top: 400,
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
