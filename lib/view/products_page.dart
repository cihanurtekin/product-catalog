import 'package:flutter/material.dart';
import 'package:product_catalog/generated/l10n.dart';
import 'package:product_catalog/view/common/product_list.dart';
import 'package:product_catalog/view_model/common/product_list_view_model.dart';
import 'package:product_catalog/view_model/products_view_model.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.history),
        onPressed: () {
          ProductsViewModel viewModel = Provider.of<ProductsViewModel>(
            context,
            listen: false,
          );
          viewModel.onHistoryPressed(context);
        },
      ),
      title: Container(
        width: double.infinity,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: '${S.of(context).search}...',
              border: InputBorder.none,
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  ProductsViewModel viewModel = Provider.of<ProductsViewModel>(
                    context,
                    listen: false,
                  );
                  viewModel.onSearchTextChanged('');
                },
              ),
            ),
            onChanged: (String value) {
              ProductsViewModel viewModel = Provider.of<ProductsViewModel>(
                context,
                listen: false,
              );
              viewModel.onSearchTextChanged(value);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Consumer<ProductsViewModel>(
      builder: (context, viewModel, child) => viewModel.products.isNotEmpty
          ? ChangeNotifierProvider(
              create: (BuildContext context) => ProductListViewModel(),
              child: ProductList(
                products: viewModel.products,
                scrollController: viewModel.scrollController,
              ),
            )
          : viewModel.isSearching()
              ? const Center(child: CircularProgressIndicator())
              : Center(
                  child: Text(S.of(context).typeMoreThanMinCharacters),
                ),
    );
  }
}
