import 'package:standbyme_tcc/models/Usuario.dart';

abstract class IUsuarioRepository {
  Future<Usuario> cadastrarUsuario(Usuario usuario);
}
