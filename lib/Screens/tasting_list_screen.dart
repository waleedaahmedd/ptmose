import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../view_model/testing_list_view_model.dart';

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
      return Container();
    });
  }
}
