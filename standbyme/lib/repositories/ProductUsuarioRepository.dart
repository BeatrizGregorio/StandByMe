import 'package:http/http.dart' show Client;
import 'package:standbyme_tcc/models/ProductUsuario.dart';
import 'dart:convert';

import 'package:standbyme_tcc/repositories/Interfaces/ProductUsuarioRepositoryInterface.dart';

class ProductUsuarioRepository implements IProductUsuarioRepository {
  Client client = Client();

  @override
  Future<List<ProductUsuario>> getProductsUsuario(int userId) async {
    List<ProductUsuario> listProductsUsuario = [];

    try {
      final resposta = await client.get(Uri.parse(
          "https://standbyme-heroku.herokuapp.com/usuarios/$userId/produtos"));
      final res = json.decode(resposta.body);
      print(res);

      for (var produtoUsuario in res) {
        listProductsUsuario.add(ProductUsuario.fromJson(produtoUsuario));
      }
      print(listProductsUsuario.length);
    } on Exception catch (e) {
      print(e.toString());
    }
    return listProductsUsuario;
  }

  @override
  Future<ProductUsuario> createProductUsuario(
      ProductUsuario productUsuario) async {
    ProductUsuario novoProdutoUsuario;
    try {
      final resposta = await client.post(
          Uri.parse("https://standbyme-heroku.herokuapp.com/usuarios/produtos"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, int>{
            'userId': productUsuario.userId,
            'productId': productUsuario.productId,
            'qtd': productUsuario.qtd
          }));
      novoProdutoUsuario =
          new ProductUsuario.fromJson(json.decode(resposta.body));
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
    return novoProdutoUsuario;
  }
}
