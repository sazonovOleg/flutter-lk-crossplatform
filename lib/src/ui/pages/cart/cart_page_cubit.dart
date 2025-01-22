import 'dart:async';

import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/pages/cart/cart_page_state.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPageCubit extends Cubit<CartPageState> {
  final ShoppingCartService _cartService;
  final UserDataService _userDataService;

  CartPageCubit(
    this._cartService,
    this._userDataService,
  ) : super(CartPageState());

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : context.pushNamed(MainPageRoute.pageName);
  }

  StreamSubscription? _scStreamSubscription;

  Future<void> init() async {
    _scStreamSubscription = _cartService.shopingCart.listen((shoppingCart) async {
      emit(
        CartPageState(
          scItems: shoppingCart.items,
          loading: false,
        ),
      );
    });

    await _userDataService.initUserData();

    try {
      await _cartService.saveShoppingCart();
      await _cartService.setShoppingCart();
    } on Exception catch (e) {
      debugPrint('dev log e = $e');
    }
  }

  Future<void> initItems() async {
    await _cartService.saveShoppingCart();
    await _cartService.setShoppingCart();
    emit(
      CartPageState(
        loading: false,
        scItems: await _cartService.getItems(),
      ),
    );
  }

  Future<void> removeItem(
    int quantity,
    String kod,
  ) async {
    try {
      if (quantity <= 3) {
        await _cartService.changeItemQuantity(
          kod,
          quantity,
        );
      }
    } on Exception catch (e) {
      debugPrint('devv debug = $e');
    }
  }

  Future<void> selectItem(String kod, bool selected, bool nSelectAll) async {
    await _cartService.selectItem(kod, selected, nSelectAll);
    emit(CartPageState(selectAll: nSelectAll));
  }

  Future<void> createOrder() async {
    emit(
      CartPageState(
        loading: state.loading,
        isOrderCreated: true,
      ),
    );
  }

  @override
  Future<void> close() {
    _scStreamSubscription?.cancel();

    return super.close();
  }
}
