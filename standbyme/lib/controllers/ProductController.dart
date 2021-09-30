import 'package:standbyme_tcc/models/Product.dart';
import 'package:standbyme_tcc/repositories/ProductRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/ProductRepositoryInterface.dart';

class ProductController {
  final IProductRepository _productRepository = ProductRepository();

  Future<List<Product>> getProducts() async {
    return _productRepository.getProducts();
  }
}
