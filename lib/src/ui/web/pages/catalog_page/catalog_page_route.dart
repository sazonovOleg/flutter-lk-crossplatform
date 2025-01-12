import 'package:b2b_client_lk/src/features/catalog/domain/catalog_service.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page.dart';
import 'package:b2b_client_lk/src/ui/web/pages/catalog_page/catalog_page_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CatalogPageRoute extends GoRoute {
  static const pageName = 'Catalog page';
  static const route = '/catalog';

  CatalogPageRoute()
      : super(
    path: route,
    name: pageName,
    builder: (context, state) => BlocProvider(
      create: (context) => CatalogPageCubit(
        context.read<CatalogService>(),
      ),
      child: const CatalogPage(),
    ),
  );
}
