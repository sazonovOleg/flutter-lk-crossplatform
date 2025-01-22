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
    required this.id,
    required this.price,
    required this.name,
    required this.img,
  });

  @JsonKey(name: 'id')
  num id;
  @JsonKey(name: 'price')
  String price;
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'img')
  String img;
}
