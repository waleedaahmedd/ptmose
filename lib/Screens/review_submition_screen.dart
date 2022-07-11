import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/app_bar_widget.dart';

class ReviewSubmissionScreen extends StatelessWidget {
  const ReviewSubmissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        homeButton: true,
      ),
      body: Container(),
    );
  }
}
