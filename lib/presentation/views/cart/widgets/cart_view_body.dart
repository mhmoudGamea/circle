import 'package:circle/presentation/views/cart/widgets/cart_list.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CartList(),
        ),
      ],
    );
  }
}
