import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';
import 'widgets/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'المنتجات',
      ),
      body: ProductsViewBody(),
    );
  }
}
