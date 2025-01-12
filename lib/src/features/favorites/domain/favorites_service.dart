import 'dart:async';
import 'package:b2b_client_lk/src/features/favorites/data/favorites_repository.dart';
import 'package:rxdart/rxdart.dart';
import 'models/favorites_model.dart';

class FavoritesService {
  final FavoritesRepository _favoritesRepository;

  FavoritesService(
    this._favoritesRepository,
  );

  final _favorites = BehaviorSubject<Favorites>.seeded(
    Favorites(
      items: <FavoritesItem>[],
      quantity: 0,
    ),
  );

  Stream<Favorites> get favorites => _favorites.stream;

  Future<void> init() async {
    final favorites = await _favoritesRepository.getFavorites();

    await _favoritesRepository.saveFavorites(
      favorites,
    );
    _favorites.value = favorites;
  }

  Future<bool> isFavorites(String kod) async {
    final favorites = await _favoritesRepository.getFavoritesFromStorage();

    return favorites.items.where((e) => e.kod == kod).isNotEmpty;
  }

  Future<void> change(String kod, String groupId) async {
    await _favoritesRepository.changeFavorites(
      kod,
      groupId,
    );
    await init();
  }

  Future<int> getTotalQuantity() async {
    final favorites = await _favoritesRepository.getFavoritesFromStorage();

    return favorites.quantity;
  }

  void dispose() {
    _favorites.close();
  }
}
