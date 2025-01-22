import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_route.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/profile_page/profile_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'goods_state.dart';

class GoodsPageCubit extends Cubit<GoodsPageState> {
  final CatalogService _catalogService;

  GoodsPageCubit(
    this._catalogService,
  ) : super(GoodsPageState());

  Future<void> init(
  ) async {
    await initGoodsList();
  }

  Future<void> initGoodsList() async {
    final goodsList = await _catalogService.getGoodsList();

    emit(
      GoodsPageState(
        goodsList: goodsList,
        isLoading: false,
      ),
    );
  }

  Future<void> goToProfile(BuildContext context) async {
    await context.pushNamed(ProfilePageRoute.pageName);
  }

  Future<void> goToGoodsItem(
    BuildContext context,
    num goodsId,
  ) async {
    await context.pushNamed(
      GoodsItemPageRoute.pageName,
      pathParameters: {
        'goodsId': goodsId.toString(),
      },
    );
  }

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : context.pushNamed(MainPageRoute.pageName);
  }

  Future<void> updateGoodsList() async {
    emit(GoodsPageState(isLoading: true));

    await initGoodsList();
  }
}
