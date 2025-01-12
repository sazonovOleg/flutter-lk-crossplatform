import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';

class FavoritesPageState {
  final bool isLoading;
  List<FavoritesItem> favoritesItems = [];
  List<FavoritesItem> newFavoritesItems = [];

  FavoritesPageState({
    this.isLoading = true,
    this.favoritesItems = const [],
    this.newFavoritesItems = const [],
  });
}
