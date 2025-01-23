import 'package:b2b_client_lk/src/ui/common/image.dart';
import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoodsItemPage extends StatefulWidget {
  final String goodId;

  const GoodsItemPage({
    super.key,
    required this.goodId,
  });

  @override
  State<GoodsItemPage> createState() => _State();
}

class _State extends State<GoodsItemPage> {
  @override
  void initState() {
    super.initState();
    context.read<GoodsItemPageCubit>().init(widget.goodId);
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GoodsItemPageCubit>(context);

    return BlocBuilder<GoodsItemPageCubit, GoodsItemPageState>(
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
        bottomSheet: state.isLoading ? const SizedBox() : _AddToCartBtn(bloc: bloc, state: state),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final GoodsItemPageCubit bloc;

  const _AppBar({
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: BackButton(
        onPressed: () => bloc.onBackPressed(context),
      ),
      title: const Text('Товар'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends StatelessWidget {
  final GoodsItemPageCubit bloc;
  final GoodsItemPageState state;

  const _Body({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                child: Img(
                  imageUrl: state.goodCardData!.mainImage,
                  height: 220,
                  width: 220,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(state.goodCardData!.price),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text('Название: ${state.goodCardData!.name}'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text('Арт: ${state.goodCardData!.art}'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text('В наличии: ${state.goodCardData!.warehouses.length}'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AddToCartBtn extends StatelessWidget {
  final GoodsItemPageCubit bloc;
  final GoodsItemPageState state;

  const _AddToCartBtn({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 600),
          margin: const EdgeInsets.only(bottom: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Цена: ${state.goodCardData!.price}₽'),
            ],
          ),
        ),
      ],
    );
  }
}
