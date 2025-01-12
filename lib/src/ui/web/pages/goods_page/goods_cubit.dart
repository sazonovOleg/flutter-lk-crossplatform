import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/goods_item_page/goods_item_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/profile_page/profile_page_route.dart';
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
    String categoryId,
    String searchText,
  ) async {
    await initGoodsList(
      categoryId,
      searchText,
    );
  }

  Future<void> initGoodsList(
    String categoryId,
    String searchText,
  ) async {
    final goodsList = await _catalogService.getGoodsList(
      categoryId,
      searchText,
      '',
      [],
      [],
      state.sortName,
    );

    emit(
      GoodsPageState(
        categoryId: categoryId,
        groupId: '',
        searchText: searchText,
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
    String goodsId,
  ) async {
    await context.pushNamed(
      GoodsItemPageRoute.pageName,
      pathParameters: {
        'goodsId': goodsId,
      },
    );
  }

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : context.pushNamed(CatalogPageRoute.pageName);
  }
}
