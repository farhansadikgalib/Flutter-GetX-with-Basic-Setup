
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getx_architecture/app/core/utils/extensions/app_validator.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../utils/helper/print_log.dart';
import '../utils/style/app_style.dart';
import '../utils/helper/app_helper.dart';
import 'app_widgets.dart';
import 'controller/edit_text_controller.dart';

class MyEditText extends StatelessWidget {
  final String title, passwordToMatch;
  final TextEditingController controller;

  final FloatingLabelBehavior floatingLabelBehavior;
  final TextStyle? style, titleTextStyle;
  final TextInputType textInputType;
  final bool needValidate,
      isReadonly,
      showCursor,
      isDatePicker,
      isObscure,
      isEmail,
      isID,
      isPhoneNumber,
      isPassword,
      isConfirmPassword,
      isNormalText,
      isNormalTextWithoutSpace,
      isAllowAllText,
      isOutLinedBorder,
      isPassengerDetails,
      needToShowTitle,
      needToShowTitlePrefix,
      needHintText,
      isUnderLineRequired,
      needTopSpace,
      needGenderDropdown,
      needPrefixIcon,
      removeSpace,
      needCountrySelector,
      isTransparentBG,
      isTextWhite,
      needOnlyLine,
      showCounter,
      showEye,
      needSuffixIcon;

  final String? minLengthMsg, placeholder, prefixIconPath, hintText;
  final int maxLine, minLine, maxLength, minLength;
  final FocusNode? focusNode;
  final double elevationVal;
  final EdgeInsets contentPadding;
  final Function? handleDropdownClick, countySelectorHandler;
  dynamic inputFormatter, clickListener, selectedItem, eyeClick;
  Icon suffixIcon;
  ValueChanged<String>? onChanged;

  MyEditText(
    this.title,
    this.controller, {
    this.style,
    this.needValidate = false,
    key,
    this.textInputType = TextInputType.text,
    this.isNormalText = false,
    this.isNormalTextWithoutSpace = false,
    this.isAllowAllText = false,
    this.isObscure = false,
    this.isEmail = false,
    this.isID = false,
    this.onChanged,
    this.isPhoneNumber = false,
    this.isPassengerDetails = false,
    this.isUnderLineRequired = true,
    this.isOutLinedBorder = false,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.contentPadding =
        const EdgeInsets.only(left: 16, right: 16, top: 20, bottom: 20),
    this.minLength = 0,
    this.passwordToMatch = '',
    this.hintText = '',
    this.minLengthMsg = '',
    this.prefixIconPath = 'assets/svg/profile_icon.svg',
    this.suffixIcon = const Icon(Icons.calendar_month_rounded),
    this.maxLength = 250,
    this.inputFormatter,
    this.isReadonly = false,
    this.showCounter = false,
    this.showCursor = true,
    this.isDatePicker = false,
    this.focusNode,
    this.maxLine = 1,
    this.floatingLabelBehavior = FloatingLabelBehavior.never,
    this.minLine = 1,
    this.needGenderDropdown = false,
    this.needPrefixIcon = true,
    this.placeholder,
    this.clickListener,
    this.elevationVal = 1.0,
    this.titleTextStyle,
    this.handleDropdownClick,
    this.needToShowTitle = true,
    this.needCountrySelector = false,
    this.needOnlyLine = false,
    this.needHintText = false,
    this.showEye = false,
    this.needSuffixIcon = false,
    this.needToShowTitlePrefix = false,
    this.isTransparentBG = true,
    this.selectedItem,
    this.eyeClick,
    this.isTextWhite = false,
    this.countySelectorHandler,
    this.needTopSpace = false,
    this.removeSpace = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // printLog(MediaQuery.of(context).viewInsets.bottom);
    if (textInputType == const TextInputType.numberWithOptions(signed: true)) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ];
    } else if (isEmail == true ||
        removeSpace == true ||
        isObscure == true ||
        isAllowAllText == true) {
      // allow all, but email field has email validator

      inputFormatter = [
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ];
    } else if (isNormalText) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9 .,!%&@#]")),
      ];
    } else if (isNormalTextWithoutSpace) {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]")),
        FilteringTextInputFormatter.deny(RegExp(r'\s')),
      ];
    } else {
      inputFormatter = [
        FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]+")),
      ];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: needTopSpace ? dropdownToTitle : 0,
        ),
        Visibility(
          visible: needToShowTitle,
          child: Row(
            children: [
              needToShowTitlePrefix
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: SvgPicture.asset(
                          color: AppColors.gray,
                          prefixIconPath!,
                        ),
                      ),
                    )
                  : const SizedBox(),
              Text(
                title,
                style: titleTextStyle ??
                    textRegularStyle(
                        color:
                            isTextWhite ? AppColors.white : AppColors.textGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
              ),
            ],
          ),
        ),
        AppWidgets().gapH8(),
        Visibility(
          visible: !needOnlyLine,
          child: const SizedBox(
            height: titleToDropdown,
          ),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          // height: 50,
          child: TextFormField(
            scrollPadding: const EdgeInsets.only(bottom: 50),
            onTap: () {
              // clickListener != null ? clickListener(context) : null; //origin
              clickListener != null ? clickListener() : null;
            },
            controller: controller,
            maxLines: maxLine,
            minLines: minLine,
            maxLength: maxLength,
            obscureText: isObscure,
            keyboardType: textInputType,
            focusNode: focusNode,
            autocorrect: false,
            readOnly: isReadonly,
            showCursor: !isReadonly && showCursor,
            inputFormatters: inputFormatter,
            onChanged: isPassengerDetails
                ? onChanged
                : (value) {
                    if (kDebugMode) {
                      logger.w("value $value");
                    }
                    if (isPassword) {
                      Get.put(PasswordController()).password.value = value;

                      if (kDebugMode) {
                        logger.i("isPassword");
                      }
                    } else {
                      if (kDebugMode) {
                        logger.d("!isConfirmPassword");
                      }
                    }
                  },
            style: textRegularStyle(
                    color: isTransparentBG
                        ? (isReadonly ? AppColors.black : AppColors.black)
                        : AppColors.black)
                .merge(style),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if (Get.isRegistered<PasswordController>()) {
                if (kDebugMode) {
                  logger.v(
                      "Debug Value: $isConfirmPassword : $passwordToMatch  : $value : ${Get.find<PasswordController>().password.value}");
                }
              }

              if (!needValidate) {
                return null;
              }
              if (value!.trim().isEmpty) {
                return 'This field is required';
                // return S().FIELD_REQUIRED;
              } else if (isConfirmPassword &&
                  Get.isRegistered<PasswordController>() &&
                  Get.find<PasswordController>().password.value.isNotEmpty &&
                  value != Get.find<PasswordController>().password.value) {
                if (kDebugMode) {
                  logger.e(
                      'Confirm Pass:  $value $passwordToMatch ${Get.find<PasswordController>().password.value}');
                }
                return 'Confirm password not matched';
              } else if (isEmail) {
                return value.isValidEmail() ? null : 'Enter a valid email';
              }
              /*else if (isID) {
                final idType = Get.find<SignUpController>().idType.value;
                if (idType == IdType.nid && !value.isValidBDNid()) {
                  return 'NID must be 10, 13 or 17 digits';
                } else if (idType == IdType.birthCertificate &&
                    !value.isValidBDBirthRegistration()) {
                  return 'Birth Registration must be 17 digits';
                }
                return null;
              }*/
              else if (isPhoneNumber) {
                return value.isValidBDPhoneNum()
                    ? null
                    : 'Enter a valid phone number';
              } else if (isPassword || isConfirmPassword) {
                return value.isValidPassword()
                    ? null :'Password must contain at least 8 characters';
                    // : 'Password must have 8 characters, at least one uppercase or lowercase letter and one number '; /* : 'Password must contain at least 6 characters';*/
              } else {
                if (kDebugMode) {
                  // debugPrint('myEditText :  ${value.length}');
                }

                if (minLength != 0 && value.length < minLength) {
                  return minLengthMsg == ''
                      ? 'Must be $minLength Digits'
                      : minLengthMsg;
                }
              }

              return null;
            },
            //autovalidateMode: needValidate ? AutovalidateMode.always: AutovalidateMode.disabled,
            decoration: needOnlyLine
                ? InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                    errorMaxLines: 4,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24.w,
                      minHeight: 24.h,
                    ),
                    prefixIcon: needCountrySelector
                        ? countrySelector(context)
                        : needGenderDropdown
                            ? genderSelector(context)
                            : needPrefixIcon
                                ? Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: SizedBox(
                                      height: 24.h,
                                      width: 24.w,
                                      child: SvgPicture.asset(
                                        color: AppColors.gray,
                                        prefixIconPath!,
                                      ),
                                    ),
                                  )
                                : null,
                    suffixIcon: showEye
                        ? InkWell(
                            onTap: () {
                              eyeClick(context);
                            },
                            child: Icon(
                              isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColors.gray,
                            ),
                          )
                        : null,
                    contentPadding: EdgeInsets.only(
                      bottom: 12.h,
                    ),
                    isDense: true,
                    labelText: placeholder ?? title,
                    counterText: showCounter ? null : "",
                    counterStyle: const TextStyle(color: AppColors.black),
                    labelStyle: hintStyle,
                    // suffix: Text("${controller.text.length}"),
                    floatingLabelBehavior: floatingLabelBehavior,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: isUnderLineRequired ? 1 : 0,
                          color: isReadonly
                              ? AppColors.underlineColor
                              : AppColors.underlineColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          width: isUnderLineRequired ? 1 : 0,
                          color: isReadonly
                              ? AppColors.underlineColor
                              : AppColors.underlineColor),
                    ),
                    border: isOutLinedBorder
                        ? const OutlineInputBorder()
                        : UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: isUnderLineRequired ? 1 : 0,
                                color: isReadonly
                                    ? AppColors.underlineColor
                                    : AppColors.underlineColor),
                          ),
                  )
                : InputDecoration(
                    errorStyle: TextStyle(
                      fontSize: 12.sp,
                    ),
                    errorMaxLines: 4,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 24.w,
                      minHeight: 24.h,
                    ),
                    // prefix: needGenderDropdown ? genderSelector() : null,
                    hintText: needHintText ? hintText : "",
                    prefixIcon: needCountrySelector
                        ? countrySelector(context)
                        : needGenderDropdown
                            ? genderSelector(context)
                            : needPrefixIcon
                                ? Padding(
                                    padding:
                                        EdgeInsets.only(left: 8.w, right: 8.w),
                                    child: SizedBox(
                                      height: 20.h,
                                      width: 20.w,
                                      child: SvgPicture.asset(
                                        color: AppColors.gray,
                                        prefixIconPath!,
                                      ),
                                    ),
                                  )
                                : null,
                    suffixIcon: needSuffixIcon
                        ? suffixIcon
                        : showEye
                            ? InkWell(
                                onTap: () {
                                  eyeClick(context);
                                },
                                child: Icon(
                                  isObscure
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: AppColors.gray,
                                ),
                              )
                            : null,
                    labelText: placeholder ?? title,
                    counterText: "",
                    labelStyle: hintStyle,
                    floatingLabelBehavior: floatingLabelBehavior,
                    //errorText: 'Error',
                    // border: OutlineInputBorder(),
                    /*suffixIcon: Icon(
                Icons.error,
              ),*/
                    contentPadding: contentPadding,
                    filled: needOnlyLine ? false : true,
                    fillColor:
                        isTransparentBG ? AppColors.white : AppColors.whitePure,
                    focusedBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(cornerRadius)),
                      borderSide: BorderSide(
                        width: 1,
                        color: isReadonly && !isDatePicker
                            ? AppColors.white
                            : AppColors.liteGray,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(cornerRadius)),
                      borderSide: BorderSide(width: 1, color: Colors.orange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(cornerRadius)),
                      borderSide: BorderSide(
                          width: 1,
                          color: isReadonly && !isDatePicker
                              ? AppColors.white.withOpacity(.3)
                              : AppColors.black.withOpacity(.1)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                            Radius.circular(cornerRadius)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.black.withOpacity(.1))),
                    errorBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(cornerRadius)),
                        borderSide:
                            BorderSide(width: 1, color: AppColors.wrong)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(cornerRadius)),
                        borderSide:
                            BorderSide(width: 1, color: AppColors.wrong)),
                  ),
          ),
        ),
      ],
    );
  }

  Widget genderSelector(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: mainPadding, right: mainPadding * .3),
      child: DropdownButtonHideUnderline(
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppColors.black.withOpacity(1),
          ),
          child: DropdownButton<String>(
            value: selectedItem,
            icon: const Icon(
              Icons.expand_more_rounded,
              color: AppColors.white,
            ),
            elevation: 16,
            onChanged: (String? newValue) {
              AppHelper().hideKeyboard();
              if (newValue != selectedItem) {
                handleDropdownClick!(newValue);
              }
            },
            items: <String>['Mr.', 'Ms.', 'Mrs.', 'Miss.']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: textRegularStyle(),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget countrySelector(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Stack(
        alignment: Alignment.centerRight,
        children: const [
          SizedBox(
            width: 20,
            child: Icon(
              Icons.expand_more_rounded,
              color: AppColors.white,
            ),
          ),
          /*CountryCodePicker(
            onChanged: (countryCode) {
              countySelectorHandler!(countryCode);
            },
            textStyle: textRegularStyle(),
            boxDecoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(cornerRadius)),
            ),
            dialogSize: Size(AppHelper().getWidth(context) * .8,
                AppHelper().getHeight(context) * .8),
            initialSelection: '+91',
          ),*/
        ],
      ),
    );
  }
}
