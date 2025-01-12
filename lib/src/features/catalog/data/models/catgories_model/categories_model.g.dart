// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatalogCategoryResponse _$CatalogCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    CatalogCategoryResponse(
      name: json['Категория'] as String,
      id: json['Код'] as String,
      goodsQuantity: (json['КоличествоТоваров'] as num).toInt(),
      subcategoriesQuantity: (json['КоличествоПодкатегорий'] as num).toInt(),
    );

Map<String, dynamic> _$CatalogCategoryResponseToJson(
        CatalogCategoryResponse instance) =>
    <String, dynamic>{
      'Категория': instance.name,
      'Код': instance.id,
      'КоличествоТоваров': instance.goodsQuantity,
      'КоличествоПодкатегорий': instance.subcategoriesQuantity,
    };
