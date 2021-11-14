import 'package:standbyme_tcc/models/ContaBase.dart';

class Conta extends ContaBase {
  int id;

  Conta.empty();

  Conta({this.id, descricao, valor, dataVenc, status, userId})
      : super(
            descricao: descricao,
            valor: valor,
            dataVenc: dataVenc,
            status: status,
            userId: userId) {}

  factory Conta.fromJson(Map<String, dynamic> parsedJson) {
    ContaBase contaBase = ContaBase.fromJson(parsedJson);
    return Conta(
        id: parsedJson['id'],
        descricao: contaBase.descricao,
        valor: double.parse(contaBase.valor.toString()),
        dataVenc: contaBase.dataVenc,
        status: contaBase.status,
        userId: contaBase.userId);
  }
}
