// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShopingCartResponse _$ShopingCartResponseFromJson(Map<String, dynamic> json) =>
    ShopingCartResponse(
      items: (json['Элементы'] as List<dynamic>)
          .map((e) =>
              ShopingCartItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: (json['Количество'] as num).toInt(),
      sum: json['Сумма'] as num,
    );

Map<String, dynamic> _$ShopingCartResponseToJson(
        ShopingCartResponse instance) =>
    <String, dynamic>{
      'Элементы': instance.items,
      'Количество': instance.quantity,
      'Сумма': instance.sum,
    };

ShopingCartItemResponse _$ShopingCartItemResponseFromJson(
        Map<String, dynamic> json) =>
    ShopingCartItemResponse(
      name: json['Наименование'] as String,
      price: (json['Цена'] as num).toDouble(),
      kod: json['Код'] as String,
      sum: json['Сумма'] as num,
      image: json['Изображение'] as String,
    );

Map<String, dynamic> _$ShopingCartItemResponseToJson(
        ShopingCartItemResponse instance) =>
    <String, dynamic>{
      'Наименование': instance.name,
      'Цена': instance.price,
      'Код': instance.kod,
      'Сумма': instance.sum,
      'Изображение': instance.image,
    };
