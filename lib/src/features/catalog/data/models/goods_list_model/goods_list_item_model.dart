import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'goods_list_item_model.g.dart';

List<GoodsListItemResponse> goodsListFromJson(List<dynamic> data) =>
    List<GoodsListItemResponse>.from(
      data.map(
        (x) => _$GoodsListItemResponseFromJson(x as Map<String, dynamic>),
      ),
    );

String goodsListToJson(List<GoodsListItemResponse> data) =>
    json.encode(List<dynamic>.from(data.map(_$GoodsListItemResponseToJson)));

@JsonSerializable()
class GoodsListItemResponse {
  GoodsListItemResponse({
    required this.priceName,
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.remnant,
    required this.image,
    required this.ownerId,
  });

  @JsonKey(name: 'ВидыЦены')
  String priceName;
  @JsonKey(name: 'Цена')
  double price;
  @JsonKey(name: 'Наименование')
  String name;
  @JsonKey(name: 'Артикул')
  String art;
  @JsonKey(name: 'Код')
  String kod;
  @JsonKey(name: 'Остаток')
  num remnant;
  @JsonKey(name: 'Изображение')
  String image;
  @JsonKey(name: 'КодВладельца')
  String ownerId;
}
