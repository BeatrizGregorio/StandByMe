import 'package:standbyme_tcc/models/Cartao.dart';

abstract class ICartaoRepository {
  Future<Cartao> createCard(Cartao cartao, int userId);

  Future<List<Cartao>> findCardsByUser(int userId);

  void deleteCard(int userId, int id);
}
