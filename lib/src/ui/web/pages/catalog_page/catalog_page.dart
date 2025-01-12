import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/catalog/domain/models/catalog_category_model.dart/catalog_category_model.dart';
import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/favorites_button/favorites_button.dart';
import 'package:b2b_client_lk/src/ui/web/common/favorites_buttons/favorites_button/favorites_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/shopping_cart_button/shopping_cart_button.dart';
import 'package:b2b_client_lk/src/ui/web/common/shopping_cart_buttons/shopping_cart_button/shopping_cart_button_vm.dart';
import 'package:b2b_client_lk/src/ui/web/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
  });

  @override
  State<CatalogPage> createState() => _State();
}

class _State extends State<CatalogPage> {
  @override
  void initState() {
    super.initState();
    context.read<CatalogPageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CatalogPageCubit>();

    return BlocBuilder<CatalogPageCubit, CatalogPageState>(
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
  final CatalogPageCubit bloc;

  const _AppBar({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      actions: [
        ChangeNotifierProvider(
          create: (context) => ShoppingCartButtonVm(
            context.read<ShoppingCartService>(),
            context.read<AuthService>(),
          ),
          builder: (context, _) {
            return const ShoppingCartButton();
          },
        ),
        ChangeNotifierProvider(
          create: (context) => FavoritesButtonVm(
            context.read<FavoritesService>(),
            context.read<AuthService>(),
          ),
          builder: (context, _) {
            return const FavoritesButton();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: InkWell(
            onTap: () => bloc.goToProfile(context),
            child: const Icon(
              Icons.account_circle,
              size: 25,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
      title: const Text('Каталог'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final CatalogPageCubit bloc;
  final CatalogPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: _CatalogList(
        bloc: bloc,
        state: state,
      ),
    );
  }
}

class _CatalogList extends StatelessWidget {
  final CatalogPageCubit bloc;
  final CatalogPageState state;

  const _CatalogList({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: state.categoryList.length,
      itemBuilder: (context, index) {
        final item = state.categoryList[index];

        return _CatalogListItem(
          bloc: bloc,
          item: item,
        );
      },
    );
  }
}

class _CatalogListItem extends StatelessWidget {
  final CatalogPageCubit bloc;
  final CatalogCategory item;

  const _CatalogListItem({
    required this.bloc,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: () => bloc.goToTheNextPage(context, item),
      onTap: () => bloc.goToGoodsList(context),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 8,
        ),
        margin: const EdgeInsets.only(bottom: 10),
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
        child: Text(
          item.name,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
