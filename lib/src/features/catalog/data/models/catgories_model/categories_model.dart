import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

List<CatalogCategoryResponse> categoriesFromJson(List<dynamic> data) =>
    List<CatalogCategoryResponse>.from(
      data.map(
        (x) => _$CatalogCategoryResponseFromJson(x as Map<String, dynamic>),
      ),
    );

String categoriesToJson(List<CatalogCategoryResponse> data) =>
    json.encode(List<dynamic>.from(data.map(_$CatalogCategoryResponseToJson)));

@JsonSerializable()
class CatalogCategoryResponse {
  CatalogCategoryResponse({
    required this.name,
    required this.id,
    required this.goodsQuantity,
    required this.subcategoriesQuantity,
  });

  @JsonKey(name: 'Категория')
  String name;
  @JsonKey(name: 'Код')
  String id;
  @JsonKey(name: 'КоличествоТоваров')
  int goodsQuantity;
  @JsonKey(name: 'КоличествоПодкатегорий')
  int subcategoriesQuantity;
}
