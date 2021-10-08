import 'package:standbyme_tcc/models/ProdutoBase.dart';

class Product extends ProdutoBase {
  int id;

  Product.empty();

  Product({this.id, nomeProduto, descricaoProduto, image})
      : super(
            nomeProduto: nomeProduto,
            descricaoProduto: descricaoProduto,
            image: image) {}

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    ProdutoBase produtoBase = ProdutoBase.fromJson(parsedJson);
    return Product(
        id: parsedJson['id'],
        nomeProduto: produtoBase.nomeProduto,
        descricaoProduto: produtoBase.descricaoProduto,
        image: produtoBase.image);
  }
}
