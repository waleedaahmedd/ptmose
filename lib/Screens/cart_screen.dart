import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/cart_view_model.dart';

import '../widget/app_bar_widget.dart';
import '../widget/cart_items_list_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (_, cartViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          homeButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children:  [
              Text('Total Items: ${cartViewModel.getCartCount}'),
              Flexible(child: CartItemsListWidget()),
            ],
          ),
        ),
      );
    });
  }
}
