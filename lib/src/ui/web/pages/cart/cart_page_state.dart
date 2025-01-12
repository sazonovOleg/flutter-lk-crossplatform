import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/shops_group_model.dart';

class CartPageState {
  bool loading;
  bool selectAll;
  bool isOrderCreated;
  String groupId;
  String totalPrice;
  List<ShoppingCartItem> scItems = [];
  List<GroupByShopsModel> groupByShopsItems = [];

  CartPageState({
    this.loading = true,
    this.selectAll = true,
    this.isOrderCreated = false,
    this.groupId = '',
    this.totalPrice = '0',
    this.scItems = const [],
    this.groupByShopsItems = const [],
  });
}
