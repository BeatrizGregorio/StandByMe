import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/repositories/Interfaces/UsuarioRepositoryInterface.dart';
import 'dart:convert';

class UsuarioRepository implements IUsuarioRepository {
  Client client = Client();

  @override
  Future<Usuario> cadastrarUsuario(Usuario usuario) async {
    try {
      final resposta = await client.post(
          Uri.parse("https://standbyme-heroku.herokuapp.com/usuarios"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'nomeUsuario': usuario.primeiroNome,
            'sobrenomeUsuario': usuario.sobrenome,
            'telefone': usuario.telefone,
            'email': usuario.email,
            'senha': usuario.senha
          }));
      Usuario novoUsuario = new Usuario.fromJson(json.decode(resposta.body));
      return novoUsuario;
    } on Exception catch (e) {
      throw Exception("Falha no cadastro");
    }
  }

  @override
  Future<Usuario> logarUsuario(Usuario usuario) async {
    try {
      final resposta = await client.post(
          Uri.parse("https://standbyme-heroku.herokuapp.com/usuarios/login"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': usuario.email,
            'senha': usuario.senha
          }));
      Usuario novoUsuario = new Usuario.fromJson(json.decode(resposta.body));
      return novoUsuario;
    } on Exception catch (e) {
      throw Exception("Falha no login");
    }
  }
}
