class Product {
  String nomeProduto, descricaoProduto, image;

  Product.empty();

  Product(this.nomeProduto, this.descricaoProduto, this.image);

  factory Product.fromJson(Map<String, dynamic> parsedJson) {
    return Product(parsedJson['nomeProduto'], parsedJson['descricaoProduto'],
        parsedJson['foto']);
  }
}
