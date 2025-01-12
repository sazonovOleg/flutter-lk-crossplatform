import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';

class GroupByShopsModel {
  final String tittle;
  final String ownerId;
  final List<ShoppingCartItem> items;

  GroupByShopsModel({
    required this.tittle,
    required this.ownerId,
    required this.items,
  });
}
