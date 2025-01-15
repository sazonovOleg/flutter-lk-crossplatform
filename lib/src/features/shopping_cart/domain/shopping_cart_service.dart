import 'dart:async';
import 'package:b2b_client_lk/src/features/shopping_cart/data/shoping_cart_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'models/sc_model.dart';

class ShoppingCartService {
  final ShoppingCartRepository _scRepository;

  ShoppingCartService(
    this._scRepository,
  );

  final _shopingCart = BehaviorSubject<ShoppingCart>.seeded(
    ShoppingCart(
      items: <ShoppingCartItem>[],
      quantity: 0,
      sum: 0,
    ),
  );

  Stream<ShoppingCart> get shopingCart => _shopingCart.stream;

  Future<void> saveShoppingCart() async {
    final shoppingCart = await _scRepository.getShoppingCart();
    await _scRepository.save(shoppingCart);
  }

  Future<void> setShoppingCart() async {
    final shoppingCart = await _scRepository.getShopingCart();
    _shopingCart.value = shoppingCart;
  }

  Future<List<ShoppingCartItem>> getItems() async {
    final scItems = await _scRepository.getItems();

    return scItems;
  }

  Future<int> getItemQuantity(
    String kod,
    String groupId,
    String warehouseId,
  ) async {
    var quantity = 0;
    final sc = await _scRepository.getShopingCart();

    return quantity;
  }

  Future<void> changeItemQuantity(
    String kod,
    int quantity,
  ) async {
    await _scRepository.changeShopingCartItemQuantity(
      kod,
      quantity,
    );
    await saveShoppingCart();
    await setShoppingCart();
  }

  Future<void> selectItem(String kod, bool selected, bool selectAll) async {
    await _scRepository.selectShopingCartItem(kod, selected, selectAll);
    await saveShoppingCart();
    await setShoppingCart();
  }

  void dispose() {
    _shopingCart.close();
  }

  Future<int> getTotalQuantity() async {
    final sc = await _scRepository.getShopingCart();

    return sc.quantity;
  }

  Future<void> addArticlesGoodToCart(
    String groupId,
    String id,
    String quantity,
    String ownerId,
    String warehouseId,
    String art,
    String brand,
    String name,
    String price,
  ) async {
    if (groupId.isNotEmpty) {
      await _scRepository.addArticlesGoodToCart(
        groupId,
        id,
        quantity,
        ownerId,
        warehouseId,
        art,
        brand,
        name,
        price,
      );

      await saveShoppingCart();
      await setShoppingCart();
    }
  }
}
