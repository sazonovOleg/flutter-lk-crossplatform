import 'package:b2b_client_lk/src/ui/common/formats.dart';

class GoodsListItem {
  GoodsListItem({
    required this.id,
    required this.price,
    required this.name,
    required this.img,
  });

  num id;
  String price;
  String name;
  String img;

  GoodsListItem.empty()
      : id = 0,
        price = '0',
        name = 'name',
        img = '';
}
