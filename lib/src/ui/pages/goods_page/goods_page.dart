import 'package:b2b_client_lk/src/features/catalog/domain/models/goods_model/goods_model.dart';
import 'package:b2b_client_lk/src/ui/common/image.dart';
import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_page/goods_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'goods_cubit.dart';

class GoodsPage extends StatefulWidget {
  const GoodsPage({
    super.key,
  });

  @override
  State<GoodsPage> createState() => _State();
}

class _State extends State<GoodsPage> {
  @override
  void initState() {
    super.initState();
    context.read<GoodsPageCubit>().init();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GoodsPageCubit>(context);

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
        bottomSheet: state.goodsList.isEmpty && !state.isLoading
            ? _UpdateProfileBtn(
                bloc: bloc,
                state: state,
              )
            : null,
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
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          runSpacing: 15,
          spacing: 15,
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
    final maxWidth = width / 2 - 25;

    return InkWell(
      onTap: () => bloc.goToGoodsItem(context, item.id),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('${item.name}'),
            Img(
              imageUrl: item.img,
              height: 100,
              width: 100,
            ),
            Text('Цена: ${item.price}₽'),
          ],
        ),
      ),
    );
  }
}

class _UpdateProfileBtn extends StatelessWidget {
  final GoodsPageCubit bloc;
  final GoodsPageState state;

  const _UpdateProfileBtn({
    required this.bloc,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.only(top: height / 3.5),
      child: Column(
        children: [
          Text(state.emptyGoodsListMessage),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20, right: 20, top: 55),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () => bloc.updateGoodsList(),
              child: const Text(
                'Обновить товары',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}