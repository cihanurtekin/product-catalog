import 'package:product_catalog/base/product_database_base.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/service/base/product_database_service.dart';
import 'package:product_catalog/service/product_database_service_mercadolibre.dart';

class ProductDatabaseRepository implements ProductDatabaseBase {
  final ProductDatabaseService _service =
      locator<MercadolibreProductDatabaseService>();

  @override
  Future<List<Product>> searchForProducts(
    String searchText,
    int offset,
    int limit,
  ) async {
    return await _service.searchForProducts(searchText, offset, limit);
  }
}
