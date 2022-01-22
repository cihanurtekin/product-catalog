import 'package:flutter/material.dart';
import 'package:product_catalog/generated/l10n.dart';
import 'package:product_catalog/view/common/product_list.dart';
import 'package:product_catalog/view_model/common/product_list_view_model.dart';
import 'package:product_catalog/view_model/history_view_model.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).history),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<HistoryViewModel>(
      builder: (context, viewModel, child) => viewModel.products.isNotEmpty
          ? ChangeNotifierProvider(
              create: (BuildContext context) => ProductListViewModel(),
              child: ProductList(products: viewModel.products),
            )
          : viewModel.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(S.of(context).noSavedProduct),
                ),
    );
  }
}
