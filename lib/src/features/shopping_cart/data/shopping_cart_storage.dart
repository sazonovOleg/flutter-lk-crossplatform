import 'package:b2b_client_lk/src/features/common/hive_storage/hive_storage.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';

const _shopingCart = 'shopingCart';

class ShoppingCartStorage {
  final HiveStorage _hiveStorage;

  ShoppingCartStorage(
    this._hiveStorage,
  );

  Future<void> saveShoppingCart(ShoppingCart shopingCart) async {
    await _hiveStorage.saveValue(_shopingCart, shopingCart);
  }

  Future<ShoppingCart> getShopingCart() async {
    final sc =
        await _hiveStorage.getValue(_shopingCart) ?? ShoppingCart(items: [], quantity: 0, sum: 0);

    return sc;
  }

  Future<void> saveShoppingCartItems(
    List<ShoppingCartItem> scItems,
  ) async {
    await _hiveStorage.saveValue(_shopingCart, scItems);
  }

  Future<List<ShoppingCartItem>> getItems() async {
    final sc = await _hiveStorage.getValue(_shopingCart) as ShoppingCart;

    return sc.items;
  }

  Future<void> clear() async {
    await _hiveStorage.clear(_shopingCart);
  }
}
