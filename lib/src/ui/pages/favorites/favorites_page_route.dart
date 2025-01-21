import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesPageRoute extends GoRoute {
  static const pageName = 'Favorites page';
  static const route = '/favorites';

  FavoritesPageRoute()
      : super(
          path: route,
          name: pageName,
          builder: (context, state) => BlocProvider(
            create: (context) => FavoritesPageCubit(
              context.read<FavoritesService>(),
            ),
            child: const FavoritesPage(),
          ),
        );
}
