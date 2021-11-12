import 'package:standbyme_tcc/models/Evento.dart';
import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/repositories/UsuarioRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/UsuarioRepositoryInterface.dart';

class UsuarioController {
  final IUsuarioRepository _usuarioRepository = UsuarioRepository();

  Future<Usuario> cadastrarUsuario(Usuario usuario) {
    return _usuarioRepository.cadastrarUsuario(usuario);
  }

  Future<Usuario> logarUsuario(Usuario usuario) {
    return _usuarioRepository.logarUsuario(usuario);
  }

  Future<List<Evento>> getEventsByDate(DateTime data, int userId) {
    return _usuarioRepository.getEventsByDate(data, userId);
  }

  Future<Usuario> getUsuarioById(int userId) {
    return _usuarioRepository.getUsuarioById(userId);
  }

  void updateUser(Usuario usuario, int userId) {
    return _usuarioRepository.updateUser(usuario, userId);
  }
}
