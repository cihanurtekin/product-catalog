import 'package:flutter/material.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/helper/routes.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/repository/history_database_repository.dart';

class ProductListViewModel with ChangeNotifier {
  final HistoryDatabaseRepository _historyDatabaseRepository =
      locator<HistoryDatabaseRepository>();

  void onProductItemPressed(BuildContext context, Product product) {
    _historyDatabaseRepository.saveProduct(product);
    Routes.openProductDetailPage(context, product);
  }
}
