import 'package:product_catalog/model/product.dart';

abstract class HistoryDatabaseBase {
  Future<int> saveProduct(Product product);
  Future<List<Product>> getAllProducts();
}
