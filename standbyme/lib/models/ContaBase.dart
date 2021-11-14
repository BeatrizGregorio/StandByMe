class ContaBase {
  String descricao, status;
  DateTime dataVenc;
  double valor;
  int userId;

  ContaBase.empty();

  ContaBase(
      {this.descricao, this.valor, this.dataVenc, this.status, this.userId});

  factory ContaBase.fromJson(Map<String, dynamic> parsedJson) {
    return ContaBase(
        descricao: parsedJson['descricao'],
        valor: double.parse(parsedJson['valor'].toString()),
        dataVenc: DateTime.parse(parsedJson['dataVenc']),
        status: parsedJson['status'],
        userId: parsedJson['userId']);
  }
}
