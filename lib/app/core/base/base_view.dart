import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../connection_manager/connection_manager_controller.dart';
import '../constants/app_colors.dart';
import '../utils/style/app_style.dart';
import '../constants/asset_constants.dart';
import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController>
    extends GetView<Controller> {
  BaseView({super.key});

  // final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final _connectionController = Get.find<ConnectionManagerController>();

  PreferredSizeWidget? appBar(BuildContext context);

  //required
  Widget body(BuildContext context);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // For Android (dark icons)
      statusBarBrightness: Brightness.light,
    ));
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(() {
        return Scaffold(
            // resizeToAvoidBottomInset: false,
            //sets ios status bar color
            backgroundColor: AppColors.backgroundColor,
            // key: globalKey,
            extendBodyBehindAppBar: true,
            appBar: appBar(context),
            floatingActionButton: floatingActionButton(),
            bottomNavigationBar: bottomNavigationBar(),
            drawer: drawer(context),
            body: pageScaffold(context));
      }),
    );
  }

  // widgets
  Widget pageScaffold(BuildContext context) {
    return Stack(
      children: [
        // todo uncomment if background image required
        controller.isTopBgRequired.value
            ? Container(
                height: 155,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(bgSplashScreen),
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : const SizedBox(),
        controller.isTopBgRequired.value
            ? Column(
                children: [
                  _connectionController.isInternetConnected.value
                      ? const SizedBox()
                      : connectionStatusView() ?? const SizedBox(),
                  Expanded(child: pageContent(context)),
                ],
              )
            : Column(
                children: [
                  _connectionController.isInternetConnected.value
                      ? const SizedBox()
                      : connectionStatusView() ?? const SizedBox(),
                  Expanded(child: pageContent(context)),
                ],
              ),
      ],
    );
  }

  Widget pageContent(BuildContext context) {
    return body(context);
  }

  //optional
  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? connectionStatusView() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
          width: double.infinity,
          height: 30,
          color: AppColors.blackPure,
          child: Center(
            child: Text(
              _connectionController.connectedStatusMessage.value,
              style: textRegularStyle(isWhiteColor: true),
            ),
          )),
    );
  }
}
