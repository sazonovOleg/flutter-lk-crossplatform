import 'package:b2b_client_lk/src/features/auth/data/auth_api.dart';
import 'package:b2b_client_lk/src/features/auth/data/auth_repository.dart';
import 'package:b2b_client_lk/src/features/auth/domain/auth_service.dart';
import 'package:b2b_client_lk/src/features/catalog/data/catalog_api.dart';
import 'package:b2b_client_lk/src/features/catalog/data/catalog_repository.dart';
import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/features/common/api/api_client.dart';
import 'package:b2b_client_lk/src/features/common/hive_storage/hive_storage.dart';
import 'package:b2b_client_lk/src/features/common/shared_pref/shared_pref.dart';
import 'package:b2b_client_lk/src/features/favorites/data/favorites_api.dart';
import 'package:b2b_client_lk/src/features/favorites/data/favorites_repository.dart';
import 'package:b2b_client_lk/src/features/favorites/data/favorites_storage.dart';
import 'package:b2b_client_lk/src/features/favorites/domain/favorites_service.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/data/shoping_cart_api.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/data/shoping_cart_repository.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/data/shopping_cart_storage.dart';
import 'package:b2b_client_lk/src/features/shopping_cart/domain/shopping_cart_service.dart';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_api.dart';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_repository.dart';
import 'package:b2b_client_lk/src/features/user_data/data/user_data_storage.dart';
import 'package:b2b_client_lk/src/features/user_data/domain/user_data_service.dart';
import 'package:b2b_client_lk/src/ui/common/theme/theme.dart';
import 'package:b2b_client_lk/src/ui/pages/auth_page/auth_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/cart/cart_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/catalog_page/catalog_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_page/goods_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/profile_page/profile_page_cubit.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Providers extends StatelessWidget {
  final Widget child;

  const Providers({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MainTheme>(
          create: (context) => const MainTheme(),
        ),
        RepositoryProvider<SharedPref>(
          create: (context) => SharedPref(),
        ),
        RepositoryProvider<HiveStorage>(
          create: (context) => HiveStorage(),
        ),
        RepositoryProvider<UserDataStorage>(
          create: (context) => UserDataStorage(
            context.read<HiveStorage>(),
            context.read<SharedPref>(),
          ),
        ),
        RepositoryProvider<ApiClient>(
          create: (context) => ApiClient(
            context.read<UserDataStorage>(),
          ),
        ),
        RepositoryProvider<UserDataApi>(
          create: (context) => UserDataApi(
            context.read<ApiClient>().dio,
          ),
        ),
        RepositoryProvider<UserDataRepository>(
          create: (context) => UserDataRepository(
            context.read<UserDataApi>(),
            context.read<UserDataStorage>(),
          ),
        ),
        RepositoryProvider<UserDataService>(
          create: (context) => UserDataService(
            context.read<UserDataRepository>(),
          ),
        ),
        RepositoryProvider<AuthApi>(
          create: (context) => AuthApi(
            context.read<ApiClient>().dio,
          ),
        ),
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(
            context.read<AuthApi>(),
            context.read<UserDataStorage>(),
          ),
        ),
        RepositoryProvider<AuthService>(
          create: (context) => AuthService(
            context.read<AuthRepository>(),
            context.read<UserDataService>(),
          ),
        ),
        RepositoryProvider<CatalogApi>(
          create: (context) => CatalogApi(
            context.read<ApiClient>().dio,
          ),
        ),
        RepositoryProvider<CatalogRepository>(
          create: (context) => CatalogRepository(
            context.read<CatalogApi>(),
          ),
        ),
        RepositoryProvider<CatalogService>(
          create: (context) => CatalogService(
            context.read<CatalogRepository>(),
          ),
        ),
        RepositoryProvider<ShoppingCartApi>(
          create: (context) => ShoppingCartApi(
            context.read<ApiClient>().dio,
          ),
        ),
        RepositoryProvider<ShoppingCartStorage>(
          create: (context) => ShoppingCartStorage(
            context.read<HiveStorage>(),
          ),
        ),
        RepositoryProvider<ShoppingCartRepository>(
          create: (context) => ShoppingCartRepository(
            context.read<ShoppingCartApi>(),
            context.read<ShoppingCartStorage>(),
          ),
        ),
        RepositoryProvider<ShoppingCartService>(
          create: (context) => ShoppingCartService(
            context.read<ShoppingCartRepository>(),
          ),
        ),
        RepositoryProvider<FavoritesApi>(
          create: (context) => FavoritesApi(
            context.read<ApiClient>().dio,
          ),
        ),
        RepositoryProvider<FavoritesStorage>(
          create: (context) => FavoritesStorage(
            context.read<HiveStorage>(),
          ),
        ),
        RepositoryProvider<FavoritesRepository>(
          create: (context) => FavoritesRepository(
            context.read<FavoritesApi>(),
            context.read<FavoritesStorage>(),
          ),
        ),
        RepositoryProvider<FavoritesService>(
          create: (context) => FavoritesService(
            context.read<FavoritesRepository>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainPageCubit>(
            create: (context) => MainPageCubit(
              context.read<AuthService>(),
              context.read<UserDataService>(),
              context.read<ShoppingCartService>(),
            ),
          ),
          BlocProvider<AuthPageCubit>(
            create: (context) => AuthPageCubit(
              context.read<AuthService>(),
            ),
          ),
          BlocProvider<RecoveryPassCubit>(
            create: (context) => RecoveryPassCubit(
              context.read<AuthService>(),
            ),
          ),
          BlocProvider<CatalogPageCubit>(
            create: (context) => CatalogPageCubit(
              context.read<CatalogService>(),
            ),
          ),
          BlocProvider<ProfilePageCubit>(
            create: (context) => ProfilePageCubit(
              context.read<AuthService>(),
              context.read<UserDataService>(),
            ),
          ),
          BlocProvider<GoodsPageCubit>(
            create: (context) => GoodsPageCubit(
              context.read<CatalogService>(),
            ),
          ),
          BlocProvider<GoodsItemPageCubit>(
            create: (context) => GoodsItemPageCubit(
              context.read<CatalogService>(),
            ),
          ),
          BlocProvider<CartPageCubit>(
            create: (context) => CartPageCubit(
              context.read<ShoppingCartService>(),
              context.read<UserDataService>(),
            ),
          ),
          BlocProvider<FavoritesPageCubit>(
            create: (context) => FavoritesPageCubit(
              context.read<FavoritesService>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
