import 'package:standbyme_tcc/models/Evento.dart';
import 'package:standbyme_tcc/repositories/EventoRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/EventoRepositoryInterface.dart';

class ProductController {
  final IProductRepository _productRepository = ProductRepository();

  Future<List<Product>> getProducts() async {
    return _productRepository.getProducts();
  }
}
