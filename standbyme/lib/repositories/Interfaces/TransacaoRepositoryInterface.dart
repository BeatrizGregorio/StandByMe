import 'package:standbyme_tcc/models/Transacao.dart';

abstract class ITransacaoRepository {
  Future<Transacao> createTransaction(Transacao transacao, int userId);

  Future<List<Transacao>> findTransactionByUser(int userId);

  void deleteTransaction(int userId, int id);
}
