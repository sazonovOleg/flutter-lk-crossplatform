import 'dart:async';

import 'package:b2b_client_lk/src/features/catalog/data/catalog_repository.dart';

import 'models/good_card_data_model/good_card_data_model.dart';
import 'models/goods_model/goods_model.dart';

class CatalogService {
  final CatalogRepository _catalogRepository;

  CatalogService(this._catalogRepository);

  Future<List<GoodsListItem>> getGoodsList() async {
    final goods = await _catalogRepository.getGoodsList();

    return goods;
  }

  Future<GoodCardData> getGoodCardData(String kod, String groupId) async {
    final responseData = await _catalogRepository.getGoodCardData(
      kod,
      groupId,
    );

    if (responseData.name.isNotEmpty) {
      final warehouses = responseData.warehouses
          .map(
            (e) => Warehouse(
              name: e.name,
              kod: e.kod,
              quantity: e.quantity.toInt(),
              address: e.address,
            ),
          )
          .toList();

      final characteristics = responseData.characteristics
          .map((e) => GoodCharacteristic(name: e.name, value: e.value))
          .toList();

      final data = GoodCardData(
        warehouses: warehouses,
        characteristics: characteristics,
        images: responseData.images,
        art: responseData.art,
        description: responseData.description,
        name: responseData.name,
        ownerId: responseData.ownerId,
        mainImage: responseData.mainImage,
        price: responseData.price.toString(),
      );

      return data;
    } else {
      return GoodCardData.empty();
    }
  }
}
