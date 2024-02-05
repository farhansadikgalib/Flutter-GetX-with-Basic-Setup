import 'package:get/get.dart';

import '../connection_manager/connection_manager_controller.dart';
import 'page_state.dart';

abstract class BaseController extends GetxController {
  final isAuthenticated = false.obs;
  final isTopBgRequired = false.obs;

  final resizeToAvoidBottomInset = true.obs;

  //final logger = Logger();

  // final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final connectionController = Get.find<ConnectionManagerController>().obs;

  final _pageSateController = PageState.defaultState.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.defaultState);

  showLoading() => updatePageState(PageState.loading);

  hideLoading() => resetPageState();
}
