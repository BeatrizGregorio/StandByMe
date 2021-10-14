import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/repositories/Interfaces/UsuarioRepositoryInterface.dart';
import 'package:standbyme_tcc/models/Evento.dart';
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

  @override
  Future<List<Evento>> getEventsByDate(DateTime data, int userId) async {
    List<Evento> listEvents = [];
    var dataDateTime = new TimeOfDay.fromDateTime(data).toString();
    var idUsuario = userId.toString();
    try {
      final resposta = await client.post(
          Uri.parse(
              "https://standbyme-heroku.herokuapp.com/usuarios/:userId/eventos"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'dataEvento': dataDateTime,
            'userId': idUsuario
          }));
      final res = json.decode(resposta.body);
      print(res);
      for (var evento in res) {
        listEvents.add(Evento.fromJson(evento));
      }
      print(listEvents.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listEvents;
  }
}
