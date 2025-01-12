import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';
import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/add_to_favorites_button/add_to_favorites_button.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/add_to_favorites_button/add_to_favorites_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/common/image.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/add_to_shopping_cart/add_to_shoping_cart_button.dart.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/add_to_shopping_cart/add_to_shoping_cart_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/goods_page/goods_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'goods_cubit.dart';

class GoodsPage extends StatefulWidget {
  final String categoryId;
  final String searchText;

  const GoodsPage({
    required this.categoryId,
    required this.searchText,
    super.key,
  });

  @override
  State<GoodsPage> createState() => _State();
}

class _State extends State<GoodsPage> {
  @override
  void initState() {
    super.initState();
    context.read<GoodsPageCubit>().init(widget.categoryId, widget.searchText);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<GoodsPageCubit>();

    return BlocBuilder<GoodsPageCubit, GoodsPageState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        appBar: _AppBar(
          bloc: bloc,
        ),
        body: state.isLoading
            ? const LoadingPage()
            : _Body(
                bloc: bloc,
                state: state,
              ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final GoodsPageCubit bloc;

  const _AppBar({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: BackButton(
        onPressed: () => bloc.onBackPressed(context),
      ),
      actions: [
        InkWell(
          onTap: () => bloc.goToProfile(context),
          child: const Icon(
            Icons.account_circle,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      title: const Text('Товары'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final GoodsPageCubit bloc;
  final GoodsPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return _GoodsList(
      bloc: bloc,
      state: state,
    );
  }
}

class _GoodsList extends StatelessWidget {
  final GoodsPageCubit bloc;
  final GoodsPageState state;

  const _GoodsList({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 20,
          spacing: 20,
          children: state.goodsList
              .map(
                (item) => _GoodsListItem(
                  bloc: bloc,
                  state: state,
                  item: item,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _GoodsListItem extends StatelessWidget {
  final GoodsPageCubit bloc;
  final GoodsPageState state;
  final GoodsListItem item;

  const _GoodsListItem({
    required this.bloc,
    required this.state,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final maxWidth = width / 2 - 30;

    return InkWell(
      onTap: () => bloc.goToGoodsItem(context, item.kod),
      child: Container(
        width: double.infinity,
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(3, 4),
            ),
          ],
          border: Border.all(
            color: const Color(
              0xFFCCCCCC,
            ),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width:30,height: 30,),
                Img(
                  imageUrl: item.image,
                  height: 100,
                  width: 100,
                ),
                ChangeNotifierProvider(
                  create: (context) => AddToFavoritesButtonVm(
                    context.read<FavoritesService>(),
                  ),
                  builder: (context, _) {
                    return AddToFavoritesButton(
                      key: ValueKey(item.kod),
                      kod: item.kod,
                      groupId: item.ownerId,
                    );
                  },
                ),
              ],
            ),
            Text('Название: ${item.name}'),
            Text('Арт: ${item.art}'),
            Text('Цена: ${item.price}₽'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Наличие: ${item.remnant}'),
                const SizedBox(height: 15,),
                ChangeNotifierProvider(
                  create: (context) => AddToShoppingCartButtonVm(
                    context.read<ShoppingCartService>(),
                  ),
                  builder: (context, _) {
                    return AddToShoppingCartButton(
                      key: ValueKey(item.kod),
                      kod: item.kod,
                      groupId: state.groupId,
                      ownerId: item.ownerId,
                      warehouseId: '',
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
