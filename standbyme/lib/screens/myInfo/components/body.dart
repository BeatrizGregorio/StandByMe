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
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 25),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: Text('Primeiro nome: ' + usuario.primeiroNome,
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 25),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: Text('Sobrenome: ' + usuario.sobrenome,
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 25),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: Text('Telefone: ' + usuario.telefone,
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 25),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: Text('Email: ' + usuario.email,
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
                        padding: EdgeInsets.fromLTRB(30, 25, 0, 25),
                        decoration: BoxDecoration(
                            color: kPrimaryLightColor.withOpacity(0.1)),
                        child: Text('Senha: ',
                            style: TextStyle(
                              fontSize: 18,
                              color: kPrimaryColor,
                            )),
                      ),
                    ],
                  ));
            }));
  }
}
