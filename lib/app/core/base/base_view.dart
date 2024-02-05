import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

abstract class BaseView<Controller extends BaseController> extends GetView<Controller> {
  const BaseView({super.key});

  PreferredSizeWidget? appBar(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Obx(() {
        return Scaffold(
          //sets ios status bar color
          // TODO: backgroundColor: add your screen bg color here,
          // key: controller.globalKey,
          resizeToAvoidBottomInset: controller.resizeToAvoidBottomInset.value,
          appBar: appBar(context),
          floatingActionButton: floatingActionButton(),
          bottomNavigationBar: bottomNavigationBar(),
          drawer: drawer(context),
          body: pageScaffold(context),
        );
      }),
    );
  }

  // widgets
  Widget pageScaffold(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          controller.connectionController.value.isInternetConnected.value
              ? const SizedBox()
              : connectionStatusView(context) ?? const SizedBox(),
          Expanded(
            child: body(context),
          ),
        ],
      ),
    );
  }

  Widget? connectionStatusView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Container(
          width: double.infinity,
          height: 30,
          // TODO: color: add your color here,
          child: Center(
            child: Text(
              controller
                  .connectionController.value.connectedStatusMessage.value,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(fontSize: 12.sp),
            ),
          )),
    );
  }

  //required
  Widget body(BuildContext context);

  //optional
  Widget? bottomNavigationBar() {
    return null;
  }

  // 
  Widget? drawer(BuildContext context) {
    return null;
  }

  Widget? floatingActionButton() {
    return null;
  }
}
