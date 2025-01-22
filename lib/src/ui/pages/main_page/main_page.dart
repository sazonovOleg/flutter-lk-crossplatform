import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/components/loading_page.dart';
import 'package:b2b_client_lk/src/ui/pages/auth_page/auth_page.dart';
import 'package:b2b_client_lk/src/ui/pages/auth_page/auth_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_page/goods_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_page/goods_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_page_cubit.dart';
import 'main_page_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _State();
}

class _State extends State<MainPage> {
  @override
  void initState() {
    context.read<MainPageCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainPageCubit>();

    return BlocBuilder<MainPageCubit, MainPageState>(
      bloc: bloc,
      builder: (context, state) => state.isLoading
          ? const LoadingPage()
          : !state.isLoggedIn
              ? _AuthPage()
              : _GoodsPage()
    );
  }
}

class _AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPageCubit(
        context.read<AuthService>(),
      ),
      child: const AuthPage(),
    );
  }
}

class _GoodsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoodsPageCubit(
        context.read<CatalogService>(),
      ),
      child: const GoodsPage(),
    );
  }
}