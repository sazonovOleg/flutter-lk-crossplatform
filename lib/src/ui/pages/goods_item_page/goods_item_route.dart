import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoodsItemPageRoute extends GoRoute {
  static const pageName = 'Goods item page';
  static const route = '/goods-item-:goodsId';

  GoodsItemPageRoute()
      : super(
          path: route,
          name: pageName,
          builder: (context, state) => BlocProvider(
            create: (context) => GoodsItemPageCubit(
              context.read<CatalogService>(),
            ),
            child: GoodsItemPage(
              goodId: state.pathParameters['goodsId']!,
            ),
          ),
        );
}
