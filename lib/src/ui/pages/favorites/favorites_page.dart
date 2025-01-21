import 'package:b2b_client_lk/src/features/favorites/domain/models/favorites_model.dart';
import 'package:b2b_client_lk/src/ui/common/image.dart';
import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({
    super.key,
  });

  @override
  State<FavoritesPage> createState() => _State();
}

class _State extends State<FavoritesPage> {
  @override
  void initState() {
    super.initState();
    context.read<FavoritesPageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<FavoritesPageCubit>();

    return BlocBuilder<FavoritesPageCubit, FavoritesPageState>(
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
  final FavoritesPageCubit bloc;

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
      title: const Text('Избранное'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final FavoritesPageCubit bloc;
  final FavoritesPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: state.favoritesItems.isEmpty
          ? const Text('Избранное пусто')
          : _FavoriteItemsList(
              bloc: bloc,
              state: state,
            ),
    );
  }
}

class _FavoriteItemsList extends StatelessWidget {
  final FavoritesPageCubit bloc;
  final FavoritesPageState state;

  const _FavoriteItemsList({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(5),
      itemCount: state.favoritesItems.length,
      itemBuilder: (context, index) {
        final item = state.favoritesItems[index];

        return _FavoriteItem(
          bloc: bloc,
          state: state,
          item: item,
        );
      },
    );
  }
}

class _FavoriteItem extends StatelessWidget {
  final FavoritesPageCubit bloc;
  final FavoritesPageState state;
  final FavoritesItem item;

  const _FavoriteItem({
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Img(
                imageUrl: item.image,
                height: 75,
                width: 75,
              ),
              Container(
                width: double.maxFinite,
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name),
                    Text(item.price.toString()),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
