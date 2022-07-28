import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/responses/wines_response.dart';
import '../models/responses/wine_detail_response.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/cart_view_model.dart';

class CartItemsListWidget extends StatelessWidget {
  const CartItemsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartViewModel>(builder: (_, cartViewModel, __) {
      return ListView.builder(
        //physics:
        //listScrollable == false ? const NeverScrollableScrollPhysics() : null,
        itemCount: cartViewModel.getCartWineList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: GestureDetector(
              onTap: () {
                /* Provider.of<CartViewModel>(context, listen: false)
                    .callWineDetails(cartViewModel.getCartWineList[index].id)
                    .then((value) => Navigator.of(context)
                        .pushNamed('/wines_details', arguments: false));*/
              },
              child: SizedBox(
                width: double.infinity,
                height: 130.h,
                child: Card(
                  elevation: 10,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Stack(
                    children: [
                       Positioned.fill(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: (){
                              cartViewModel.deleteItemFromCart(index);
                            },
                            icon: const Icon(Icons.delete_forever_rounded,color: CustomColors.purple,),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 20),
                            child: Center(
                              child: Image.network(
                                '${cartViewModel.getCartWineList[index].image}',
                                width: 50,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GoogleFontText4(
                                    data:
                                        '${cartViewModel.getCartWineList[index].wineName}',
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          NormalFontText5(
                                              data:
                                                  '${cartViewModel.getCartWineList[index].wineType}'),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          NormalFontText2(
                                              data:
                                                  '${cartViewModel.getCartWineList[index].age}'),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: CustomColors.tintGolden,
                                    width: 100,
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if (cartViewModel
                                                    .getOrderItemList[index]
                                                    .quantity! >
                                                1) {
                                              cartViewModel
                                                  .removeOrderItemQuantity(
                                                      index, 1);
                                            }
                                          },
                                          child: Container(
                                            height: 20.h,
                                            width: 20.w,
                                            decoration: const BoxDecoration(
                                                color: CustomColors.purple,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w800,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Center(
                                              child: NormalFontText1(
                                            data:
                                                '${cartViewModel.getOrderItemList[index].quantity}',
                                          )),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            cartViewModel.addOrderItemQuantity(
                                                index, 1);
                                          },
                                          child: Container(
                                            height: 20.h,
                                            width: 20.w,
                                            decoration: const BoxDecoration(
                                                color: CustomColors.purple,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            color: CustomColors.golden,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20),
                              child: NormalFontText5(
                                  data:
                                      '\$ ${cartViewModel.getOrderItemList[index].amount!.toStringAsFixed(2)}'),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
