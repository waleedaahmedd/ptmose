import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/testing_list_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/testing_vertical_list_widget.dart';

class TastingListScreen extends StatefulWidget {
  const TastingListScreen({Key? key}) : super(key: key);

  @override
  State<TastingListScreen> createState() => _TastingListScreenState();
}

class _TastingListScreenState extends State<TastingListScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<TestingListViewModel>(context, listen: false)
          .callTestingListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TestingListViewModel>(builder: (_, testingListViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const GoogleFontText1(
                data: 'Tasting',
              ),
              SizedBox(
                height: 10.h,
              ),
              //TODO: call List
              Flexible(
                child: TestingVerticalListWidget(
                  tastingList: testingListViewModel.getTastingList, listScrollable: true,),
              ),
            ],
          ),
        ),
        //drawer: DrawerWidget(),
      );
    });
  }
}
