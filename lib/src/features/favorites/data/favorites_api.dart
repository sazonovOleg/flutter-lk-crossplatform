import 'package:dio/dio.dart';

import 'models/favorites_model.dart';

class FavoritesApi {
  final Dio _dio;

  FavoritesApi(this._dio);

  Future<void> addToFavorites(
    String kod,
    String groupId,
  ) async {
    await _dio.put(
      'favorites/param?kod=$kod&groupId=$groupId',
    );
  }

  Future<FavoritesResponse> getFavorites() async {
    final response = await _dio.get(
      'favorites/param?',
    );

    return favoritesFromJson(response.data);
  }
}