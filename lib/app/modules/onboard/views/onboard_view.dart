import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboard_controller.dart';

class OnboardView extends GetView<OnboardController> {
  const OnboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: Text(
          'OnboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
