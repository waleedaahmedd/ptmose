import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../utils/custom_font_style.dart';
import '../view_model/shop_view_model.dart';
import '../widget/app_bar_widget.dart';
import '../widget/bottom_buttons_widget.dart';
import '../widget/wineries_widget.dart';
import '../widget/wines_vertical_list_widget.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<ShopViewModel>(context, listen: false).callWinesListApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ShopViewModel>(builder: (_, shopViewModel, __) {
      return Scaffold(
        appBar: const AppBarWidget(
          cartButton: true,
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    onChanged: (content) {
                      shopViewModel.setSearchWines(content);
                    },
                    controller: shopViewModel.searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                      hintText: 'Search Wines',
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  //const WineriesWidget(image: 'assets/images/LocationBoxImg.png', name: 'Vinous Reverie Wine Merchant',),
                  Expanded(
                      child: WinesVerticalListWidget(
                    listScrollable: true,
                    winesList: shopViewModel.searchController.text.isEmpty? shopViewModel.getWines: shopViewModel.getSearchWinesList,
                  )),
                  //const BottomButtonsWidget()
                  SizedBox(
                    height: 60.h,
                  )
                ],
              ),
            ),
            const BottomButtonsWidget(homeScreen: false,)

          ],
        ),
      );
    });
  }
}
