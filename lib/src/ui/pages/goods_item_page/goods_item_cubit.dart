import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'goods_item_state.dart';

class GoodsItemPageCubit extends Cubit<GoodsItemPageState> {
  final CatalogService _catalogService;

  GoodsItemPageCubit(
    this._catalogService,
  ) : super(GoodsItemPageState());

  Future<void> init(String goodId) async {
    await initGoodCardData(goodId);
  }

  Future<void> initGoodCardData(String goodId) async {
    final goodCardData = await _catalogService.getGoodCardData(goodId, 'groupId');

    emit(
      GoodsItemPageState(
        goodId: goodId,
        groupId: 'groupId',
        goodCardData: goodCardData,
        isLoading: false,
      ),
    );
  }

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : await context.pushNamed(MainPageRoute.pageName);
  }
}
