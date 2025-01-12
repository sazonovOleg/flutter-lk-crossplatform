// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorResponse _$ApiErrorResponseFromJson(Map<String, dynamic> json) =>
    ApiErrorResponse(
      code: (json['КодОшибкиСервера'] as num).toInt(),
      message: json['СообщениеОтСервера'] as String,
      data: (json['Данные'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ApiErrorResponseToJson(ApiErrorResponse instance) =>
    <String, dynamic>{
      'КодОшибкиСервера': instance.code,
      'СообщениеОтСервера': instance.message,
      'Данные': instance.data,
    };
