import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/main_page/main_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/main_page/main_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainPageRoute extends GoRoute {
  static const pageName = 'Start page';
  static const route = '/';

  MainPageRoute()
      : super(
          path: route,
          name: pageName,
          builder: (context, state) => BlocProvider(
            create: (context) => MainPageCubit(
              context.read<AuthService>(),
              context.read<UserDataService>(),
              context.read<ShoppingCartService>(),
            ),
            child: const MainPage(),
          ),
        );
}
