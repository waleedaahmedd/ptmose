import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/responses/wineries_and_testing_response.dart';
import '../models/responses/wineries_response.dart';
import '../utils/custom_colors.dart';
import '../utils/custom_font_style.dart';
import '../view_model/winery_details_view_model.dart';

class WineriesVerticalListWidget extends StatelessWidget {
  const WineriesVerticalListWidget(
      {Key? key, required this.wineriesList, required this.listScrollable})
      : super(key: key);
  final bool listScrollable;
  final List<Wineries> wineriesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      itemCount: wineriesList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<WineryDetailsViewModel>(context, listen: false)
                  .callWineriesDetails(wineriesList[index].id).then((value) =>  Navigator.of(context).pushNamed('/wineryDetails'));

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
                child: Row(
                  children: [
                    Image.network(
                      '${wineriesList[index].wineryImage}',
                      width: 80.w,
                      height: 130.h,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GoogleFontText4(
                              data: '${wineriesList[index].wineryName}',
                            ),
                            NormalFontText4(
                                data: '${wineriesList[index].wineryTags}'),
                            Row(
                              children: [
                                Icon(
                                  Icons.watch_later_outlined,
                                  color: CustomColors.purple,
                                  size: 15.h,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                NormalFontText4(
                                    data: '${wineriesList[index].startTime} - ${wineriesList[index].endTime} PST'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
