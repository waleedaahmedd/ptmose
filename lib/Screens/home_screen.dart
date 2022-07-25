import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/utils/custom_font_style.dart';
import 'package:ptmose/view_model/locations_view_model.dart';

import '../utils/custom_colors.dart';
import '../view_model/home_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/bottom_buttons_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/tasting_horizontal_list_widget.dart';
import '../widget/location_widget.dart';
import '../widget/wineries_vertical_list_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _callApis();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationsViewModel>(builder: (_, locationViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          headings: true,
          cartButton: true,
        ),
        drawer: const DrawerWidget(),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LocationWidget(

                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const NormalFontText1(
                          data: 'FEATURED TASTINGS',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/tasting_list');
                          },
                          child: const NormalFontText2(
                            data: 'SEE ALL >',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: call List
                    locationViewModel.getTastingList.isEmpty?
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
                        child: NormalFontText1(
                          data: 'Sorry No Tastings Are Found At This Location',
                        ),
                      ),
                    ):
                    SizedBox(
                      height: 300.h,
                      width: double.infinity,
                      child: TastingHorizontalListWidget(
                        tastingList: locationViewModel.getTastingList,
                        listScrollable: true,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const NormalFontText1(
                          data: 'RECOMMENDED WINERIES',
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/wineries_list');
                          },
                          child: const NormalFontText2(
                            data: 'SEE ALL >',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //TODO: call List
                    locationViewModel.getWineriesList.isEmpty
                        ? const Center(
                            child: NormalFontText1(
                              data: 'Sorry No Wineries Are Found At This Location',
                            ),
                          )
                        : WineriesVerticalListWidget(
                            wineriesList: locationViewModel.getWineriesList,
                            listScrollable: false,
                          ),
                    SizedBox(
                      height: 60.h,
                    )
                  ],
                ),
              ),
            ),
            const BottomButtonsWidget()
          ],
        ),
      );
    });
  }

  void _callApis() {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Provider.of<LocationsViewModel>(context, listen: false)
          .callLocationsListApi(context);
    });
  }


}
