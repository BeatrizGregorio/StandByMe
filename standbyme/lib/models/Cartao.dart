class Cartao {
  int id;
  String nome, numero, cvv;
  DateTime dataExp;
  int userId;

  Cartao.empty();

  Cartao(
      {this.id, this.nome, this.numero, this.cvv, this.dataExp, this.userId});

  String toString() {
    return "";
  }

  factory Cartao.fromJson(Map<String, dynamic> parsedJson) {
    return Cartao(
      id: parsedJson['id'],
      nome: parsedJson['nome'],
      dataExp: DateTime.parse(parsedJson['dataExp']),
      numero: parsedJson['numero'],
      cvv: parsedJson['cvv'],
      userId: parsedJson['userId'],
    );
  }
}
