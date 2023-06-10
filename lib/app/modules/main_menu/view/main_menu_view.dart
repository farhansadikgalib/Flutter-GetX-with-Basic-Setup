import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/utils/style/app_style.dart';
import '../../../core/widgets/my_app_bar.dart';
import '../controller/main_menu_controller.dart';
import '../main_menu_enum.dart';

class MainMenuView extends BaseView<MainMenuController> {
  //todo remove default argument
  final Menu menuIndex;

  MainMenuView({Key? key, required this.menuIndex}) : super(key: key);

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return _appBar(context);
  }

  @override
  Widget? bottomNavigationBar() {
    return _bottomNavigationBar();
  }

  @override
  Widget body(BuildContext context) {
    return WillPopScope(
        onWillPop: controller.onWillPop,
        child: controller
            .tabs[Menu.values.byName(controller.getSelectedMenuName).index]);
  }

  MyAppBar _appBar(BuildContext context) => MyAppBar(
        context,
        isBackButtonRequired: false,
        isHamBurgerMenuRequired: true,
        isHeading: true,
        profilePic: "",
        isCenterTitle: false,
        title: controller.getSelectedMenu == Menu.card
            // ? "Hello Kim!"
            ? "Cards"
            : controller.headingList[
                Menu.values.byName(controller.getSelectedMenuName).index],
        needMenuBar: true,
        profileViewClickListener: controller.profileViewClick,
        searchClickListener: controller.searchClick,
      );

//todo separate _bottomNavigationBar
  TabBar _bottomNavigationBar() => TabBar(
        controller: controller.tapController,
        indicatorColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.gray,
        labelPadding: const EdgeInsets.symmetric(horizontal: 0.1),
        labelStyle: textRegularStyle(fontSize: 12, isGrayColor: true),
        labelColor: AppColors.primaryColor,
        onTap: (index) {
          controller.setSelectMenu = Menu.values[index];
        },
        tabs: const [
          Tab(
            icon: Icon(Icons.credit_card),
            text: "Cards",
          ),
          Tab(
            icon: Icon(Icons.camera_alt_outlined),
            text: "Scan",
          ),
          Tab(
            icon: Icon(Icons.people_alt_outlined),
            text: "Contacts",
          ),
          Tab(
            icon: Icon(Icons.menu),
            text: "More",
          ),
          Tab(
            icon: Icon(Icons.settings),
            text: "Settings",
          ),
        ],
      );
}
