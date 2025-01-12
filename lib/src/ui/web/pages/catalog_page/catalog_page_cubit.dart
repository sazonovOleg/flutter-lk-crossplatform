import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/features/catalog/domain/models/catalog_category_model.dart/catalog_category_model.dart';
import 'package:b2b_client_lk/src/ui/web/pages/cart/cart_page_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_state.dart';
import 'package:b2b_client_lk/src/ui/web/pages/favorites/favorites_page_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/goods_page/goods_route.dart';
import 'package:b2b_client_lk/src/ui/web/pages/profile_page/profile_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'catalog_page_route.dart';

class CatalogPageCubit extends Cubit<CatalogPageState> {
  final CatalogService _catalogService;

  CatalogPageCubit(
    this._catalogService,
  ) : super(CatalogPageState(categoryList: []));

  Future<void> init() async {
    await initCategories();
  }

  Future<void> initCategories() async {
    final categoryList = await _catalogService.getCategories('', 'id');

    emit(
      CatalogPageState(
        categoryList: categoryList,
        groupId: 'id',
        isLoading: false,
      ),
    );
  }

  Future<void> goToGoodsList(BuildContext context) async {
    await context.pushNamed(GoodsPageRoute.pageName);
  }

  Future<void> goToCatalogPage(BuildContext context, String categoryId) async {
    await context.pushNamed(
      CatalogPageRoute.pageName,
      pathParameters: {
        'categoryId': categoryId,
        'groupId': state.groupId,
      },
    );
  }

  Future<void> goToTheNextPage(
    BuildContext context,
    CatalogCategory category,
  ) async {
    category.subcategoriesQuantity == 0
        ? await goToGoodsList(context)
        : await goToCatalogPage(context, category.id);
  }

  Future<void> goToProfile(BuildContext context) async {
    await context.pushNamed(ProfilePageRoute.pageName);
  }

  Future<void> goToCart(BuildContext context) async {
    await context.pushNamed(CartPageRoute.pageName);
  }

  Future<void> goToFavorites(BuildContext context) async {
    await context.pushNamed(FavoritesPageRoute.pageName);
  }
}
