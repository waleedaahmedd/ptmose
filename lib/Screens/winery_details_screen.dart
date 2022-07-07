import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/view_model/winery_details_view_model.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../widget/app_bar_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/tasting_horizontal_list_widget.dart';

class WineryDetailsScreen extends StatefulWidget {
  const WineryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WineryDetailsScreen> createState() => _WineryDetailsScreenState();
}

class _WineryDetailsScreenState extends State<WineryDetailsScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<WineryDetailsViewModel>(context, listen: false)
          .callFeaturedTestingListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WineryDetailsViewModel>(
        builder: (_, wineryDetailsViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          homeButton: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        'assets/images/WineryProfileHeadPic.png',
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 80.0, left: 20, right: 20),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: CustomColors.purple,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const GoogleFontText3(
                                    data: 'Vinous Reverie Wine Merchant',
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20.0),
                                              child: Center(
                                                  child: NormalFontText6(
                                                data: 'SHOP WINES',
                                              )),
                                            )),
                                      ),
                                      Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.0,
                                                vertical: 20.0),
                                            child: Center(
                                                child: Icon(
                                              Icons.calendar_today_outlined,
                                              size: 15,
                                              color: CustomColors.golden,
                                            )),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const NormalFontText6(
                      data: 'ABOUT THE WINERY',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    const NormalFontText2(
                      data:
                          'xadcsdskksc shflhfksjdf hfkshfkjsfhskf  fsfhksfheihfase lfhsjfhsofhsof lsfjhsslkfsjfljf flsjflsjflskjfle lsjdfljsfklejl sfakjkdsf fdkfjkdfjkdfkdf dkfjdkjfijfirr frirfjofijspjfpjef fsfjpsrjfpsjoisfr fpsfjsifjiosroisfr ',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const NormalFontText6(
                      data: 'KEY DETAILS',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: CustomColors.golden,
                          size: 15.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const NormalFontText2(data: '5:00 PM - 7:00 PM PST'),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: CustomColors.golden,
                          size: 15.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        const NormalFontText2(
                            data: 'Vinous Reverie Winery, Walnut Creek, CA'),
                      ],
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const GoogleFontText1(
                      data: 'Tasting',
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: call List
                    SizedBox(
                      height: 340.h,
                      width: double.infinity,
                      child: TastingHorizontalListWidget(
                          tastingList:
                              wineryDetailsViewModel.getFeaturedTestingList, listScrollable: true,),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
