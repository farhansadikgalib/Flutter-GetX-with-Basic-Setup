
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/base/base_view.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/utils/style/app_style.dart';
import '../../../core/widgets/app_widgets.dart';
import '../controllers/splash_controller.dart';

class SplashView extends BaseView<SplashController> {
  SplashView({super.key});



  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 91.h,
                  child: Image.asset(
                    appLogo,
                    fit: BoxFit.cover,
                  ),
                ),
                AppWidgets().gapH(30),

                Text(controller.splashText.value,style: const TextStyle(color: Colors.black),),
              ],
            ),
          ),

        ],
      ),
    );
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }
}
