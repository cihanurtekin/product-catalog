import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  static const String idKey = 'id';
  static const String titleKey = 'title';
  static const String subtitleKey = 'subtitle';
  static const String thumbnailKey = 'thumbnail';
  static const String statusKey = 'status';
  static const String warrantyKey = 'warranty';
  static const String currencyIdKey = 'currency_id';
  static const String priceKey = 'price';

  late String id;
  late String title;
  late String subtitle;
  late String thumbnail;
  late String status;
  late String warranty;
  late String currencyId;
  late double price;

  Map<String, dynamic> toMap() {
    return {
      idKey: id,
      titleKey: title,
      subtitleKey: subtitle,
      thumbnailKey: thumbnail,
      statusKey: status,
      warrantyKey: warranty,
      currencyIdKey: currencyId,
      priceKey: price,
    };
  }

  Product.fromMap(Map<String, dynamic> map) {
    id = map[idKey] ?? '';
    title = map[titleKey] ?? '';
    subtitle = map[subtitleKey] ?? '';
    thumbnail = map[thumbnailKey] ?? '';
    status = map[statusKey] ?? '';
    warranty = map[warrantyKey] ?? '';
    currencyId = map[currencyIdKey] ?? '';
    price = double.parse((map[priceKey] ?? 0).toString());
  }
}
