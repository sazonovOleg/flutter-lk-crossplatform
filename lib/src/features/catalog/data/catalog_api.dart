import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'models/good_card_model/good_card_data_model.dart';
import 'models/goods_list_model/goods_list_item_model.dart';

class CatalogApi {
  final Dio _dio;

  CatalogApi(this._dio);

  Future<List<GoodsListItemResponse>> getGoodsList() async {
    final response = await _dio.get('api/goods/');

    debugPrint('devv data = ${response.data['goods']}');

    return goodsListFromJson(response.data['goods']);
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
