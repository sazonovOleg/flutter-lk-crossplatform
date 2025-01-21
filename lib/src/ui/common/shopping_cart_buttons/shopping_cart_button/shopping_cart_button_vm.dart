import 'dart:async';

import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/ui/common/error_handler.dart';
import 'package:b2b_client_lk/src/ui/pages/cart/cart_page_route.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ShoppingCartButtonVm extends ChangeNotifier with ErrorHandler {
  final ShoppingCartService _scService;
  final AuthService _authService;

  ShoppingCartButtonVm(
    this._scService,
    this._authService,
  );

  StreamSubscription? _subscription;
  int quantity = 0;
  bool loading = true;

  StreamSubscription? authStreamSubscription;

  Future<void> init() async {
    _subscription = _scService.shopingCart.listen((shoppingCart) async {
      try {
        loading = true;
        notifyListeners();
        await _getScQuantity();
      } on Exception catch (e) {
        handleError(e);
      }
    });

    authStreamSubscription = _authService.authState.listen((_) async {
      try {
        await _scService.saveShoppingCart();
        await _scService.setShoppingCart();
        notifyListeners();
      } on Exception catch (e) {
        handleError(e);
      }
    });

    try {
      await _scService.saveShoppingCart();
      await _scService.setShoppingCart();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> _getScQuantity() async {
    try {
      quantity = await _scService.getTotalQuantity();
      loading = false;
      notifyListeners();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> goToShoppingCart(BuildContext context) async {
    await context.pushNamed(CartPageRoute.pageName);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    authStreamSubscription?.cancel();

    super.dispose();
  }
}
