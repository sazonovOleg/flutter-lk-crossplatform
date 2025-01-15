import 'package:hive_flutter/adapters.dart';

part 'sc_model.g.dart';

@HiveType(typeId: 5)
class ShoppingCart {
  ShoppingCart({
    required this.items,
    required this.quantity,
    required this.sum,
  });

  @HiveField(0, defaultValue: <ShoppingCartItem>[])
  List<ShoppingCartItem> items;
  @HiveField(1, defaultValue: 0)
  int quantity;
  @HiveField(2, defaultValue: 0)
  num sum;
}

@HiveType(typeId: 6)
class ShoppingCartItem {
  ShoppingCartItem({
    required this.name,
    required this.price,
    required this.kod,
    required this.sum,
    required this.image,
  });

  @HiveField(1, defaultValue: '')
  String name;
  @HiveField(2, defaultValue: 0)
  double price;
  @HiveField(3, defaultValue: '')
  String kod;
  @HiveField(4, defaultValue: 0)
  num sum;
  @HiveField(5, defaultValue: '')
  String image;

  ShoppingCartItem.empty()
      : price = 0,
        name = '',
        kod = '',
        sum = 0,
        image = '';
}
