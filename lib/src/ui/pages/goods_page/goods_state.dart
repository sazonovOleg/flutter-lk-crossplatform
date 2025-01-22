import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

class GoodsPageState {
  final bool isLoading;
  List<GoodsListItem> goodsList;
  final String sortName;

  GoodsPageState({
    this.isLoading = true,
    this.goodsList = const [],
    this.sortName = 'По наименованию',
  });
}
