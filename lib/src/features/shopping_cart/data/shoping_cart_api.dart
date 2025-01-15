import 'package:dio/dio.dart';

import 'models/sc_model.dart';

class ShoppingCartApi {
  final Dio _dio;

  ShoppingCartApi(this._dio);

  Future<void> changeShopingCartItemQuantity(
    String kod,
    int quantity,
  ) async {
    await _dio.put(
      'shopping_cart/param?kod=$kod&quantity=$quantity',
    );
  }

  Future<void> selectShopingCartItem(
    String kod,
    bool selected,
    bool selectAll,
  ) async {
    await _dio.post(
      'shopping_cart/param?kod=$kod&selected=$selected&selectAll=$selectAll',
    );
  }

  Future<ShopingCartResponse> getShopingCartResponse() async {
    final response = await _dio.get(
      'shopping_cart/param?',
    );

    return shopingCartFromJson(response.data);
  }

  Future<void> addArticlesGoodToCart(
    String id,
    String quantity,
    String groupId,
    String ownerId,
    String warehouseId,
    String art,
    String brand,
    String name,
    String price,
  ) async {
    await _dio.put(
      'auto_parts_sc/param?id=$id&quantity=$quantity&groupId=$groupId&ownerId=$ownerId&warehouseId=$warehouseId&art=$art&brand=$brand&name=$name&price=$price',
    );
  }
}
