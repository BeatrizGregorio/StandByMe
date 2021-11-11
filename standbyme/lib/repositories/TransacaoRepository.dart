import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Transacao.dart';
import 'package:standbyme_tcc/repositories/Interfaces/TransacaoRepositoryInterface.dart';
import 'dart:convert';

class TransacaoRepository implements ITransacaoRepository {
  Client client = Client();

  @override
  Future<Transacao> createTransaction(Transacao transacao) async {
    try {
      final resposta = await client.post(
          Uri.parse(
              "https://standbyme-heroku.herokuapp.com/usuarios/transacoes"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'nome': transacao.nome,
            'valor': transacao.valor.toString(),
            'tipo': transacao.tipo,
            'userId': transacao.userId.toString(),
          }));
      Transacao novaTransacao =
          new Transacao.fromJson(json.decode(resposta.body));
      return novaTransacao;
    } on Exception catch (e) {
      throw Exception("Falha ao adicionar transação");
    }
  }

  @override
  Future<List<Transacao>> findTransactionByUser(int userId) async {
    List<Transacao> listTransaction = [];
    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/transacoes"));
      final res = json.decode(resposta.body);
      print(res);
      for (var produto in res) {
        listTransaction.add(Transacao.fromJson(produto));
      }
      print(listTransaction.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listTransaction;
  }

  @override
  void deleteTransaction(int userId, int id) async {
    try {
      final resposta = await client.delete(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/transacoes/$id"));
      final res = json.decode(resposta.body);
      print(res);
    } on Exception catch (e) {
      print(e.toString());
    }
  }
}
