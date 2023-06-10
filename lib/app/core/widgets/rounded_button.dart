import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../utils/style/app_style.dart';
import '../model/app_helper_model/drop_down_model.dart';

class RoundedButton extends StatelessWidget {
  final dynamic clickEvent, buttonStyle;
  final double height, width, borderRadius, buttonFontSize;
  final Color levelColor, backgroundColor, borderColor;
  final bool isWhiteBackground,
      isTextBtnOnly,
      isDataRequired,
      isInactive,
      isCustomHeight;
  final int selectedIndex;
  final List<DropDownModel>? dataList;
  final String label;

  const RoundedButton(
    BuildContext context,
    this.label, {
    this.clickEvent,
    Key? key,
    this.buttonStyle,
    this.dataList = const [],
    this.height = buttonHeight,
    this.width = double.infinity,
    this.borderRadius = buttonCornerRadius,
    this.buttonFontSize = 14.0,
    this.selectedIndex = -99,
    this.levelColor = AppColors.white,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = AppColors.accentColor,
    this.isWhiteBackground = false,
    this.isDataRequired = false,
    this.isCustomHeight = false,
    this.isTextBtnOnly = false,
    this.isInactive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: isCustomHeight ? height : null,
      width: width,
      child: TextButton(
        style: ButtonStyle(
            /* overlayColor: isTextBtnOnly
                ? MaterialStateProperty.all<Color>(
                    AppColors.primaryColor.withOpacity(.1))
                : MaterialStateProperty.all<Color>(AppColors.secondaryColor),*/
            foregroundColor: MaterialStateProperty.all<Color>(levelColor),
            backgroundColor: MaterialStateProperty.all<Color>(isWhiteBackground
                ? AppColors.white
                : isInactive
                    ? AppColors.liteGray
                    : backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(
                  color: isInactive ? AppColors.liteGray : borderColor,
                  width: 1,
                  style: BorderStyle.solid),
            ))),
        onPressed: () {
          if (isDataRequired) {
            if (kDebugMode) {
              debugPrint(
                  'selectedIndex: $selectedIndex dataList: ${dataList!.length}   ');
            }

            if (selectedIndex >= 0 && dataList!.isNotEmpty) {
              if (kDebugMode) {
                debugPrint(
                    'selectedIndex: $selectedIndex dataList: ${dataList!.length}   ');
              }
              clickEvent(context, selectedIndex, dataList);
            } else if (selectedIndex >= 0) {
              try {
                clickEvent(context, selectedIndex);
              } catch (e) {
                if (kDebugMode) {
                  debugPrint('e: $e');
                }
              }
            } else {
              clickEvent(context);
            }
          } else {
            clickEvent(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Text(
            label,
            style: buttonStyle ??
                textButtonStyle(
                    color: isWhiteBackground
                        ? AppColors.primaryColor
                        : isInactive
                            ? AppColors.gray.withOpacity(.5)
                            : levelColor,
                    fontSize: buttonFontSize.sp),
          ),
        ),
      ),
    );
  }
}
