import 'package:b2b_client_lk/src/ui/web/common/formats.dart';
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
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.quantity,
    required this.selected,
    required this.sum,
    required this.groupId,
    required this.groupName,
    required this.image,
    required this.ownerName,
    required this.ownerId,
    required this.warehouseId,
  }) : formattedPrice = Formats().priceFormat().format(price);

  @HiveField(1, defaultValue: 0)
  double price;
  @HiveField(2, defaultValue: '')
  String name;
  @HiveField(3, defaultValue: '')
  String art;
  @HiveField(4, defaultValue: '')
  String kod;
  @HiveField(5, defaultValue: 0)
  int quantity;
  @HiveField(6, defaultValue: false)
  bool selected;
  @HiveField(7, defaultValue: 0)
  num sum;
  @HiveField(8, defaultValue: '')
  String formattedPrice;
  @HiveField(9, defaultValue: '')
  String groupId;
  @HiveField(10, defaultValue: '')
  String groupName;
  @HiveField(11, defaultValue: '')
  String image;
  @HiveField(12, defaultValue: '')
  String ownerName;
  @HiveField(13, defaultValue: '')
  String ownerId;
  @HiveField(14, defaultValue: '')
  String warehouseId;

  ShoppingCartItem.empty()
      : price = 0,
        name = '',
        art = '',
        kod = '',
        quantity = 0,
        selected = false,
        sum = 0,
        groupId = '',
        groupName = '',
        image = '',
        formattedPrice = '',
        ownerName = '',
        ownerId = '',
        warehouseId = '';
}
