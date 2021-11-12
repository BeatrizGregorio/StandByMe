import 'package:standbyme_tcc/models/Conta.dart';
import 'package:standbyme_tcc/repositories/ContaRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/ContaRepositoryInterface.dart';

class ContaController {
  final IContaRepository _contaRepository = ContaRepository();

  Future<Conta> createConta(Conta conta, int userId) async {
    return _contaRepository.createConta(conta, userId);
  }

  Future<List<Conta>> findContasByUser(int userId) async {
    return _contaRepository.findContasByUser(userId);
  }

  void deleteConta(int userId, int id) async {
    return _contaRepository.deleteConta(userId, id);
  }
}
