import 'dart:async';

import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_route.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'favorites_page_state.dart';

class FavoritesPageCubit extends Cubit<FavoritesPageState> {
  final FavoritesService _favoriteService;

  FavoritesPageCubit(
    this._favoriteService,
  ) : super(FavoritesPageState());

  StreamSubscription? _favoritesStreamSubscription;
  StreamSubscription? _authStreamSubscription;

  Future<void> init() async {
    await _favoriteService.init();
    subscribeOnFavoritesStream();
  }

  void subscribeOnFavoritesStream() {
    _favoritesStreamSubscription = _favoriteService.favorites.listen((favorites) async {
      emit(FavoritesPageState(favoritesItems: favorites.items, isLoading: false));
    });
  }

  Future<void> goToGoodsCard(BuildContext context, FavoritesItem item) async {
    await context.pushNamed(
      GoodsItemPageRoute.pageName,
      pathParameters: {
        'goodsId': item.kod,
      },
    );
  }

  Future<void> onBackPressed(BuildContext context) async {
    context.canPop() ? context.pop() : context.pushNamed(MainPageRoute.pageName);
  }

  @override
  Future<void> close() {
    _authStreamSubscription?.cancel();
    _favoritesStreamSubscription?.cancel();

    return super.close();
  }
}
