import 'dart:developer';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/flutter_dialogflow.dart';
import 'package:intl/intl.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:standbyme_tcc/controllers/ContaController.dart';
import 'package:standbyme_tcc/controllers/EventoController.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
import 'package:standbyme_tcc/models/Conta.dart';
import 'package:standbyme_tcc/models/Evento.dart';
import 'package:table_calendar/table_calendar.dart';

class BodyContas extends StatefulWidget {
  int userId;
  @override
  _BodyContasState createState() => _BodyContasState();

  BodyContas(this.userId);
}

enum Status { faltaPagar, jaPagou }

class _BodyContasState extends State<BodyContas> {
  TextEditingController descricaoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  DateTime dataVenc;
  TextEditingController status = TextEditingController();
  bool faltaPagar = true;
  List<dynamic> _selectedContas = [];

  void initState() {
    super.initState();
    getContasByUser(widget.userId);
  }

  void dispose() {
    super.dispose();
  }

  Widget contas() {
    return Container(
      constraints: BoxConstraints(maxHeight: double.infinity, minHeight: 100),
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: _selectedContas.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  padding: EdgeInsets.fromLTRB(15, 7, 10, 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: kPrimaryLightColor.withOpacity(0.5)),
                  child: ListTile(
                    title: Text(
                        _selectedContas[index].descricao +
                            ' - ' +
                            'R\$ ' +
                            _selectedContas[index].valor.toString(),
                        style: TextStyle(color: Color(0XFF036666))),
                    subtitle: Text(DateFormat('dd/MM/yyyy')
                        .format(_selectedContas[index].dataVenc)),
                    trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black.withOpacity(0.6),
                          size: 23,
                        ),
                        onPressed: () {
                          ContaController().deleteConta(
                              widget.userId, _selectedContas[index].id);

                          setState(() {
                            _selectedContas.removeAt(index);
                          });
                        }),
                  )),
              SizedBox(height: 10),
            ]);
          }),
    );
  }

  void salvarEsair() async {
    createConta();
    Navigator.of(context).pop(false);
  }

  void _create(BuildContext context) {
    String _name = "";

    var content = Container(
        child: Column(children: [
      TextField(
        controller: descricaoController,
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Descrição/nome da conta: ',
          labelStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
        onChanged: (value) {
          _name = value;
        },
      ),
      SizedBox(height: 20),
      TextField(
        keyboardType: TextInputType.number,
        controller: valorController,
        autofocus: true,
        decoration: InputDecoration(
          labelText: 'Valor da conta: ',
          labelStyle: TextStyle(color: kPrimaryColor, fontSize: 18),
        ),
        onChanged: (value) {
          _name = value;
        },
      ),
      SizedBox(height: 20),
      Text("Data de vencimento: ", style: TextStyle(color: kPrimaryColor)),
      IconButton(
          icon: Icon(Icons.event),
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2021),
              lastDate: DateTime(2100),
            ).then((date) => {dataVenc = date});
          }),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  faltaPagar = true;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: faltaPagar ? kPrimaryColor : Colors.transparent,
                        border: Border.all(
                            width: 1,
                            color: faltaPagar
                                ? Colors.transparent
                                : kPrimaryColor),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.add,
                      color: faltaPagar ? Colors.white : kPrimaryLightColor,
                    ),
                  ),
                  Text(
                    "Falta pagar",
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
                  faltaPagar = false;
                });
              },
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                        color: faltaPagar ? Colors.transparent : kPrimaryColor,
                        border: Border.all(
                            width: 1,
                            color: faltaPagar
                                ? kPrimaryColor
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.remove_rounded,
                      color: faltaPagar ? kPrimaryLightColor : Colors.white,
                    ),
                  ),
                  Text(
                    "Ja foi paga",
                    style: TextStyle(color: kPrimaryColor),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ]));

    var btn = FlatButton(
      child: Text('Salvar',
          style: TextStyle(
              color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold)),
      onPressed: () {
        salvarEsair();
      },
    );
    var cancelButton = FlatButton(
        child: Text('Cancelar',
            style: TextStyle(
                color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold)),
        onPressed: () => Navigator.of(context).pop(false));
    showDialog(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // To make the card compact
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text("Adicionar conta a pagar",
                      style: TextStyle(
                        color: kTextColor,
                        fontSize: 17,
                      )),
                  Container(
                      padding: EdgeInsets.all(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          child: content,
                        ),
                      )),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[cancelButton, btn]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Conta> createConta() async {
    log(descricaoController.text);
    log(valorController.text);
    log(dataVenc.toString());
    log(
      faltaPagar ? Status.faltaPagar.toString() : Status.jaPagou.toString(),
    );
    log(widget.userId.toString());
    Conta novaConta = new Conta(
        descricao: descricaoController.text,
        valor: double.parse(valorController.text),
        dataVenc: dataVenc,
        status: faltaPagar
            ? Status.faltaPagar.toString()
            : Status.jaPagou.toString(),
        userId: widget.userId);
    log(novaConta.descricao);
    setState(() {
      _selectedContas.add(novaConta);
    });

    return await new ContaController().createConta(novaConta, widget.userId);
  }

  Future<void> getContasByUser(int userId) async {
    var response = await new ContaController().findContasByUser(userId);
    for (var conta in response) {
      _selectedContas.add(conta);
    }
    log(_selectedContas.length.toString());
    for (var conta in _selectedContas) {
      log(conta.descricao);
    }
    setState(() {});
  }

  Widget contasTitle() {
    if (_selectedContas.length == 0) {
      return Container(
        padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
        child: Text("Não há contas cadastradas.",
            style: TextStyle(
                color: kPrimaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      );
    }
    return Container(
      padding: EdgeInsets.fromLTRB(30, 7, 15, 15),
      child: Text("Contas a pagar",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.only(left: 20, bottom: 20),
            child: Text(
              "Organização das contas",
              style: TextStyle(color: kPrimaryColor, fontSize: 24),
            ),
          ),
          contasTitle(),
          contas(),
          SizedBox(height: 20)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () => _create(context),
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
