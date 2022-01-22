import 'package:product_catalog/model/product.dart';

abstract class ProductDatabaseBase {
  Future<List<Product>> searchForProducts(
    String searchText,
    int offset,
    int limit,
  );
}
