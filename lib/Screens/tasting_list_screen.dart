import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/locations_view_model.dart';
import '../view_model/testing_list_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/location_widget.dart';
import '../widget/testing_vertical_list_widget.dart';

class TastingListScreen extends StatefulWidget {
  const TastingListScreen({Key? key}) : super(key: key);

  @override
  State<TastingListScreen> createState() => _TastingListScreenState();
}

class _TastingListScreenState extends State<TastingListScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LocationsViewModel>(builder: (_, locationViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationWidget(),
              SizedBox(
                height: 20.h,
              ),
              const GoogleFontText1(
                data: 'Tasting',
              ),
              SizedBox(
                height: 10.h,
              ),
              //TODO: call List
              locationViewModel.getTastingListByLocation.isEmpty
                  ? const Expanded(
                      child: Center(
                        child: NormalFontText1(
                          data: 'Sorry No Tastings Are Found At This Location',
                        ),
                      ),
                    )
                  : Flexible(
                      child: TestingVerticalListWidget(
                        tastingList: locationViewModel.getTastingListByLocation,
                        listScrollable: true,
                      ),
                    ),
            ],
          ),
        ),
        //drawer: DrawerWidget(),
      );
    });
  }
}
