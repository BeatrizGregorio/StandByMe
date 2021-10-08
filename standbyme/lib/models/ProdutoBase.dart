class ProdutoBase {
  String nomeProduto, descricaoProduto, image;

  ProdutoBase.empty();

  ProdutoBase({this.nomeProduto, this.descricaoProduto, this.image});

  factory ProdutoBase.fromJson(Map<String, dynamic> parsedJson) {
    return ProdutoBase(
        nomeProduto: parsedJson['nomeProduto'],
        descricaoProduto: parsedJson['descricaoProduto'],
        image: parsedJson['foto']);
  }
}
