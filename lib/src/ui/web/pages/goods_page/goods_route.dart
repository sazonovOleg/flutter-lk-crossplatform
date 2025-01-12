import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/goods_page/goods_cubit.dart';
import 'package:b2b_client_lk/src/ui/web/pages/goods_page/goods_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GoodsPageRoute extends GoRoute {
  static const pageName = 'Goods page';
  static const route = '/goods';

  GoodsPageRoute()
      : super(
    path: route,
    name: pageName,
    builder: (context, state) => BlocProvider(
      create: (context) => GoodsPageCubit(
        context.read<CatalogService>(),
      ),
      child: GoodsPage(
        categoryId: state.pathParameters['categoryId'] ?? '',
        searchText: '',
      ),
    ),
  );
}
