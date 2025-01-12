import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'sc_model.g.dart';

ShopingCartResponse shopingCartFromJson(List<dynamic> data) =>
    List<ShopingCartResponse>.from(
      data.map(
        (x) => _$ShopingCartResponseFromJson(x as Map<String, dynamic>),
      ),
    ).first;

String scItemsToJson(List<ShopingCartItemResponse> data) =>
    json.encode(List<dynamic>.from(data.map(_$ShopingCartItemResponseToJson)));

@JsonSerializable()
class ShopingCartResponse {
  ShopingCartResponse({
    required this.items,
    required this.quantity,
    required this.sum,
  });

  @JsonKey(name: 'Элементы')
  List<ShopingCartItemResponse> items;
  @JsonKey(name: 'Количество')
  int quantity;
  @JsonKey(name: 'Сумма')
  num sum;
}

@JsonSerializable()
class ShopingCartItemResponse {
  ShopingCartItemResponse({
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.quantity,
    required this.selected,
    required this.sum,
    required this.image,
    required this.groupName,
    required this.groupId,
    required this.ownerId,
    required this.ownerName,
    required this.warehouseId,
  });

  @JsonKey(name: 'Цена')
  double price;
  @JsonKey(name: 'Наименование')
  String name;
  @JsonKey(name: 'Артикул')
  String art;
  @JsonKey(name: 'Код')
  String kod;
  @JsonKey(name: 'Количество')
  int quantity;
  @JsonKey(name: 'Выбран')
  bool selected;
  @JsonKey(name: 'Сумма')
  num sum;
  @JsonKey(name: 'Изображение')
  String image;
  @JsonKey(name: 'НаименованиеГруппыПользователя')
  String groupName;
  @JsonKey(name: 'КодГруппыПользователя')
  String groupId;
  @JsonKey(name: 'ВладелецТовараКод')
  String ownerId;
  @JsonKey(name: 'ВладелецТовараНаименование')
  String ownerName;
  @JsonKey(name: 'КодСклада')
  String warehouseId;

  factory ShopingCartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ShopingCartItemResponseFromJson(json);
}
