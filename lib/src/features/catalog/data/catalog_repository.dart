import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

import 'catalog_api.dart';
import 'models/good_card_model/good_card_data_model.dart';
import 'models/goods_list_model/goods_list_item_model.dart';

class CatalogRepository {
  final CatalogApi _catalogApi;

  CatalogRepository(
    this._catalogApi,
  );

  Future<List<GoodsListItem>> getGoodsList() async {
    final res = await _catalogApi.getGoodsList();

    if (res == null || res.statusCode == 500) {
      return [];
    } else {
      final _goodsListFromJson = await goodsListFromJson(res.data['goods']);

      final goods = _goodsListFromJson
          .map(
            (e) => GoodsListItem(
              id: e.id,
              price: e.price,
              name: e.name,
              img: e.img,
            ),
          )
          .toList();

      return goods;
    }
  }

  Future<GoodCardDataResponse> getGoodCardData(
    String kod,
    String groupId,
  ) async {
    return _catalogApi.getGoodCardData(
      kod,
      groupId,
    );
  }
}
