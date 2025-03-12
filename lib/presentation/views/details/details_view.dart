import 'package:circle/data/models/home/latest_products/product_model.dart';
import 'package:circle/presentation/providers/details/details_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_app_bar.dart';
import 'widgets/details_view_body.dart';

class DetailsView extends StatefulWidget {
  final ProductModel productModel;
  const DetailsView({super.key, required this.productModel});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    super.initState();
    _calculatePrice();
  }

  Future<void> _calculatePrice() async {
    Future.microtask(() {
      if (mounted) {
        context
            .read<DetailsProvider>()
            .getTotlaPrice(price: widget.productModel.price);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showToolBar: true,
        title: 'details.appBarTitle'.tr(),
      ),
      body: DetailsViewBody(
        productModel: widget.productModel,
      ),
    );
  }
}
