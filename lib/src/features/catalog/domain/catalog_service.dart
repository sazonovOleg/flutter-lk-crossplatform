import 'dart:async';

import 'package:b2b_client_lk/src/features/catalog/data/catalog_repository.dart';
import 'package:b2b_client_lk/src/features/catalog/data/models/filters_model/filters_model.dart';
import 'models/catalog_category_model.dart/catalog_category_model.dart';
import 'models/filters_model/filters_model.dart';
import 'models/good_card_data_model/good_card_data_model.dart';
import 'models/goods_model/goods_model.dart';

class CatalogService {
  final CatalogRepository _catalogRepository;

  CatalogService(this._catalogRepository);

  Future<List<CatalogCategory>> getCategories(
    String categoryId,
    String groupId,
  ) async {
    final categories = await _catalogRepository.getCategories(
      categoryId,
      groupId,
    );

    return categories;
  }

  Future<List<GoodsListItem>> getGoodsList(
    String categoryId,
    String searchText,
    String groupId,
    List<Filter> selectedFilters,
    List<String> excludedProducts,
    String sort,
  ) async {
    final filterResponse = selectedFilters
        .map(
          (e) => FilterItemResponse(
            name: e.name,
            kod: e.kod,
            items: e.items.map((e) => e.item).toList(),
          ),
        )
        .toList();

    final goods = await _catalogRepository.getGoodsList(
      categoryId,
      searchText,
      groupId,
      filterResponse,
      excludedProducts,
      sort,
    );

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

  Future<List<Filter>> getFilters(
    String categoryId,
    String searchText,
    List<Filter> filters,
    List<Filter> selectionsQueue,
    String groupId,
  ) async {
    final selectedFilters = <FilterItemResponse>[];

    for (final filter in filters) {
      final selectedNotEmpty = filter.items.where((e) => e.selected).isNotEmpty;

      if (selectedNotEmpty) {
        final selectedItems = filter.items.where((e) => e.selected);

        selectedFilters.add(
          FilterItemResponse(
            name: filter.name,
            kod: filter.kod,
            items: selectedItems.map((e) => e.item).toList(),
          ),
        );
      }
    }

    final filterItemsResponse = await _catalogRepository.getFilters(
      categoryId,
      searchText,
      selectedFilters,
      groupId,
    );
    var tFilterList = <Filter>[];

    if (filters.isEmpty) {
      tFilterList = filterItemsResponse
          .map(
            (e) => Filter(
              name: e.name,
              kod: e.kod,
              items: e.items.map((e) => FilterItem(item: e, selected: false)).toList(),
            ),
          )
          .toList();
    } else {
      for (final item in filterItemsResponse) {
        var tFilterItems = <FilterItem>[];

        if (selectionsQueue.isNotEmpty && selectionsQueue.last.kod == item.kod) {
          tFilterItems = selectionsQueue.firstWhere((f) => f.kod == item.kod).items;
        } else {
          if (selectedFilters.where((el) => el.kod == item.kod).isNotEmpty) {
            for (final f in item.items) {
              tFilterItems.add(
                FilterItem(
                  item: f,
                  selected:
                      selectedFilters.where((el) => el.kod == item.kod).first.items.contains(f),
                ),
              );
            }
          } else {
            tFilterItems = item.items.map((e) => FilterItem(item: e, selected: false)).toList();
          }
        }

        tFilterList.add(
          Filter(
            kod: item.kod,
            name: item.name,
            items: tFilterItems,
          ),
        );
      }
    }

    return tFilterList;
  }

  Future<List<String>> getSearchHistory() async {
    return _catalogRepository.getSearchHistory();
  }

  Future<void> saveSearchInHistory(String searchText) async {
    await _catalogRepository.saveSearchInHistory(searchText);
  }

  Future<String> getCategoryNameFromUri() async {
    final uri = Uri.base.toString();
    final categoriesList = await getCategories('', '');
    final categoryName = categoriesList.where((el) => uri.contains(el.name.toLowerCase()));

    return categoryName.isNotEmpty ? categoryName.first.name.toLowerCase() : '';
  }
}
