import 'package:b2b_client_lk/src/ui/common/formats.dart';
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
    required this.kod,
    required this.image,
  });

  @HiveField(0, defaultValue: 0)
  num price;
  @HiveField(1, defaultValue: '')
  String name;
  @HiveField(2, defaultValue: '')
  String kod;
  @HiveField(3, defaultValue: '')
  String image;
}
