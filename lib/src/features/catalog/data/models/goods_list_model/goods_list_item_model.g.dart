// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_list_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsListItemResponse _$GoodsListItemResponseFromJson(
        Map<String, dynamic> json) =>
    GoodsListItemResponse(
      id: json['id'] as num,
      price: json['price'] as String,
      name: json['name'] as String,
      img: json['img'] as String,
    );

Map<String, dynamic> _$GoodsListItemResponseToJson(
        GoodsListItemResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'img': instance.img,
    };
