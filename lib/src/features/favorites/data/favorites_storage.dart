import 'package:b2b_client_lk/src/features/common/hive_storage/hive_storage.dart';
import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';

const _favorites = 'favorites';

class FavoritesStorage {
  final HiveStorage _hiveStorage;

  FavoritesStorage(this._hiveStorage);

  Future<void> saveFavorites(Favorites favorites) async {
    await _hiveStorage.saveValue(_favorites, favorites);
  }

  Future<Favorites> getFavorites() async {
    return await _hiveStorage.getValue(_favorites) ?? Favorites(items: [], quantity: 0);
  }

  Future<void> clear() async {
    await _hiveStorage.clear(_favorites);
  }
}
