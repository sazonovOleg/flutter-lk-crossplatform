// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsListItemResponse _$GoodsListItemResponseFromJson(
        Map<String, dynamic> json) =>
    GoodsListItemResponse(
      priceName: json['ВидыЦены'] as String,
      price: (json['Цена'] as num).toDouble(),
      name: json['Наименование'] as String,
      art: json['Артикул'] as String,
      kod: json['Код'] as String,
      remnant: json['Остаток'] as num,
      image: json['Изображение'] as String,
      ownerId: json['КодВладельца'] as String,
    );

Map<String, dynamic> _$GoodsListItemResponseToJson(
        GoodsListItemResponse instance) =>
    <String, dynamic>{
      'ВидыЦены': instance.priceName,
      'Цена': instance.price,
      'Наименование': instance.name,
      'Артикул': instance.art,
      'Код': instance.kod,
      'Остаток': instance.remnant,
      'Изображение': instance.image,
      'КодВладельца': instance.ownerId,
    };
