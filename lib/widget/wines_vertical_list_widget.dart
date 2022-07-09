import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ptmose/models/responses/wineries_model.dart';

import '../models/responses/wines_model.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';

class WinesVerticalListWidget extends StatelessWidget {
  const WinesVerticalListWidget(
      {Key? key, required this.winesList, required this.listScrollable})
      : super(key: key);
  final bool listScrollable;
  final List<WinesModel> winesList;

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
              Navigator.of(context).pushNamed('/wineryDetails');
            },
            child: SizedBox(
              width: double.infinity,
              //height: 150.h,
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
                        SizedBox(
                          width: 80.w,
                          // height: 150.h,
                          child: Image.asset(
                            '${winesList[index].image}',
                            /*height: 65,*/
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GoogleFontText4(
                                  data: '${winesList[index].title}',
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        NormalFontText5(
                                            data:
                                                '${winesList[index].description}'),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        NormalFontText2(
                                            data: '${winesList[index].year}'),
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
