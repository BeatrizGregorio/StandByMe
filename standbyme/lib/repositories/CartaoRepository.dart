import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Cartao.dart';
import 'package:standbyme_tcc/repositories/Interfaces/CartaoRepositoryInterface.dart';
import 'dart:convert';

class CartaoRepository implements ICartaoRepository {
  Client client = Client();

  @override
  Future<Cartao> createCard(Cartao cartao) async {
    try {
      final resposta = await client.post(
          Uri.parse("https://standbyme-heroku.herokuapp.com/usuarios/cartoes"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'nome': cartao.nome,
            'numero': cartao.numero,
            'cvv': cartao.cvv,
            'dataExp': cartao.dataExp.toString(),
            'userId': cartao.userId.toString(),
          }));
      Cartao novoCartao = new Cartao.fromJson(json.decode(resposta.body));
      return novoCartao;
    } on Exception catch (e) {
      throw Exception("Falha ao adicionar cartão");
    }
  }

  @override
  Future<List<Cartao>> findCardsByUser(int userId) async {
    List<Cartao> listEvents = [];
    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/cartoes"));
      final res = json.decode(resposta.body);
      print(res);
      for (var produto in res) {
        listEvents.add(Cartao.fromJson(produto));
      }
      print(listEvents.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listEvents;
  }

  @override
  void deleteCard(int userId, int id) async {
    try {
      final resposta = await client.delete(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/cartoes/$id"));
      final res = json.decode(resposta.body);
      print(res);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
