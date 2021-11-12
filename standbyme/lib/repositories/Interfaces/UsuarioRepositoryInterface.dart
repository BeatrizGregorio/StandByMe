import 'package:standbyme_tcc/models/Evento.dart';
import 'package:standbyme_tcc/models/Usuario.dart';

abstract class IUsuarioRepository {
  Future<Usuario> cadastrarUsuario(Usuario usuario);

  Future<Usuario> logarUsuario(Usuario usuario);

  Future<List<Evento>> getEventsByDate(DateTime data, int userId);

  Future<Usuario> getUsuarioById(int userId);

  void updateUser(Usuario usuario, int userId);
}
