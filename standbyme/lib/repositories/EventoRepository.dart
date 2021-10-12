import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Evento.dart';
import 'package:standbyme_tcc/repositories/Interfaces/EventoRepositoryInterface.dart';
import 'dart:convert';

class EventoRepository implements IEventoRepository {
  Client client = Client();

  @override
  Future<Evento> createEvent(Evento evento) async {
    try {
      final resposta = await client.post(
          Uri.parse("https://standbyme-heroku.herokuapp.com/usuarios/eventos"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'descricaoEvento': evento.descricaoEvento,
            'dataEvento': evento.dataEvento.toString(),
            'horarioEvento': evento.horarioEvento,
            'userId': evento.userId.toString(),
          }));
      Evento novoEvento = new Evento.fromJson(json.decode(resposta.body));
      return novoEvento;
    } on Exception catch (e) {
      throw Exception("Falha ao adicionar evento");
    }
  }

  @override
  Future<List<Evento>> findEventsByUser() async {
    List<Evento> listEvents = [];
    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/:userId/eventos"));
      final res = json.decode(resposta.body);
      print(res);
      for (var produto in res) {
        listEvents.add(Evento.fromJson(produto));
      }
      print(listEvents.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listEvents;
  }
}
