import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorites_model.g.dart';

FavoritesResponse favoritesFromJson(List<dynamic> data) =>
    List<FavoritesResponse>.from(
      data.map(
        (x) => _$FavoritesResponseFromJson(x as Map<String, dynamic>),
      ),
    ).first;

@JsonSerializable()
class FavoritesResponse {
  FavoritesResponse({
    required this.items,
    required this.quantity,
  });

  @HiveField(0, defaultValue: <FavoritesItemsResponse>[])
  @JsonKey(name: 'Элементы')
  List<FavoritesItemsResponse> items;
  @HiveField(1, defaultValue: 0)
  @JsonKey(name: 'Количество')
  int quantity;
}

@JsonSerializable()
class FavoritesItemsResponse {
  FavoritesItemsResponse({
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.image,
    required this.groupName,
    required this.groupId,
    required this.ownerId,
  });

  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'Цена')
  double price;
  @HiveField(1, defaultValue: '')
  @JsonKey(name: 'Наименование')
  String name;
  @HiveField(2, defaultValue: '')
  @JsonKey(name: 'Артикул')
  String art;
  @HiveField(3, defaultValue: '')
  @JsonKey(name: 'Код')
  String kod;
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'Изображение')
  String image;
  @HiveField(5, defaultValue: '')
  @JsonKey(name: 'НаименованиеГруппыПользователя')
  String groupName;
  @HiveField(6, defaultValue: '')
  @JsonKey(name: 'КодГруппыПользователя')
  String groupId;
  @JsonKey(name: 'КодВладельца')
  String ownerId;

  factory FavoritesItemsResponse.fromJson(Map<String, dynamic> json) =>
      _$FavoritesItemsResponseFromJson(json);
}
