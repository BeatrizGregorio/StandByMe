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
  TextEditingController _contaController = TextEditingController();
  String textSearched = "";
  bool faltaPagar = true;
  List<dynamic> _selectedContas = [];

  void initState() {
    super.initState();
    getContasByUser(widget.userId);
  }

  void dispose() {
    super.dispose();
  }

  bool verificar(String faltaPagarIndex) {
    if (faltaPagar == true)
      return true;
    else
      return false;
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
                                  Text(_selectedContas[index].descricao,
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 22)),
                                ],
                              ),
                              SizedBox(width: 70),
                              Text(
                                  'R\$' +
                                      _selectedContas[index].valor.toString(),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Data Venc.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),
                                  ),
                                  Text(
                                      DateFormat('dd/MM/yyyy').format(
                                          _selectedContas[index].dataVenc),
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
                                  Text(_selectedContas[index].status,
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
                                    color: Color(0XFF9d0208),
                                    size: 23,
                                  ),
                                  onPressed: () {
                                    ContaController().deleteConta(widget.userId,
                                        _selectedContas[index].id);

                                    setState(() {
                                      _selectedContas.removeAt(index);
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
        status: faltaPagar ? "Falta pagar" : "Ja pagou",
        userId: widget.userId);
    log(novaConta.descricao);
    setState(() {
      _selectedContas.add(novaConta);
    });

    return await new ContaController().createConta(novaConta, widget.userId);
  }

  Future<void> getContasByUser(int userId) async {
    var response;
    print(textSearched);
    if (textSearched.isEmpty) {
      _selectedContas.clear();
      response = await new ContaController().findContasByUser(userId);
      for (var conta in response) {
        _selectedContas.add(conta);
      }
    } else {
      response = await new ContaController()
          .findContasByDesc(_contaController.text, userId);

      _selectedContas.clear();
      log("SelectedContas " + _selectedContas.length.toString());
      log("Response " + response.length.toString());
      for (var conta in response) {
        log(conta.descricao);
        _selectedContas.add(conta);
      }
    }
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
      child: Text("Contas",
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
          Container(
            margin: EdgeInsets.fromLTRB(20, 5, 20, 15),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.withOpacity(0.15),
            ),
            child: TextField(
              onChanged: (text) {
                setState(() {
                  textSearched = text;
                });
              },
              controller: _contaController,
              cursorColor: kPrimaryColor,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 5.0),
                  ),
                  fillColor: Colors.transparent,
                  hintText: 'Pesquisar...',
                  contentPadding: EdgeInsets.only(left: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      getContasByUser(widget.userId);
                    },
                    icon: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                    ),
                  )),
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
