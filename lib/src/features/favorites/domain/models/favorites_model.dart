import 'package:b2b_client_lk/src/ui/web/common/formats.dart';
import 'package:hive_flutter/adapters.dart';

part 'favorites_model.g.dart';

@HiveType(typeId: 3)
class Favorites {
  Favorites({
    required this.items,
    required this.quantity,
  });

  @HiveField(0)
  List<FavoritesItem> items;
  @HiveField(1)
  int quantity;
}

@HiveType(typeId: 4)
class FavoritesItem {
  FavoritesItem({
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.image,
    required this.groupName,
    required this.groupId,
    required this.ownerId,
    this.warehouseId = '',
  }) : formattedPrice = Formats().priceFormat().format(price);

  @HiveField(0, defaultValue: 0)
  num price;
  @HiveField(1, defaultValue: '')
  String name;
  @HiveField(2, defaultValue: '')
  String art;
  @HiveField(3, defaultValue: '')
  String kod;
  @HiveField(4, defaultValue: '')
  String formattedPrice;
  @HiveField(5, defaultValue: '')
  String image;
  @HiveField(6, defaultValue: '')
  String groupName;
  @HiveField(7, defaultValue: '')
  String groupId;
  @HiveField(8, defaultValue: '')
  String ownerId;
  @HiveField(9, defaultValue: '')
  String warehouseId;
}
