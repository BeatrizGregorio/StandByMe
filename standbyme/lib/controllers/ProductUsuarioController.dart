import 'package:standbyme_tcc/models/Product.dart';
import 'package:standbyme_tcc/models/ProductUsuario.dart';
import 'package:standbyme_tcc/repositories/Interfaces/ProductUsuarioRepositoryInterface.dart';
import 'package:standbyme_tcc/repositories/ProductUsuarioRepository.dart';

class ProductUsuarioController {
  final IProductUsuarioRepository _productUsuarioRepository =
      ProductUsuarioRepository();

  Future<List<Product>> getProductsUsuario(int userId) async {
    return _productUsuarioRepository.getProductsUsuario(userId);
  }

  Future<ProductUsuario> createProductUsuario(
      ProductUsuario productUsuario) async {
    return _productUsuarioRepository.createProductUsuario(productUsuario);
  }

  Future<List<Product>> getProductsUsuarioByName(
      String name, int userId) async {
    return _productUsuarioRepository.getProductsUsuarioByName(name, userId);
  }
}
