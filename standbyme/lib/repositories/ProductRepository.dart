import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/Product.dart';
import 'dart:convert';

import 'package:standbyme_tcc/repositories/Interfaces/ProductRepositoryInterface.dart';

class ProductRepository implements IProductRepository {
  Client client = Client();

  @override
  Future<List<Product>> getProducts() async {
    List<Product> listProducts = [];
    try {
      final resposta = await client
          .get(Uri.parse("https://standbyme-heroku.herokuapp.com/produtos"));
      final res = json.decode(resposta.body);
      var produto = new Product.fromJson(res[0]);
      int i = 1;
      while (produto != null) {
        listProducts.add(produto);
        produto = new Product.fromJson(res[i]);
        i++;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return listProducts;
  }
}
