class Transacao {
  int id;
  String nome, tipo;
  int valor;
  int userId;

  Transacao.empty();

  Transacao({this.id, this.nome, this.tipo, this.valor, this.userId});

  String toString() {
    return "";
  }

  factory Transacao.fromJson(Map<String, dynamic> parsedJson) {
    return Transacao(
      id: parsedJson['id'],
      tipo: parsedJson['tipo'],
      valor: int.parse(parsedJson['valor']),
      nome: parsedJson['nome'],
      userId: parsedJson['userId'],
    );
  }
}
