import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/my_reservation_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/drawer_widget.dart';
import '../widget/testing_vertical_list_widget.dart';
import '../widget/wineries_vertical_list_widget.dart';

class MyReservationScreen extends StatefulWidget {
  const MyReservationScreen({Key? key}) : super(key: key);

  @override
  _MyReservationScreenState createState() => _MyReservationScreenState();
}

class _MyReservationScreenState extends State<MyReservationScreen> {

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<MyReservationViewModel>(context, listen: false).callTastingList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MyReservationViewModel>(
        builder: (_, myReservationViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: CustomColors.tintPurple,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          myReservationViewModel
                              .setConfirmedReservationsList(true);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: myReservationViewModel
                                    .getConfirmedReservationsList
                                ? CustomColors.purple
                                : null,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                                child: NormalFontText3(
                              data: 'CONFIRMED',
                            )),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          myReservationViewModel
                              .setConfirmedReservationsList(false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: myReservationViewModel
                                    .getConfirmedReservationsList
                                ? null
                                : CustomColors.purple,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            child: Center(
                                child: NormalFontText3(
                              data: 'UNCONFIRMED',
                            )),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                /* child: Row(
                    children: [
                      Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: CustomColors.purple,
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: NormalFontText3(
                              data: 'CONFIRMED',
                            ),
                          )),
                      NormalFontText3(
                        data: 'UNCONFIRMED',
                      )
                    ],
                  )*/
              ),
              SizedBox(
                height: 20.h,
              ),
              const NormalFontText1(
                data: 'MY RESERVATIONS',
              ),
              SizedBox(
                height: 10.h,
              ),
              //TODO: call List
              Flexible(
                child: TestingVerticalListWidget(
                    tastingList: myReservationViewModel.getTastingList, listScrollable: true,),
              ),
            ],
          ),
        ),
        //drawer: DrawerWidget(),
      );
    });
  }
}
