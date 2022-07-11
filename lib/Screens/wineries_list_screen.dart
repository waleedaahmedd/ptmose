import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/widget/wineries_vertical_list_widget.dart';

import '../utils/custom_font_style.dart';
import '../view_model/wineriesListViewModel.dart';
import '../widget/app_bar_widget.dart';
import '../widget/location_widget.dart';
import '../widget/testing_vertical_list_widget.dart';

class WineriesListScreen extends StatefulWidget {
  const WineriesListScreen({Key? key}) : super(key: key);

  @override
  State<WineriesListScreen> createState() => _WineriesListScreenState();
}

class _WineriesListScreenState extends State<WineriesListScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<WineriesListViewModel>(context, listen: false)
          .callWineriesList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WineriesListViewModel>(builder: (_, wineriesListViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LocationWidget(
                name: 'Napa Country',
                image: 'assets/images/LocationBoxImg.png',
              ),
              SizedBox(
                height: 20.h,
              ),
              const GoogleFontText1(
                data: 'Wineries',
              ),
              SizedBox(
                height: 10.h,
              ),
              //TODO: call List
              Flexible(
                child: WineriesVerticalListWidget(
                  wineriesList: wineriesListViewModel.getWineriesList, listScrollable: true,),
              ),
            ],
          ),
        ),
        //drawer: DrawerWidget(),
      );
    });
  }
}
