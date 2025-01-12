import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'good_card_data_model.g.dart';

List<GoodCardDataResponse> goodCardDataFromJson(List<dynamic> data) =>
    List<GoodCardDataResponse>.from(
      data.map(
        (x) => _$GoodCardDataResponseFromJson(x as Map<String, dynamic>),
      ),
    );

String goodCardDataToJson(List<GoodCardDataResponse> data) =>
    json.encode(List<dynamic>.from(data.map(_$GoodCardDataResponseToJson)));

@JsonSerializable()
class GoodCardDataResponse {
  const GoodCardDataResponse({
    required this.warehouses,
    required this.characteristics,
    required this.art,
    required this.description,
    required this.images,
    required this.name,
    required this.ownerId,
    required this.mainImage,
    required this.price,
  });

  @JsonKey(name: 'Остатки')
  final List<WarehouseResponse> warehouses;
  @JsonKey(name: 'Свойства')
  final List<CharacteristicResponse> characteristics;
  @JsonKey(name: 'Артикул')
  final String art;
  @JsonKey(name: 'Описание')
  final String description;
  @JsonKey(name: 'Изображения')
  final List<String> images;
  @JsonKey(name: 'Наименование')
  final String name;
  @JsonKey(name: 'КодВладельца')
  final String ownerId;
  @JsonKey(name: 'Изображение')
  final String mainImage;
  @JsonKey(name: 'Цена')
  final num price;
}

@JsonSerializable()
class PriceResponse {
  @JsonKey(name: 'ВидЦены')
  String name;
  @JsonKey(name: 'ВидЦеныКод')
  String kod;
  @JsonKey(name: 'Цена')
  num price;
  @JsonKey(name: 'Выбран')
  bool selected;

  PriceResponse({
    required this.name,
    required this.kod,
    required this.price,
    required this.selected,
  });

  factory PriceResponse.fromJson(Map<String, dynamic> json) =>
      _$PriceResponseFromJson(json);
}

@JsonSerializable()
class WarehouseResponse {
  @JsonKey(name: 'Склад')
  String name;
  @JsonKey(name: 'СкладКод')
  String kod;
  @JsonKey(name: 'Остаток')
  double quantity;
  @JsonKey(name: 'Адрес')
  String address;
  WarehouseResponse({
    required this.name,
    required this.kod,
    required this.quantity,
    required this.address,
  });

  factory WarehouseResponse.fromJson(Map<String, dynamic> json) =>
      _$WarehouseResponseFromJson(json);
}

@JsonSerializable()
class CharacteristicResponse {
  @JsonKey(name: 'Свойство')
  String name;
  @JsonKey(name: 'Значение')
  String value;

  CharacteristicResponse({
    required this.name,
    required this.value,
  });

  factory CharacteristicResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacteristicResponseFromJson(json);
}
