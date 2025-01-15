import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/cart/cart_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/cart/cart_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartPageRoute extends GoRoute {
  static const pageName = 'Cart page';
  static const route = '/cart';

  CartPageRoute()
      : super(
          path: route,
          name: pageName,
          builder: (context, state) => BlocProvider(
            create: (context) => CartPageCubit(
              context.read<ShoppingCartService>(),
              context.read<UserDataService>(),
            ),
            child: const CartPage(),
          ),
        );
}
