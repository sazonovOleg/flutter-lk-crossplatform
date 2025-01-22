import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

class GoodsPageState {
  final bool isLoading;
  final List<GoodsListItem> goodsList;
  final String emptyGoodsListMessage;

  GoodsPageState({
    this.isLoading = true,
    this.goodsList = const [],
    this.emptyGoodsListMessage = 'Список товаров пуст'
  });
}
