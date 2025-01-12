import 'dart:async';
import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/ui/web/common/error_handler.dart';
import 'package:b2b_client_lk/src/ui/web/pages/favorites/favorites_page_route.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import '../../../../../features/favorites/domain/favorites_service.dart';

class FavoritesButtonVm extends ChangeNotifier with ErrorHandler {
  final FavoritesService _favoriteService;
  final AuthService _authService;

  FavoritesButtonVm(this._favoriteService, this._authService);
  StreamSubscription? _subscription;
  StreamSubscription? _authSubscription;
  int quantity = 0;
  bool loading = true;

  Future<void> init() async {
    _authSubscription = _authService.authState.listen((_) async {
      await _favoriteService.init();
    });

    _subscription = _favoriteService.favorites.listen((favorites) async {
      loading = true;
      notifyListeners();
      quantity = favorites.quantity;
      loading = false;
      notifyListeners();
    });
  }

  void goToFavoritesPage(BuildContext context) {
    context.push(FavoritesPageRoute.route);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _authSubscription?.cancel();
    super.dispose();
  }
}
