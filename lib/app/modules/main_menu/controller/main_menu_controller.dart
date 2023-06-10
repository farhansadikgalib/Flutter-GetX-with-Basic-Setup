import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/base_controller.dart';
import '../../../core/widgets/app_widgets.dart';
import '../../cards/views/cards_view.dart';
import '../../contacts/views/contacts_view.dart';
import '../../more/views/more_view.dart';
import '../../scan/views/scan_view.dart';
import '../../settings/views/settings_view.dart';
import '../main_menu_enum.dart';

class MainMenuController extends BaseController
    with GetSingleTickerProviderStateMixin {
  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late final TabController tapController;

  final _selectedTab = Menu.card.obs;

  var headingList = ["Cards", "Scan", "Contacts",  "More",  "Settings",  ].obs;
  DateTime? currentBackPressTime;

  set setSelectMenu(value) => _selectedTab.value = value;

  get getSelectedMenu => _selectedTab.value;

  get getSelectedMenuName => _selectedTab.value.name;

  var tabs = [
 const CardsView(),
    const ScanView(),
    const ContactsView(),
    const MoreView(),
    const SettingsView()
  ];


  // used for getting model form View
  init(Menu menuIndex) {
    _selectedTab.value = menuIndex;

    /// Rebuilds `GetBuilder` each time you call `update()`;
    /// The update will only notify the Widgets, if [condition] is true.
    update(); //GetX Method
  }

  @override
  void onInit() {
    tapController = TabController(length: tabs.length, vsync: this);

    super.onInit();
  }

  @override
  void onReady() {
    tapController.animateTo(Menu.values
        .byName(getSelectedMenuName)
        .index); // make Sure UI is ready(not work in onInit())
    super.onReady();
  }

  @override
  void onClose() {
    tapController.dispose();
    super.onClose();
  }

  Future<bool> onWillPop() {
    const int waitingTime = 2;
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) >
            const Duration(seconds: waitingTime)) {
      currentBackPressTime = now;
      AppWidgets().getSnackBar(
          title: "Do you want to exit?",
          message: "Press back button again to exit.");

      return Future.value(false);
    }
    return Future.value(true);
  }

  searchClick(BuildContext context) {
    String index = Menu.values.byName(getSelectedMenuName).index.toString();
    debugPrint('Menu Index: $index');
  }

  profileViewClick(BuildContext context) {
    // Get.toNamed(Routes.profileView);
  }


}
