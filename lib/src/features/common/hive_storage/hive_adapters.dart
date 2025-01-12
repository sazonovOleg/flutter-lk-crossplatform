import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';
import 'package:b2b_client_lk/src/features/user_data/data/models/user_data_response_model.dart';
import 'package:hive_flutter/adapters.dart';

class RegisterHive {
  void registerHiveAdapters() {
    Hive
    ..registerAdapter(UserDataResponseAdapter())
    ..registerAdapter(FavoritesAdapter())
    ..registerAdapter(FavoritesItemAdapter())
    ..registerAdapter(ShoppingCartAdapter())
    ..registerAdapter(ShoppingCartItemAdapter());
  }
}
