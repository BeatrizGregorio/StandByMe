class Transacao {
  int id;
  String nome, tipo;
  double valor;
  DateTime data;
  int userId;

  Transacao.empty();

  Transacao(
      {this.id, this.nome, this.tipo, this.valor, this.data, this.userId});

  String toString() {
    return "";
  }

  factory Transacao.fromJson(Map<String, dynamic> parsedJson) {
    return Transacao(
      id: parsedJson['id'],
      tipo: parsedJson['tipo'],
      valor: double.parse(parsedJson['valor'].toString()),
      nome: parsedJson['nome'],
      data: DateTime.parse(parsedJson['data']),
      userId: parsedJson['userId'],
    );
  }
}
