// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoritesResponse _$FavoritesResponseFromJson(Map<String, dynamic> json) =>
    FavoritesResponse(
      items: (json['Элементы'] as List<dynamic>)
          .map(
              (e) => FavoritesItemsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      quantity: (json['Количество'] as num).toInt(),
    );

Map<String, dynamic> _$FavoritesResponseToJson(FavoritesResponse instance) =>
    <String, dynamic>{
      'Элементы': instance.items,
      'Количество': instance.quantity,
    };

FavoritesItemsResponse _$FavoritesItemsResponseFromJson(
        Map<String, dynamic> json) =>
    FavoritesItemsResponse(
      price: (json['Цена'] as num).toDouble(),
      name: json['Наименование'] as String,
      art: json['Артикул'] as String,
      kod: json['Код'] as String,
      image: json['Изображение'] as String,
      groupName: json['НаименованиеГруппыПользователя'] as String,
      groupId: json['КодГруппыПользователя'] as String,
      ownerId: json['КодВладельца'] as String,
    );

Map<String, dynamic> _$FavoritesItemsResponseToJson(
        FavoritesItemsResponse instance) =>
    <String, dynamic>{
      'Цена': instance.price,
      'Наименование': instance.name,
      'Артикул': instance.art,
      'Код': instance.kod,
      'Изображение': instance.image,
      'НаименованиеГруппыПользователя': instance.groupName,
      'КодГруппыПользователя': instance.groupId,
      'КодВладельца': instance.ownerId,
    };
