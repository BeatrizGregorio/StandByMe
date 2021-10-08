class ProductUsuario {
  int productId, userId, qtd;

  ProductUsuario.empty();

  ProductUsuario(this.userId, this.productId, this.qtd);

  factory ProductUsuario.fromJson(Map<String, dynamic> parsedJson) {
    return ProductUsuario(
        parsedJson['userId'], parsedJson['productId'], parsedJson['qtd']);
  }
}
