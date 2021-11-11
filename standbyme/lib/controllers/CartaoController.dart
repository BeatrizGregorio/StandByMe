import 'package:standbyme_tcc/models/Cartao.dart';
import 'package:standbyme_tcc/repositories/CartaoRepository.dart';
import 'package:standbyme_tcc/repositories/Interfaces/CartaoRepositoryInterface.dart';

class CartaoController {
  final ICartaoRepository _cartaoRepository = CartaoRepository();

  Future<Cartao> createCard(Cartao cartao) async {
    return _cartaoRepository.createCard(cartao);
  }

  Future<List<Cartao>> findCardsByUser(int userId) async {
    return _cartaoRepository.findCardsByUser(userId);
  }

  void deleteCard(int userId, int id) async {
    return _cartaoRepository.deleteCard(userId, id);
  }
}
