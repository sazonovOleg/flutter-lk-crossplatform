import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/models/sc_model.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/add_to_favorites_button/add_to_favorites_button.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/add_to_favorites_button/add_to_favorites_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/common/image.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/add_to_shopping_cart/add_to_shoping_cart_button.dart.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/add_to_shopping_cart/add_to_shoping_cart_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/cart/cart_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/web/pages/cart/cart_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _State();
}

class _State extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    context.read<CartPageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CartPageCubit>();

    return BlocBuilder<CartPageCubit, CartPageState>(
      bloc: bloc,
      builder: (context, state) => Scaffold(
        appBar: _AppBar(
          bloc: bloc,
        ),
        body: state.loading
            ? const LoadingPage()
            : state.isOrderCreated
                ? _OrderCreated()
                : _Body(
                    bloc: bloc,
                    state: state,
                  ),
        bottomSheet: state.isOrderCreated
            ? const SizedBox()
            : _BottomSheet(
                bloc: bloc,
                state: state,
              ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final CartPageCubit bloc;

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
      title: const Text('Корзина'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final CartPageCubit bloc;
  final CartPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: state.scItems.isEmpty
          ? const Text('Корзина пуста')
          : _CartItemsList(
              bloc: bloc,
              state: state,
            ),
    );
  }
}

class _CartItemsList extends StatelessWidget {
  final CartPageCubit bloc;
  final CartPageState state;

  const _CartItemsList({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: state.scItems.length,
      itemBuilder: (context, index) {
        final item = state.scItems[index];

        return _CartItem(
          bloc: bloc,
          state: state,
          item: item,
        );
      },
    );
  }
}

class _CartItem extends StatelessWidget {
  final CartPageCubit bloc;
  final CartPageState state;
  final ShoppingCartItem item;

  const _CartItem({
    required this.bloc,
    required this.state,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      constraints: const BoxConstraints(maxWidth: 500),
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Img(
                imageUrl: item.image,
                height: 75,
                width: 75,
              ),
              Container(
                width: double.maxFinite,
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    Text(item.art),
                    Text(item.price.toString()),
                    Text('Кол-во: ${item.quantity}'),
                  ],
                ),
              ),
              ChangeNotifierProvider(
                create: (context) => AddToFavoritesButtonVm(
                  context.read<FavoritesService>(),
                ),
                builder: (context, _) {
                  return AddToFavoritesButton(
                    key: ValueKey(item.kod),
                    kod: item.kod,
                    groupId: item.groupId,
                  );
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () => bloc.removeItem(
                  0,
                  item.kod,
                  item.groupId,
                  item.ownerId,
                  item.warehouseId,
                ),
                child: const Text('Удалить'),
              ),
              ChangeNotifierProvider(
                create: (context) => AddToShoppingCartButtonVm(
                  context.read<ShoppingCartService>(),
                ),
                builder: (context, _) {
                  return AddToShoppingCartButton(
                    key: ValueKey(item.kod + item.warehouseId),
                    kod: item.kod,
                    groupId: item.groupId,
                    ownerId: item.ownerId,
                    warehouseId: item.warehouseId,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  final CartPageCubit bloc;
  final CartPageState state;

  const _BottomSheet({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(state.totalPrice),
          ElevatedButton(
            onPressed: bloc.createOrder,
            child: const Text('Оформить'),
          ),
        ],
      ),
    );
  }
}

class _OrderCreated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Ваш заказ успешно фоормлен.'),
    );
  }
}
