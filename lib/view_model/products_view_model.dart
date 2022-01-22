import 'package:flutter/material.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/helper/routes.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/repository/product_database_repository.dart';

class ProductsViewModel with ChangeNotifier {
  final ProductDatabaseRepository _productDatabaseRepository =
      locator<ProductDatabaseRepository>();

  final ScrollController _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  final int _limit = 10;
  final int _minTextLengthToSearch = 3;

  List<Product> _products = [];

  List<Product> get products => _products;

  int _currentPage = 0;

  String _searchText = '';

  bool isSearching() {
    return _searchText.trim().length >= _minTextLengthToSearch;
  }

  ProductsViewModel() {
    scrollController.addListener(_scrollListener);
    _getProducts();
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      _getProducts();
    }
  }

  void onSearchTextChanged(String searchText) {
    _clearProductList();
    _searchText = searchText;
    if (isSearching()) {
      _getProducts();
    }
  }

  void _clearProductList() {
    _products = [];
    _currentPage = 0;
    //_searchText = '';
    notifyListeners();
  }

  void onPageScrolled() {
    _getProducts();
  }

  Future<void> _getProducts() async {
    List<Product> newProducts =
        await _productDatabaseRepository.searchForProducts(
      _searchText,
      _currentPage * _limit,
      _limit,
    );
    _products.addAll(newProducts);
    _currentPage++;
    notifyListeners();
  }

  void onHistoryPressed(BuildContext context) {
    Navigator.pushNamed(context, Routes.HISTORY_PAGE);
  }
}
