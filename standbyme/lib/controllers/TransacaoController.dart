import 'package:standbyme_tcc/models/Transacao.dart';
import 'package:standbyme_tcc/repositories/TransacaoRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/TransacaoRepositoryInterface.dart';

class TransacaoController {
  final ITransacaoRepository _transacaoRepository = TransacaoRepository();

  Future<Transacao> createTransaction(Transacao transacao, int userId) async {
    return _transacaoRepository.createTransaction(transacao, userId);
  }

  Future<List<Transacao>> findTransactionByUser(int userId) async {
    return _transacaoRepository.findTransactionByUser(userId);
  }

  void deleteTransaction(int userId, int id) async {
    return _transacaoRepository.deleteTransaction(userId, id);
  }
}
