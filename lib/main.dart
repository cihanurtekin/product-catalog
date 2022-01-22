import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:product_catalog/generated/l10n.dart';
import 'package:product_catalog/helper/locator.dart';
import 'package:product_catalog/helper/routes.dart';
import 'package:product_catalog/view/products_page.dart';
import 'package:product_catalog/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext context) => ProductsViewModel(),
        child: ProductsPage(),
      ),
      routes: Routes.getRoutes(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}