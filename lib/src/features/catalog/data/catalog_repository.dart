import 'package:b2b_client_lk/src/features/catalog/domain/models/catalog_category_model.dart/catalog_category_model.dart';
import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';

import 'catalog_api.dart';
import 'models/filters_model/filters_model.dart';
import 'models/good_card_model/good_card_data_model.dart';

class CatalogRepository {
  final CatalogApi _catalogApi;

  CatalogRepository(
    this._catalogApi,
  );

  Future<List<CatalogCategory>> getCategories(
    String categoryId,
    String groupId,
  ) async {
    final categoriesResponse = await _catalogApi.getCategories(
      categoryId,
      groupId,
    );

    final categories = categoriesResponse
        .map(
          (e) => CatalogCategory(
            name: e.name,
            id: e.id,
            goodsQuantity: e.goodsQuantity,
            subcategoriesQuantity: e.subcategoriesQuantity,
          ),
        )
        .toList();

    return categories;
  }

  Future<List<GoodsListItem>> getGoodsList(
    String categoryId,
    String searchText,
    String groupId,
    List<FilterItemResponse> selectedFilters,
    List<String> excludedProducts,
    String sort,
  ) async {
    final goodsResponse = await _catalogApi.getGoodsList(
      categoryId,
      searchText,
      groupId,
      selectedFilters,
      excludedProducts,
      sort,
    );

    final goods = goodsResponse
        .map(
          (e) => GoodsListItem(
            priceName: e.priceName,
            price: e.price,
            name: e.name,
            art: e.art,
            kod: e.kod,
            remnant: e.remnant,
            image: e.image,
            ownerId: e.ownerId,
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

  Future<List<FilterItemResponse>> getFilters(
    String categoryId,
    String searchText,
    List<FilterItemResponse> selectedFilters,
    String groupId,
  ) async {
    return _catalogApi.getFilters(
      categoryId,
      searchText,
      selectedFilters,
      groupId,
    );
  }

  Future<List<String>> getSearchHistory() async {
    return _catalogApi.getSearchHistory();
  }

  Future<void> saveSearchInHistory(String searchText) async {
    await _catalogApi.saveSearchInHistory(searchText);
  }
}
