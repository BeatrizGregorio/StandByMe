import 'package:standbyme_tcc/models/Usuario.dart';
import 'package:standbyme_tcc/repositories/UsuarioRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/UsuarioRepositoryInterface.dart';

class UsuarioController {
  final IUsuarioRepository _usuarioRepository = UsuarioRepository();

  Future<Usuario> cadastrarUsuario(Usuario usuario) {
    return _usuarioRepository.cadastrarUsuario(usuario);
  }
}
