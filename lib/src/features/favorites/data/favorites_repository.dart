import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';

import 'favorites_api.dart';
import 'favorites_storage.dart';
import 'models/favorites_model.dart';

class FavoritesRepository {
  final FavoritesApi _favoritesApi;
  final FavoritesStorage _favoritesStorage;

  FavoritesRepository(
    this._favoritesApi,
    this._favoritesStorage,
  );

  Future<FavoritesResponse> getFavoritesRespsonse() async {
    final favoritesResponse = await _favoritesApi.getFavorites();

    return favoritesResponse;
  }

  Future<Favorites> getFavorites() async {
    final favoritesResponse = await getFavoritesRespsonse();

    final favorites = Favorites(
      items: favoritesResponse.items
          .map(
            (e) => FavoritesItem(
              price: e.price,
              name: e.name,
              kod: e.kod,
              image: e.image,
            ),
          )
          .toList(),
      quantity: favoritesResponse.quantity,
    );

    return favorites;
  }

  Future<void> saveFavorites(Favorites favorites) async {
    await _favoritesStorage.saveFavorites(favorites);
  }

  Future<Favorites> getFavoritesFromStorage() async {
    return _favoritesStorage.getFavorites();
  }

  Future<void> changeFavorites(
    String kod,
  ) async {
    await _favoritesApi.addToFavorites(kod);
  }

  Future<void> clear() async {
    await _favoritesStorage.clear();
  }
}
