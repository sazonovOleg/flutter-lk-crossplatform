import 'package:b2b_client_lk/src/ui/pages/auth_page/auth_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/cart/cart_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/favorites/favorites_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_item_page/goods_item_route.dart';
import 'package:b2b_client_lk/src/ui/pages/goods_page/goods_route.dart';
import 'package:b2b_client_lk/src/ui/pages/main_page/main_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/profile_page/profile_page_route.dart';
import 'package:b2b_client_lk/src/ui/pages/recovery_pass_page/recovery_pass_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter routerConfig = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    MainPageRoute(),
    AuthPageRoute(),
    RecoveryPassRoute(),
    ProfilePageRoute(),
    GoodsPageRoute(),
    GoodsItemPageRoute(),
    CartPageRoute(),
    FavoritesPageRoute(),
  ],
);
