// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterItemResponse _$FilterItemResponseFromJson(Map<String, dynamic> json) =>
    FilterItemResponse(
      name: json['Фильтр'] as String,
      kod: json['ФильтрКод'] as String,
      items:
          (json['Значения'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterItemResponseToJson(FilterItemResponse instance) =>
    <String, dynamic>{
      'Фильтр': instance.name,
      'ФильтрКод': instance.kod,
      'Значения': instance.items,
    };
