import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../view_model/wineriesListViewModel.dart';

class Wineries extends StatefulWidget {
  const Wineries({Key? key}) : super(key: key);

  @override
  State<Wineries> createState() => _WineriesState();
}

class _WineriesState extends State<Wineries> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<WineriesListViewModel>(context, listen: false).callWineriesList();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WineriesListViewModel>(builder: (_, wineriesListViewModel, __) {
      return Container();
    });
  }
}
