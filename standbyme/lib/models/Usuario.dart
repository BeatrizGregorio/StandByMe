import 'package:standbyme_tcc/models/UsuarioBase.dart';

class Usuario extends UsuarioBase {
  String id;

  Usuario.empty();

  Usuario({this.id, primeiroNome, sobrenome, telefone, email, senha})
      : super(
            primeiroNome: primeiroNome,
            sobrenome: sobrenome,
            telefone: telefone,
            email: email,
            senha: senha) {}

  factory Usuario.fromJson(Map<String, dynamic> parsedJson) {
    return Usuario(
        id: parsedJson['id'],
        primeiroNome: parsedJson['nomeUsuario'],
        sobrenome: parsedJson['sobrenomeUsuario'],
        telefone: parsedJson['telefone'],
        email: parsedJson['email'],
        senha: parsedJson['senha']);
  }
}
