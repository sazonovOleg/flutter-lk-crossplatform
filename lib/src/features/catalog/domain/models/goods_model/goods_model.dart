import 'package:b2b_client_lk/src/ui/common/formats.dart';

class GoodsListItem {
  GoodsListItem({
    required this.priceName,
    required this.price,
    required this.name,
    required this.art,
    required this.kod,
    required this.remnant,
    required this.image,
    required this.ownerId,
  }) : formattedPrice = Formats().priceFormat().format(price);

  String priceName;
  double price;
  String name;
  String art;
  String kod;
  num remnant;
  String formattedPrice;
  String image;
  String ownerId;

  GoodsListItem.empty()
      : priceName = 'priceName',
        price = 0,
        name = 'name',
        art = 'art',
        kod = 'kod',
        remnant = 0,
        formattedPrice = 'formattedPrice',
        image = 'image',
        ownerId = 'ownerId';
}
