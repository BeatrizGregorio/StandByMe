import 'package:standbyme_tcc/models/ProductUsuario.dart';

abstract class IProductUsuarioRepository {
  Future<List<ProductUsuario>> getProductsUsuario(int userId);

  Future<ProductUsuario> createProductUsuario(ProductUsuario productUsuario);
}
