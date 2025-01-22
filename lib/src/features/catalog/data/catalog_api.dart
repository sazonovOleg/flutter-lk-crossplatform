import 'package:dio/dio.dart';

import 'models/good_card_model/good_card_data_model.dart';
import 'models/goods_list_model/goods_list_item_model.dart';

class CatalogApi {
  final Dio _dio;

  CatalogApi(this._dio);

  Future<Response?> getGoodsList() async {
    try {
      final res = await _dio.get('api/goods/');

      return res;
    } on DioException catch (e, s) {
      print('DioException error ===== ${e.error}');
      print('DioException stackTrace ===== ${s}');
      print('DioException data ===== ${e.response?.data}');

      return e.response;
    } on Exception catch (e) {
      print('Error ===== ${e}');

      return null;
    }
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
}
