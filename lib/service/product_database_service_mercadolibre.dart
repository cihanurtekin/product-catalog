import 'dart:convert';

import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/service/base/product_database_service.dart';
import 'package:http/http.dart' as http;

class MercadolibreProductDatabaseService implements ProductDatabaseService {
  final String _baseUrl = 'https://api.mercadolibre.com';

  @override
  Future<List<Product>> searchForProducts(
    String searchText,
    int offset,
    int limit,
  ) async {
    String url = _baseUrl +
        '/sites/MLU/search?'
            'q=$searchText'
            '&offset=$offset'
            '&limit=$limit';

    List<Product> products = [];

    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic>? body = jsonDecode(response.body);
      if (body != null) {
        List<dynamic>? productMapList = body['results'];
        if (productMapList != null) {
          for (Map<String, dynamic>? productMap in productMapList) {
            if(productMap != null){
              Product p = Product.fromMap(productMap);
              products.add(p);
            }
          }
        }
      }
    }

    return List<Product>.from(products);
  }
}
