import 'dart:async';

import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/ui/web/common/error_handler.dart';
import 'package:flutter/foundation.dart';

class AddToFavoritesButtonVm extends ChangeNotifier with ErrorHandler {
  final FavoritesService _favoriteService;

  AddToFavoritesButtonVm(this._favoriteService);

  bool loading = false;
  bool favorite = false;
  StreamSubscription? streamSubscription;

  Future<void> init(String kod) async {
    streamSubscription = _favoriteService.favorites.listen((_) async {
      try {
        favorite = await _favoriteService.isFavorites(kod);
        notifyListeners();
      } on Exception catch (e) {
        handleError(e);
      }
    });

    try {
      favorite = await _favoriteService.isFavorites(kod);
      notifyListeners();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> changeFavorites(String kod, String groupId) async {
    loading = true;
    notifyListeners();
    try {
      await _favoriteService.change(kod, groupId);
    } on Exception catch (e) {
      handleError(e);
    }
    loading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
