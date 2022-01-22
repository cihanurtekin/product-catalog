import 'package:get_it/get_it.dart';
import 'package:product_catalog/repository/history_database_repository.dart';
import 'package:product_catalog/repository/product_database_repository.dart';
import 'package:product_catalog/service/history_database_service_sqflite.dart';
import 'package:product_catalog/service/product_database_service_mercadolibre.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => MercadolibreProductDatabaseService());
  locator.registerLazySingleton(() => ProductDatabaseRepository());

  locator.registerLazySingleton(() => SqfliteHistoryDatabaseService());
  locator.registerLazySingleton(() => HistoryDatabaseRepository());
}
