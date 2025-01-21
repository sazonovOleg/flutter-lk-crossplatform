import 'package:b2b_client_lk/src/features/catalog/domain/models/good_card_data_model/good_card_data_model.dart';

class GoodsItemPageState {
  final bool isLoading;
  final String goodId;
  final String groupId;
  GoodCardData? goodCardData = GoodCardData.empty();

  GoodsItemPageState({
    this.isLoading = true,
    this.goodId = '',
    this.groupId = '',
    this.goodCardData,
  });
}
