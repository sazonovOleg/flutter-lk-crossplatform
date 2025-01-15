import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';
import 'models/sc_model.dart';
import 'shoping_cart_api.dart';
import 'shopping_cart_storage.dart';

class ShoppingCartRepository {
  final ShoppingCartApi _scApi;
  final ShoppingCartStorage _scStorage;

  ShoppingCartRepository(
    this._scApi,
    this._scStorage,
  );

  Future<ShopingCartResponse> getShopingCartResponse() async {
    return _scApi.getShopingCartResponse();
  }

  Future<ShoppingCart> getShoppingCart() async {
    final shoppingCartResponse = await getShopingCartResponse();

    final sc = ShoppingCart(
      items: shoppingCartResponse.items
          .map(
            (e) => ShoppingCartItem(
              name: e.name,
              price: e.price,
              kod: e.kod,
              sum: e.sum,
              image: e.image,
            ),
          )
          .toList(),
      quantity: shoppingCartResponse.quantity,
      sum: shoppingCartResponse.sum,
    );

    return sc;
  }

  Future<void> save(ShoppingCart shopingCart) async {
    await _scStorage.saveShoppingCart(shopingCart);
  }

  Future<ShoppingCart> getShopingCart() async {
    return _scStorage.getShopingCart();
  }

  Future<void> changeShopingCartItemQuantity(
    String kod,
    int quantity,
  ) async {
    await _scApi.changeShopingCartItemQuantity(
      kod,
      quantity,
    );
  }

  Future<void> selectShopingCartItem(
    String kod,
    bool selected,
    bool selectAll,
  ) async {
    await _scApi.selectShopingCartItem(kod, selected, selectAll);
  }

  Future<void> saveShopingCartItems(
    List<ShoppingCartItem> scItems,
  ) async {
    await _scStorage.saveShoppingCartItems(scItems);
  }

  Future<int> getShopingCartItemQuantity(String kod) async {
    final itemsStorage = await _scStorage.getShopingCart();

    var quantity = 0;

    return quantity;
  }

  Future<List<ShoppingCartItem>> getItems() async {
    return _scStorage.getItems();
  }

  Future<void> clear() async {
    await _scStorage.clear();
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
    await _scApi.addArticlesGoodToCart(
      id,
      quantity,
      groupId,
      ownerId,
      warehouseId,
      art,
      brand,
      name,
      price,
    );
  }
}
