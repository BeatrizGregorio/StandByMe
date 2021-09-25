import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/repositories/Interfaces/UsuarioRepositoryInterface.dart';
import 'dart:convert';

class UsuarioRepository implements IUsuarioRepository {
  Client client = Client();

  @override
  Future<Usuario> cadastrarUsuario(Usuario usuario) async {
    try {
      final resposta =
          await client.post(Uri.parse("http://192.168.15.9/usuarios"),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'nomeUsuario': usuario.primeiroNome,
                'sobrenomeUsuario': usuario.sobrenome,
                'email': usuario.email,
                'senha': usuario.senha
              }));
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
