class Conta {
  int id;
  String descricao, status;
  DateTime dataVenc;
  double valor;
  int userId;

  Conta.empty();

  Conta(
      {this.id,
      this.descricao,
      this.valor,
      this.dataVenc,
      this.status,
      this.userId});

  String toString() {
    return "";
  }

  factory Conta.fromJson(Map<String, dynamic> parsedJson) {
    return Conta(
      id: parsedJson['id'],
      descricao: parsedJson['descricao'],
      valor: parsedJson['valor'],
      dataVenc: DateTime.parse(parsedJson['dataVenc']),
      status: parsedJson['status'],
      userId: parsedJson['userId'],
    );
  }
}
