import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

import 'catalog_api.dart';
import 'models/good_card_model/good_card_data_model.dart';

class CatalogRepository {
  final CatalogApi _catalogApi;

  CatalogRepository(
    this._catalogApi,
  );

  Future<List<GoodsListItem>> getGoodsList() async {
    final goodsResponse = await _catalogApi.getGoodsList();

    final goods = goodsResponse
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
