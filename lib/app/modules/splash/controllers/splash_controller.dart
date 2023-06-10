import 'dart:async';

import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../routes/app_pages.dart';

class SplashController extends BaseController {
  final splashText = "Welcome to GetX Architecture".obs;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  startTimer() {
    var duration = const Duration(seconds: 2);
    return Timer(duration, gotoHome);
  }

  void gotoHome() {
    Get.offNamed(Routes.onboard);
  }
}
