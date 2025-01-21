import 'package:b2b_client_lk/src/ui/common/formats.dart';

class GoodCardData {
  GoodCardData({
    required this.warehouses,
    required this.art,
    required this.characteristics,
    required this.images,
    required this.description,
    required this.name,
    required this.ownerId,
    required this.mainImage,
    required this.price,
  });

  List<Warehouse> warehouses;
  List<GoodCharacteristic> characteristics;
  List<String> images;
  String art;
  String description;
  String name;
  String ownerId;
  String mainImage;
  String price;

  GoodCardData.empty()
      : warehouses = [],
        art = '',
        characteristics = [],
        images = [],
        description = '',
        name = '',
        ownerId = '',
        mainImage = '',
        price = '';
}

class Price {
  final String name;
  final String kod;
  num price;
  bool selected;
  String formattedPrice;

  Price({
    required this.name,
    required this.kod,
    required this.price,
    required this.selected,
  }) : formattedPrice = Formats().priceFormat().format(price);
}

class Warehouse {
  final String name;
  final String kod;
  final int quantity;
  final String address;

  Warehouse({
    required this.name,
    required this.kod,
    required this.quantity,
    required this.address,
  });
}

class GoodCharacteristic {
  final String name;
  final String value;

  GoodCharacteristic({
    required this.name,
    required this.value,
  });
}
