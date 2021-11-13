import 'package:standbyme_tcc/models/Product.dart';
import 'package:standbyme_tcc/models/ProductUsuario.dart';

abstract class IProductUsuarioRepository {
  Future<List<Product>> getProductsUsuario(int userId);

  Future<List<Product>> getProductsUsuarioByName(String name, int userId);

  Future<ProductUsuario> createProductUsuario(ProductUsuario productUsuario);
}
