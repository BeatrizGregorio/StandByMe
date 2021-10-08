import 'package:flutter/widgets.dart';
import 'package:standbyme_tcc/models/UsuarioBase.dart';

class Usuario extends UsuarioBase {
  int id;

  Usuario.empty();

  Usuario({this.id, primeiroNome, sobrenome, telefone, email, senha})
      : super(
            primeiroNome: primeiroNome,
            sobrenome: sobrenome,
            telefone: telefone,
            email: email,
            senha: senha) {}

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    UsuarioBase usuarioBase = UsuarioBase.fromJson(parsedJson);
    return Usuario(
        id: parsedJson['id'],
        primeiroNome: usuarioBase.primeiroNome,
        sobrenome: usuarioBase.sobrenome,
        telefone: usuarioBase.telefone,
        email: usuarioBase.email,
        senha: usuarioBase.senha);
  }
}
