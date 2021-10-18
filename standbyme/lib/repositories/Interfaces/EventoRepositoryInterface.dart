import 'package:standbyme_tcc/models/Evento.dart';

abstract class IEventoRepository {
  Future<Evento> createEvent(Evento evento);

  Future<List<Evento>> findEventsByUser();

  void deleteEvent(int userId, int id);
}
