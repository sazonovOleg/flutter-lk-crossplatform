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
      price: (json['Цена'] as num).toDouble(),
      name: json['Наименование'] as String,
      art: json['Артикул'] as String,
      kod: json['Код'] as String,
      quantity: (json['Количество'] as num).toInt(),
      selected: json['Выбран'] as bool,
      sum: json['Сумма'] as num,
      image: json['Изображение'] as String,
      groupName: json['НаименованиеГруппыПользователя'] as String,
      groupId: json['КодГруппыПользователя'] as String,
      ownerId: json['ВладелецТовараКод'] as String,
      ownerName: json['ВладелецТовараНаименование'] as String,
      warehouseId: json['КодСклада'] as String,
    );

Map<String, dynamic> _$ShopingCartItemResponseToJson(
        ShopingCartItemResponse instance) =>
    <String, dynamic>{
      'Цена': instance.price,
      'Наименование': instance.name,
      'Артикул': instance.art,
      'Код': instance.kod,
      'Количество': instance.quantity,
      'Выбран': instance.selected,
      'Сумма': instance.sum,
      'Изображение': instance.image,
      'НаименованиеГруппыПользователя': instance.groupName,
      'КодГруппыПользователя': instance.groupId,
      'ВладелецТовараКод': instance.ownerId,
      'ВладелецТовараНаименование': instance.ownerName,
      'КодСклада': instance.warehouseId,
    };
