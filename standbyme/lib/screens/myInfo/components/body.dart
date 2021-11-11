import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:standbyme_tcc/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/controllers/UsuarioController.dart';
//import 'package:standbyme_tcc/screens/profile/components/profile_pic.dart';

// ignore: must_be_immutable
class Body extends StatefulWidget {
  int userId;
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void initState() {
    getId();
    super.initState();
  }

  void getId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      widget.userId = preferences.getInt("id");
    });
    log(widget.userId.toString());
  }

  Future<Usuario> getUsuarioById(int userId) async {
    return new UsuarioController().getUsuarioById(userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getUsuarioById(widget.userId),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        valueColor: new AlwaysStoppedAnimation(kPrimaryColor),
                      )),
                );

              var data = snapshot.data;
              Usuario usuario = data;
              return Container(
                  constraints: BoxConstraints(
                      maxHeight: double.infinity, minHeight: 100),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: 'Primeiro nome: ' + usuario.primeiroNome,
                            hintStyle:
                                TextStyle(fontSize: 17, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: 'Sobrenome: ' + usuario.sobrenome,
                            hintStyle:
                                TextStyle(fontSize: 17, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: 'Telefone: ' + usuario.telefone,
                            hintStyle:
                                TextStyle(fontSize: 17, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: 'Email: ' + usuario.email,
                            hintStyle:
                                TextStyle(fontSize: 17, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                            ),
                            hintText: 'Senha: ' + usuario.senha,
                            hintStyle:
                                TextStyle(fontSize: 17, color: kPrimaryColor),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(175, 20, 0, 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kSecondaryColor.withOpacity(0.3)),
                        child: Column(children: <Widget>[
                          TextButton(
                            child: Text(
                              "Salvar",
                              style:
                                  TextStyle(fontSize: 18, color: kPrimaryColor),
                            ),
                            onPressed: () {},
                          ),
                          TextButton(
                            child: Text(
                              "Cancelar",
                              style:
                                  TextStyle(fontSize: 17, color: kPrimaryColor),
                            ),
                            onPressed: () {},
                          ),
                        ]),
                      )
                    ],
                  ));
            }));
  }
}
