import 'package:b2b_client_lk/src/features/catalog/domain/models/catalog_category_model.dart/catalog_category_model.dart';

class CatalogPageState {
  List<CatalogCategory> categoryList;
  final bool isLoading;
  final String groupId;

  CatalogPageState({
    required this.categoryList,
    this.isLoading = true,
    this.groupId = '',
  });
}
