import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/service/base/history_database_service.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteHistoryDatabaseService implements HistoryDatabaseService {
  Database? _database;

  final String _productsTableName = "products";
  final String _id = "id";
  final String _localId = "localId";
  final String _title = "title";
  final String _subtitle = "subtitle";
  final String _thumbnail = "thumbnail";
  final String _status = "status";
  final String _warranty = "warranty";
  final String _currencyId = "currency_id";
  final String _price = "price";

  Future<Database?> _getDatabase() async {
    if (_database == null) {
      String filePath = await getDatabasesPath();
      String databasePath = join(filePath, "products.db");
      _database = await openDatabase(
        databasePath,
        version: 1,
        onCreate: _createTable,
      );
    }
    return _database;
  }

  Future<void> _createTable(Database db, int versiyon) async {
    await db.execute('''
      CREATE TABLE $_productsTableName (
      $_localId INTEGER NOT NULL UNIQUE PRIMARY KEY AUTOINCREMENT,
      $_id TEXT NOT NULL,
      $_title TEXT NOT NULL,
      $_subtitle TEXT DEFAULT '',
      $_thumbnail TEXT DEFAULT '',
      $_status TEXT DEFAULT '',
      $_warranty TEXT DEFAULT '',
      $_currencyId TEXT DEFAULT '',
      $_price INTEGER DEFAULT 0);
    ''');
  }

  @override
  Future<int> saveProduct(Product product) async {
    Database? db = await _getDatabase();
    if (db != null) {
      await _deleteProductById(product.id);
      return await db.insert(_productsTableName, product.toMap());
    }
    return -1;
  }

  @override
  Future<List<Product>> getAllProducts() async {
    Database? db = await _getDatabase();
    List<Product> products = [];

    if (db != null) {
      List<Map<String, dynamic>> productsMap = await db.query(
        _productsTableName,
        orderBy: "$_localId desc",
      );

      for (Map<String, dynamic> m in productsMap) {
        Map<String, dynamic> productMap = Map.of(m);
        Product p = Product.fromMap(productMap);
        if (products.length < 5) {
          products.add(p);
        } else {
          await _deleteProductById(p.id);
        }
      }
    }
    return List.from(products);
  }

  Future<int> _deleteProductById(String id) async {
    Database? db = await _getDatabase();
    if (db != null) {
      return await db.delete(
        _productsTableName,
        where: "$_id = ?",
        whereArgs: [id],
      );
    }
    return 0;
  }
}
