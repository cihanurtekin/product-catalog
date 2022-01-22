import 'package:product_catalog/base/history_database_base.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/service/base/history_database_service.dart';
import 'package:product_catalog/service/history_database_service_sqflite.dart';

class HistoryDatabaseRepository implements HistoryDatabaseBase {
  final HistoryDatabaseService _service =
      locator<SqfliteHistoryDatabaseService>();

  @override
  Future<int> saveProduct(Product product) async {
    return await _service.saveProduct(product);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    return await _service.getAllProducts();
  }
}
