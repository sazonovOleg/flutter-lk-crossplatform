import 'dart:async';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/ui/common/error_handler.dart';
import 'package:flutter/cupertino.dart';

class AddToShoppingCartButtonVm extends ChangeNotifier with ErrorHandler {
  final ShoppingCartService _scService;

  AddToShoppingCartButtonVm(
    this._scService,
  );

  StreamSubscription? streamSubscription;
  int itemQuantity = 0;
  int changeItemQuantity = 0;

  bool loading = true;
  bool byArticle = false;
  bool itemInShopingCart = false;

  String warehouseId = '';

  TextEditingController textEditingController = TextEditingController();

  Future<void> init(
    String kod,
  ) async {
    streamSubscription = _scService.shopingCart.listen((_) {
      try {
        _initQuantity(kod);
      } on Exception catch (e) {
        handleError(e);
      }
    });

    try {
      textEditingController.text = itemQuantity.toString();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> changeQuantity(
    int quantity,
    String kod,
  ) async {
    try {
      loading = true;
      notifyListeners();
      if (quantity.toString().length <= 3) {
        await _scService.changeItemQuantity(
          kod,
          quantity,
        );
      }
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> changeQuantityTimer(
    int quantity,
    String kod,
  ) async {
    try {
      if (itemQuantity != quantity) {
        Timer(
          const Duration(seconds: 1),
          () async {
            if (changeItemQuantity != quantity) {
              loading = true;
              notifyListeners();
              if (quantity.toString().length <= 3) {
                await _scService.changeItemQuantity(
                  kod,
                  quantity,
                );
              }
            }
          },
        );
      }
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> _initQuantity(
    String kod,
  ) async {
    try {
      itemQuantity = await _scService.getItemQuantity(kod, 'groupId', warehouseId);
      itemInShopingCart = itemQuantity > 0;
      loading = false;
      notifyListeners();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  Future<void> addArticlesGoodToCart(
    String id,
    String quantity,
    String ownerId,
    String art,
    String brand,
    String name,
    String price,
  ) async {
    try {
      loading = true;
      notifyListeners();
      await _scService.addArticlesGoodToCart(
        'groupId',
        id,
        quantity,
        ownerId,
        warehouseId,
        art,
        brand,
        name,
        price,
      );
      loading = false;
      notifyListeners();
    } on Exception catch (e) {
      handleError(e);
    }
  }

  @override
  void dispose() {
    streamSubscription?.cancel();
    super.dispose();
  }
}
