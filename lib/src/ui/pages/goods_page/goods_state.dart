import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

class GoodsPageState {
  final bool isLoading;
  final String categoryId;
  final String groupId;
  final String searchText;
  List<GoodsListItem> goodsList;
  final String sortName;

  GoodsPageState({
    this.isLoading = true,
    this.categoryId = '',
    this.groupId = '',
    this.searchText = '',
    this.goodsList = const [],
    this.sortName = 'По наименованию',
  });
}
