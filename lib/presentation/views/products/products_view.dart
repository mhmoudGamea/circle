import 'package:easy_localization/easy_localization.dart';
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
        title: 'products.appBarTitle'.tr(),
      ),
      body: ProductsViewBody(),
    );
  }
}
