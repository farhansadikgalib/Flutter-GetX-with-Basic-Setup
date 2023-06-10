import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
import '../utils/style/app_style.dart';

class AppWidgets {
  Widget gapH(double height) {
    return SizedBox(
      height: height,
    );
  }

  Widget gapW(double width) {
    return SizedBox(
      width: width,
    );
  }

  Widget gapW8() {
    return const SizedBox(
      width: 8,
    );
  }

  Widget gapH8() {
    return const SizedBox(
      height: 8,
    );
  }

  Widget gapH16() {
    return const SizedBox(
      height: 16,
    );
  }

  Widget gapW16() {
    return const SizedBox(
      width: 16,
    );
  }

  Widget gapW12() {
    return const SizedBox(
      width: 12,
    );
  }

  Widget gapW24() {
    return const SizedBox(
      width: 24,
    );
  }

  Widget gapH12() {
    return const SizedBox(
      height: 12,
    );
  }

  Widget gapH24() {
    return const SizedBox(
      height: 24,
    );
  }

  SnackbarController getSnackBar(
      {title = "Title",
      message = " Some message",
      int waitingTime = 2,
      int animationDuration = 500,
      snackPosition = SnackPosition.TOP,
      Color backgroundColor = AppColors.primaryColor,
      double backgroundColorOpacity = .8,
      colorText = AppColors.white}) {
    Get.closeAllSnackbars();
    return Get.snackbar(title, message,
        snackPosition: snackPosition,
        duration: Duration(seconds: waitingTime),
        animationDuration: Duration(milliseconds: animationDuration),
        backgroundColor: backgroundColor.withOpacity(backgroundColorOpacity),
        colorText: colorText);
  }

  Widget authTopText({
    title = "Title",
    subTitle = "Sub Title",
  }) {
    return Column(
      children: [
        Text(
          title,
          style: textAppBarStyle(fontSize: 16),
        ),
        AppWidgets().gapH(4),
        Text(
          subTitle,
          style: textRegularStyle(fontSize: 10),
        ),
      ],
    );
  }
// button
  myTextButton(BuildContext context, title,
      {callBack,
        bool isPrefixTextRequired = false,
        prefixText,
        double fontSize = 14,
        isUnderline = false,
        FontWeight fontWeight = FontWeight.normal,
        textColor = AppColors.accentColor,
        bool isCenterAlign = true}) {
    return Row(
      mainAxisAlignment:
      isCenterAlign ? MainAxisAlignment.center : MainAxisAlignment.end,
      children: [
        Text(isPrefixTextRequired ? prefixText : "",
            style: textRegularStyle(
                color: AppColors.black,
                fontWeight: fontWeight,
                fontSize: fontSize.sp)),
        TextButton(
            onPressed: () {
              callBack();
            },
            child: Text(
              title,
              style: textRegularStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: fontSize.sp)
                  .copyWith(
                decoration: isUnderline
                    ? TextDecoration.underline
                    : TextDecoration.none,
              ),
            )),
      ],
    );
  }
}
