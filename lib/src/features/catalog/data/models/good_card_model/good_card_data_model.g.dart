// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'good_card_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodCardDataResponse _$GoodCardDataResponseFromJson(
        Map<String, dynamic> json) =>
    GoodCardDataResponse(
      warehouses: (json['Остатки'] as List<dynamic>)
          .map((e) => WarehouseResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      characteristics: (json['Свойства'] as List<dynamic>)
          .map(
              (e) => CharacteristicResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      art: json['Артикул'] as String,
      description: json['Описание'] as String,
      images: (json['Изображения'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      name: json['Наименование'] as String,
      ownerId: json['КодВладельца'] as String,
      mainImage: json['Изображение'] as String,
      price: json['Цена'] as num,
    );

Map<String, dynamic> _$GoodCardDataResponseToJson(
        GoodCardDataResponse instance) =>
    <String, dynamic>{
      'Остатки': instance.warehouses,
      'Свойства': instance.characteristics,
      'Артикул': instance.art,
      'Описание': instance.description,
      'Изображения': instance.images,
      'Наименование': instance.name,
      'КодВладельца': instance.ownerId,
      'Изображение': instance.mainImage,
      'Цена': instance.price,
    };

PriceResponse _$PriceResponseFromJson(Map<String, dynamic> json) =>
    PriceResponse(
      name: json['ВидЦены'] as String,
      kod: json['ВидЦеныКод'] as String,
      price: json['Цена'] as num,
      selected: json['Выбран'] as bool,
    );

Map<String, dynamic> _$PriceResponseToJson(PriceResponse instance) =>
    <String, dynamic>{
      'ВидЦены': instance.name,
      'ВидЦеныКод': instance.kod,
      'Цена': instance.price,
      'Выбран': instance.selected,
    };

WarehouseResponse _$WarehouseResponseFromJson(Map<String, dynamic> json) =>
    WarehouseResponse(
      name: json['Склад'] as String,
      kod: json['СкладКод'] as String,
      quantity: (json['Остаток'] as num).toDouble(),
      address: json['Адрес'] as String,
    );

Map<String, dynamic> _$WarehouseResponseToJson(WarehouseResponse instance) =>
    <String, dynamic>{
      'Склад': instance.name,
      'СкладКод': instance.kod,
      'Остаток': instance.quantity,
      'Адрес': instance.address,
    };

CharacteristicResponse _$CharacteristicResponseFromJson(
        Map<String, dynamic> json) =>
    CharacteristicResponse(
      name: json['Свойство'] as String,
      value: json['Значение'] as String,
    );

Map<String, dynamic> _$CharacteristicResponseToJson(
        CharacteristicResponse instance) =>
    <String, dynamic>{
      'Свойство': instance.name,
      'Значение': instance.value,
    };
