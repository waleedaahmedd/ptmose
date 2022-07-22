import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:ptmose/models/responses/Wines_response.dart';
import 'package:ptmose/models/responses/tastings_details_response.dart';
import 'package:ptmose/view_model/cart_view_model.dart';

import '../utils/custom_font_style.dart';

class WinesHorizontalListWidget extends StatelessWidget {
  const WinesHorizontalListWidget(
      {Key? key, required this.winesList, required this.listScrollable})
      : super(key: key);
  final List<TastingWines> winesList;
  final bool listScrollable;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:
          listScrollable == false ? const NeverScrollableScrollPhysics() : null,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 20),
      scrollDirection: Axis.horizontal,
      itemCount: winesList.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            width: 180.w,
            child: GestureDetector(
              onTap: () {
                Provider.of<CartViewModel>(context, listen: false)
                    .callWineDetails(winesList[index].wine!.id)
                    .then((value) => Navigator.of(context)
                        .pushNamed('/wines_details', arguments: true));

                /* : Navigator.of(context).pushReplacementNamed('/shop');*/
              },
              child: Card(
                elevation: 10,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                      child: Center(
                        child: Image.network(
                          '${winesList[index].wine!.image}',
                          height: 100.h,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0, left: 20, right: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          GoogleFontText6(
                              data: 'Alsace Grand Cru Riesling Tasting'),

                        ],
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
