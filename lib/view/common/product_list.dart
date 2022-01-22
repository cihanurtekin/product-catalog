import 'package:flutter/material.dart';
import 'package:product_catalog/model/product.dart';
import 'package:product_catalog/view_model/common/product_list_view_model.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  final ScrollController? scrollController;

  const ProductList({
    Key? key,
    required this.products,
    this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: products[index],
          child: _buildListTile(context),
        );
      },
    );
  }

  Widget _buildListTile(BuildContext context) {
    return Card(
      child: Consumer<Product>(
        builder: (context, product, child) => ListTile(
          leading: ClipOval(
            child: SizedBox(
              width: 48,
              height: 48,
              child: Image.network(
                product.thumbnail,
                fit: BoxFit.cover,
              ),
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text(
            product.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "Price: ${product.price} ${product.currencyId}",
          ),
          onTap: (){
            ProductListViewModel viewModel = Provider.of<ProductListViewModel>(
              context,
              listen: false,
            );
            viewModel.onProductItemPressed(context, product);
          },
        ),
      ),
    );
  }
}
