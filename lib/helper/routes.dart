import 'package:flutter/material.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/view/history_page.dart';
import 'package:product_catalog/view/product_detail_page.dart';
import 'package:product_catalog/view_model/history_view_model.dart';
import 'package:product_catalog/view_model/product_detail_view_model.dart';
import 'package:provider/provider.dart';

class Routes {
  static const String HISTORY_PAGE = '/history_page';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      HISTORY_PAGE: (BuildContext context) => ChangeNotifierProvider(
            create: (context) => HistoryViewModel(),
            child: const HistoryPage(),
          ),
    };
  }

  static openProductDetailPage(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return ChangeNotifierProvider(
            create: (context) => ProductDetailViewModel(),
            child: ProductDetailPage(product),
          );
        },
      ),
    );
  }
}
