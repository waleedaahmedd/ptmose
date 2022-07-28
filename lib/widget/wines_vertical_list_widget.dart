import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/wines_response.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/cart_view_model.dart';

class WinesVerticalListWidget extends StatelessWidget {
  const WinesVerticalListWidget(
      {Key? key, required this.winesList, required this.listScrollable})
      : super(key: key);
  final bool listScrollable;
  final List<Wine> winesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      itemCount: winesList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<CartViewModel>(context, listen: false)
                  .callWineDetails(winesList[index].id)
                  .then((value) => Navigator.of(context)
                  .pushNamed('/wines_details', arguments: false));
            },
            child: SizedBox(
              width: double.infinity,
              height: 100.h,
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20, left: 20),
                          child: Center(
                            child: Image.network(
                              '${winesList[index].image}',
                              width: 30.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GoogleFontText4(
                                  data: '${winesList[index].wineName}',
                                ),

                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        NormalFontText5(
                                            data:
                                                '${winesList[index].wineType}'),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        NormalFontText2(
                                            data: '${winesList[index].age}'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),

                                  ],
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
                        child:   Container(
                          color: CustomColors.golden,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
                            child: NormalFontText5(
                                data: '\$ ${winesList[index].price!.toStringAsFixed(2)}'),
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
  }
}
