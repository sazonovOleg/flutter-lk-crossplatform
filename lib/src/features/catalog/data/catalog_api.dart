import 'package:dio/dio.dart';
import 'models/catgories_model/categories_model.dart';
import 'models/filters_model/filters_model.dart';
import 'models/good_card_model/good_card_data_model.dart';
import 'models/goods_list_model/goods_list_item_model.dart';

class CatalogApi {
  final Dio _dio;

  CatalogApi(this._dio);

  Future<List<CatalogCategoryResponse>> getCategories(
    String categoryId,
    String groupId,
  ) async {
    final response = await _dio.get(
      'categories/param?&categoryId=$categoryId&groupId=$groupId',
    );

    return categoriesFromJson(response.data);
  }

  Future<List<GoodsListItemResponse>> getGoodsList(
    String categoryId,
    String searchText,
    String groupId,
    List<FilterItemResponse> selectedFilters,
    List<String> excludedProducts,
    String sort,
  ) async {
    final data = {
      'filters':
          selectedFilters.isNotEmpty ? filtersListToJson(selectedFilters) : [],
      'excludedProducts': excludedProducts,
      'sort': sort,
    };
    final response = await _dio.post(
      'goods/param?categoryId=$categoryId&searchText=$searchText&groupId=$groupId&goods',
      data: data,
    );

    return goodsListFromJson(response.data);
  }

  Future<GoodCardDataResponse> getGoodCardData(
    String kod,
    String groupId,
  ) async {
    final response = await _dio.get(
      'good_card/param?kod=$kod&groupId=$groupId',
    );

    return goodCardDataFromJson(response.data).first;
  }

  Future<List<FilterItemResponse>> getFilters(
    String categoryId,
    String searchText,
    List<FilterItemResponse> selectedFilters,
    String groupId,
  ) async {
    final response = await _dio.post(
      'filters/param?categoryId=$categoryId&searchText=$searchText&groupId=$groupId',
      data: filtersListToJson(selectedFilters),
    );

    return filtersListFromJson(response.data);
  }

  Future<List<String>> getSearchHistory() async {
    final response = await _dio.get('catalog/param?searchHistory');
    var searchResults = <String>[];
    if (response.data.isNotEmpty) {
      searchResults = response.data.cast<String>();
    }

    return searchResults;
  }

  Future<void> saveSearchInHistory(String searchText) async {
    await _dio.put('catalog/param?searchText=$searchText');
  }
}
