import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'filters_model.g.dart';

List<FilterItemResponse> filtersListFromJson(List<dynamic> data) =>
    List<FilterItemResponse>.from(
      data.map(
        (x) => _$FilterItemResponseFromJson(x as Map<String, dynamic>),
      ),
    );

String filtersListToJson(List<FilterItemResponse> data) =>
    json.encode(List<dynamic>.from(data.map(_$FilterItemResponseToJson)));

@JsonSerializable()
class FilterItemResponse {
  factory FilterItemResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterItemResponseFromJson(json);

  FilterItemResponse({
    required this.name,
    required this.kod,
    required this.items,
  });

  @JsonKey(name: 'Фильтр')
  String name;
  @JsonKey(name: 'ФильтрКод')
  String kod;
  @JsonKey(name: 'Значения')
  List<String> items;
}
