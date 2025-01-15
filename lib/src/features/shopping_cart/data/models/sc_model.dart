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
    required this.name,
    required this.price,
    required this.kod,
    required this.sum,
    required this.image,
  });
  @JsonKey(name: 'Наименование')
  String name;
  @JsonKey(name: 'Цена')
  double price;
  @JsonKey(name: 'Код')
  String kod;
  @JsonKey(name: 'Сумма')
  num sum;
  @JsonKey(name: 'Изображение')
  String image;

  factory ShopingCartItemResponse.fromJson(Map<String, dynamic> json) =>
      _$ShopingCartItemResponseFromJson(json);
}
