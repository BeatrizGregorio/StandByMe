import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Conta.dart';
import 'package:standbyme_tcc/repositories/Interfaces/ContaRepositoryInterface.dart';
import 'dart:convert';

class ContaRepository implements IContaRepository {
  Client client = Client();

  @override
  Future<Conta> createConta(Conta conta, int userId) async {
    try {
      final resposta = await client.post(
          Uri.parse(
              "https://standbyme-heroku.herokuapp.com/usuarios/$userId/contas"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'descricao': conta.descricao,
            'valor': conta.valor.toString(),
            'dataVenc': conta.dataVenc.toString(),
            'status': conta.status,
            'userId': conta.userId.toString(),
          }));
      Conta novaConta = new Conta.fromJson(json.decode(resposta.body));
      return novaConta;
    } on Exception catch (e) {
      throw Exception("Falha ao adicionar conta");
    }
  }

  @override
  Future<List<Conta>> findContasByUser(int userId) async {
    List<Conta> listContas = [];
    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/contas"));
      final res = json.decode(resposta.body);
      print(res);
      for (var conta in res) {
        listContas.add(Conta.fromJson(conta));
      }
      print(listContas.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listContas;
  }

  @override
  void deleteConta(int userId, int id) async {
    try {
      final resposta = await client.delete(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/contas/$id"));
      final res = json.decode(resposta.body);
      print(res);
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Conta>> findContasByDesc(String name, int userId) async {
    List<Conta> listContas = [];
    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/contas/desc?descricao=$name"));
      final res = json.decode(resposta.body);
      print(res);
      for (var conta in res) {
        listContas.add(Conta.fromJson(conta));
      }
      print(listContas.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listContas;
  }
}
