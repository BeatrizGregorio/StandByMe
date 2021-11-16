import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/CartaoController.dart';
import 'package:standbyme_tcc/screens/bank/add_card.dart';

class BodyCartoes extends StatefulWidget {
  int userId;
  @override
  _BodyCartoesState createState() => _BodyCartoesState();

  BodyCartoes(this.userId);
}

enum Status { faltaPagar, jaPagou }

class _BodyCartoesState extends State<BodyCartoes> {
  List<dynamic> _selectedCartoes = [];

  void initState() {
    super.initState();
    getCartoesByUser(widget.userId);
  }

  void dispose() {
    super.dispose();
  }

  Widget cartoes() {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 100),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _selectedCartoes.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("NOME",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15)),
                            Text(_selectedCartoes[index].nome.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20)),
                          ],
                        ),
                        Text(_selectedCartoes[index].numero,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22)),
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("VENC.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                                Text(_selectedCartoes[index].dataExp,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20)),
                              ],
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("CVV",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15)),
                                Text(_selectedCartoes[index].cvv,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20)),
                              ],
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Container(
                                width: 50,
                                height: 50,
                                child: Icon(
                                  Icons.credit_card,
                                  size: 50,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
            ]);
          }),
    );
  }

  void salvarEsair() async {
    Navigator.of(context).pop(false);
  }

  Future<void> getCartoesByUser(int userId) async {
    var response = await new CartaoController().findCardsByUser(userId);
    for (var cartao in response) {
      _selectedCartoes.add(cartao);
    }
    log(_selectedCartoes.length.toString());
    for (var cartao in _selectedCartoes) {
      log(cartao.nome);
    }
    setState(() {});
  }

  Widget contasTitle() {
    if (_selectedCartoes.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
        child: Text("Não há cartões cadastrados.",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
      child: Text("CARTÕES CADASTRADOS",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Cartões",
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
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[contasTitle(), cartoes(), SizedBox(height: 20)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddCard()),
          );
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
