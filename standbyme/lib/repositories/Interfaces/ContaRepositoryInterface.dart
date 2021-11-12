import 'package:standbyme_tcc/models/Conta.dart';

abstract class IContaRepository {
  Future<Conta> createConta(Conta conta, int userId);

  Future<List<Conta>> findContasByUser(int userId);

  void deleteConta(int userId, int id);
}
