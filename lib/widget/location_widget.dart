import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_colors.dart';
import 'package:ptmose/view_model/locations_view_model.dart';

import '../utils/custom_font_style.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationsViewModel>(builder: (_, locationViewModel, __) {
      return locationViewModel.getLocationList.isNotEmpty
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const NormalFontText1(
                      data: 'LOCATION',
                    ),
                    GestureDetector(
                      onTap: () {
                        locationViewModel.setShowLocationList(!locationViewModel.getShowLocationList);
                      },
                      child: const NormalFontText2(
                        data: 'CHANGE',
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  height: 60.h,
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: GoogleFontText4(
                            data: locationViewModel.getSelectedLocation.name!,
                          ),
                        ),
                        Image.network(
                          locationViewModel.getSelectedLocation.img!,
                          /*height: 65,*/
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: locationViewModel.getShowLocationList,
                  child: Column(
                    children: [
                      const Divider(
                        height: 20,
                        thickness: 2,
                        color: CustomColors.golden,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: locationViewModel.getLocationList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              locationViewModel.setShowLocationList(false);
                              locationViewModel.setSelectedLocation(
                                  locationViewModel.getLocationList[index]);
                            },
                            child: SizedBox(
                              height: 40.h,
                              width: double.infinity,
                              child: Card(
                                elevation: 10,
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: GoogleFontText4(
                                        data: locationViewModel
                                            .getLocationList[index].name!,
                                      ),
                                    ),
                                    Image.network(
                                      locationViewModel
                                          .getLocationList[index].img!,
                                      /*height: 65,*/
                                      fit: BoxFit.fill,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            )
          : Container();
    });
  }
}
