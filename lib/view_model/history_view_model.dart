import 'package:flutter/material.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/repository/history_database_repository.dart';

class HistoryViewModel with ChangeNotifier {
  final HistoryDatabaseRepository _historyDatabaseRepository =
      locator<HistoryDatabaseRepository>();

  final List<Product> _products = [];

  List<Product> get products => _products;

  bool _isLoading = true;

  bool get isLoading => _isLoading;

  HistoryViewModel(){
    _getSavedProducts();
  }

  Future<void> _getSavedProducts() async {
    List<Product> savedProducts =
        await _historyDatabaseRepository.getAllProducts();
    _products.addAll(savedProducts);
    _isLoading = false;
    notifyListeners();
  }
}
