import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/cart_view_model.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../utils/custom_font_style.dart';
import '../view_model/auth_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/cart_items_list_widget.dart';
import '../widget/custom_button_1.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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
          child: cartViewModel.getOrderItemList.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: Icon(
                      Icons.remove_shopping_cart_outlined,
                      size: 100,
                      color: CustomColors.tintPurple,
                    )),
                    const GoogleFontText1(
                      data: 'EMPTY',
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GoogleFontText1(
                        data: 'Total Wines: ${cartViewModel.getCartCount}',
                      ),
                    ),
                    //Text('Total Wines: ${cartViewModel.getCartCount}const '),

                    const Expanded(child: CartItemsListWidget()),
                    Align(
                        alignment: Alignment.centerRight,
                        child: GoogleFontText5(
                          data:
                              'Total Amount: \$ ${cartViewModel.getTotalAmount.toStringAsFixed(2)}',
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomButton1(
                      text: 'CHECKOUT',
                      onPressed: () async {
                        Provider.of<AuthViewModel>(context, listen: false)
                                .getGuestUser
                            ? Navigator.of(context).pushNamed('/login')
                            : await cartViewModel.callStripePayment(
                                userId: Provider.of<AuthViewModel>(context,
                                        listen: false)
                                    .getUserDataResponse
                                    .id!);
                        //await Stripe.instance.presentPaymentSheet();
                        /*   Provider.of<AuthViewModel>(context, listen: false)
                          .getGuestUser
                      ? Navigator.of(context).pushNamed('/login')
                      : cartViewModel.callSubmitOrder(
                          Provider.of<AuthViewModel>(context, listen: false)
                              .getUserDataResponse
                              .id, context);*/
                      },
                    ),
                  ],
                ),
        ),
      );
    });
  }
}
