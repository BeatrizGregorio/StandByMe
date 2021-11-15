import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:intl/intl.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/EventoController.dart';
import 'package:standbyme_tcc/controllers/TransacaoController.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
import 'package:standbyme_tcc/models/Transacao.dart';
import 'package:standbyme_tcc/models/Evento.dart';
import 'package:standbyme_tcc/screens/bank/add_transaction.dart';
import 'package:table_calendar/table_calendar.dart';

class BodyTransacoes extends StatefulWidget {
  int userId;
  @override
  _BodyTransacoesState createState() => _BodyTransacoesState();

  BodyTransacoes(this.userId);
}

enum Status { faltaPagar, jaPagou }

class _BodyTransacoesState extends State<BodyTransacoes> {
  List<dynamic> _selectedTransacoes = [];

  void initState() {
    super.initState();
    getTransacoesByUser(widget.userId);
  }

  void dispose() {
    super.dispose();
  }

  Widget transacao() {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 100),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _selectedTransacoes.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                height: 140,
                width: 350,
                decoration: BoxDecoration(
                  color: kSecondaryColor.withOpacity(0.5),
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
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_selectedTransacoes[index].nome,
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 22)),
                                ],
                              ),
                              SizedBox(width: 70),
                              Text(
                                  'R\$' +
                                      _selectedTransacoes[index]
                                          .valor
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18)),
                              SizedBox(width: 50),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              SizedBox(width: 34),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Data",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Text(
                                      DateFormat('dd/MM/yyyy').format(
                                          _selectedTransacoes[index].data),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              ),
                              SizedBox(width: 34),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_selectedTransacoes[index].tipo,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18)),
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 23,
                                  ),
                                  onPressed: () {
                                    TransacaoController().deleteTransaction(
                                        widget.userId,
                                        _selectedTransacoes[index].id);

                                    setState(() {
                                      _selectedTransacoes.removeAt(index);
                                    });
                                  }),
                            ],
                          ),
                        ]),
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

  Future<void> getTransacoesByUser(int userId) async {
    var response =
        await new TransacaoController().findTransactionByUser(userId);
    for (var transacao in response) {
      _selectedTransacoes.add(transacao);
    }
    log(_selectedTransacoes.length.toString());
    for (var transacao in _selectedTransacoes) {
      log(transacao.nome);
    }
    setState(() {});
  }

  Widget contasTitle() {
    if (_selectedTransacoes.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
        child: Text("Não há transações",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
      child: Text("Últimas Transações",
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
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[contasTitle(), transacao(), SizedBox(height: 20)],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryLightColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTransaction()),
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
