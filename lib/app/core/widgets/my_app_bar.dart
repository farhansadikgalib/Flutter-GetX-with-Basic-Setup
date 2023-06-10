import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';
import '../constants/asset_constants.dart';
import '../model/app_helper_model/progress_step_percentage_model.dart';
import '../utils/style/app_style.dart';
import 'app_widgets.dart';
import 'cached_network_image/cached_network_image.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  final BuildContext context;
  final String title, profilePic;
  final double height;
  final ProgressStepPercentageModel progressPercentage;

  final dynamic searchClickListener,
      profileViewClickListener,
      hamburgerMenuClickListener,
      profileEditClickListener;

  final bool hideAppbar,
      isProgressBar,
      isProgressBarOnly,
      isHamBurgerMenuRequired,
      isHamBurgerMenuCustomRequired,
      isBackButtonRequired,
      isTitleLogo,
      isCenterTitle,
      isTitleBlue,
      isHeading,
      isTitleWhite,
      isLogoWhite,
      needMenuBar,
      needOnlyEditButton;

  const MyAppBar(
    this.context, {
    key,
    this.title = "",
    this.profilePic = demoProfilePic,
    this.hideAppbar = false,
    this.height = 55,
    this.progressPercentage = const ProgressStepPercentageModel(1, 2),
    this.isProgressBar = false,
    this.isProgressBarOnly = false,
    this.isHamBurgerMenuRequired = false,
    this.isBackButtonRequired = true,
    this.isTitleBlue = false,
    this.isCenterTitle = true,
    this.isHeading = false,
    this.isTitleWhite = true,
    this.isHamBurgerMenuCustomRequired = false,
    this.isLogoWhite = true,
    this.needMenuBar = false,
    this.needOnlyEditButton = false,
    this.searchClickListener,
    this.hamburgerMenuClickListener,
    this.profileViewClickListener,
    this.profileEditClickListener,
    this.isTitleLogo = false,
  }) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.hideAppbar ? 0 : null,
      elevation: 0,
      // foregroundColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      leadingWidth: widget.isProgressBarOnly ? 0 : 60,
      titleSpacing: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.backgroundColor.withOpacity(.1),
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),

      title: widget.isProgressBar
          ? Padding(
              padding: EdgeInsets.only(
                  right: widget.needMenuBar == false ? mainPadding : 0.0,
                  left: widget.isHamBurgerMenuRequired ||
                          widget.isBackButtonRequired
                      ? 0.0
                      : widget.isProgressBarOnly
                          ? mainPadding
                          : 0.0),
              child: LinearPercentIndicator(
                padding: EdgeInsets.zero,
                animation: true,
                lineHeight: 8.0,
                animationDuration: 500,
                percent: (1 / widget.progressPercentage.maxStep) *
                    widget.progressPercentage.currentStep,
                barRadius: const Radius.circular(20),
                progressColor: AppColors.primaryColor,
              ),
            )
          : Text(
              widget.title == "" ? "Title" : widget.title,
              style: widget.isHeading
                  ? textHeaderStyle(fontSize: 20, color: AppColors.blackPure)
                  : textAppBarStyle(),
            ),

      flexibleSpace: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
      ),
      // shadowColor: MyColors.black,
      centerTitle: widget.isCenterTitle,

      leading: widget.isBackButtonRequired || widget.isHamBurgerMenuRequired
          ? Padding(
              padding: const EdgeInsets.only(left: mainPadding),
              child: Row(
                children: [
                  widget.isHamBurgerMenuRequired
                      ? GestureDetector(
                          onTap: () {
                            widget.isHamBurgerMenuCustomRequired
                                ? widget.hamburgerMenuClickListener(context)
                                : Scaffold.of(context)
                                    .openDrawer(); //default drawer
                          },
                          child: Container(
                            height: double.infinity,
                            width: 40,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  demoProfilePic,
                                  height: 16,
                                  width: 26,
                                ),
                              ],
                            ),
                          ))
                      : InkWell(
                          overlayColor: MaterialStateProperty.all<Color>(
                              AppColors.primaryColor.withOpacity(.05)),
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onTap: () {
                            if (Navigator.canPop(context)) {
                              Navigator.pop(context);
                            } else {
                              SystemChannels.platform
                                  .invokeMethod('SystemNavigator.pop');
                            }
                          },
                          child: Container(
                            height: double.infinity,
                            width: 40,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  backArrowIcon,
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          )),
                ],
              ),
            )
          : widget.isProgressBarOnly
              ? null
              : Container(color: Colors.transparent, child: const SizedBox()),

      actions: widget.needMenuBar
          ? [
              Row(
                children: [
                  InkWell(
                    overlayColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor.withOpacity(.1)),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onTap: () {
                      widget.searchClickListener(context);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/png/search_icon.png",
                          height: 24,
                          width: 24,
                        ),
                      ),
                    ),
                  ),
                  AppWidgets().gapW(22),
                  InkWell(
                    overlayColor: MaterialStateProperty.all<Color>(
                        AppColors.primaryColor.withOpacity(.1)),
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    onTap: () {
                      widget.profileViewClickListener(context);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100)),
                        child: CachedNetworkImageCustom(
                          height: 40,
                          width: 40,
                          imageUrl: widget.profilePic,
                          isProfilePhoto: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              AppWidgets().gapW(20),
            ]
          : widget.needOnlyEditButton
              ? [
                  GestureDetector(
                    onTap: () {
                      widget.profileEditClickListener();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            editButtonIcon,
                            height: 30,
                            width: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppWidgets().gapW(20),
                ]
              : [],
    );
  }

  onMenuItemSelected(String value) {
    if (value == "SEARCH") {
      widget.searchClickListener();
    }
  }

  PopupMenuItem buildPopupMenuItem(String title, IconData iconData) {
    return PopupMenuItem(
      value: title,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            iconData,
            color: Colors.white,
          ),
          AppWidgets().gapW(8),
          Text(
            title,
            style: textRegularStyle(),
          ),
        ],
      ),
    );
  }
}
