import 'package:flutter/material.dart';
import 'package:product_catalog/model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product _product;

  const ProductDetailPage(this._product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(_product.id),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: ListView(
        children: [
          const SizedBox(width: double.infinity),
          Center(
            child: Image.network(
              _product.thumbnail,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width / 2,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _product.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 36),
          _buildAllDetails(),
        ],
      ),
    );
  }

  Widget _buildAllDetails() {
    return Column(
      children: [
        _buildDetailRow("Title: ", _product.title),
        _buildDetailRow("Subtitle: ", _product.subtitle),
        _buildDetailRow("Price: ", "${_product.price} ${_product.currencyId}"),
        _buildDetailRow("Status: ", _product.status),
        _buildDetailRow("Warranty: ", _product.status),
      ],
    );
  }

  Widget _buildDetailRow(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              detail,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
