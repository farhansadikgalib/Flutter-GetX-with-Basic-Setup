import 'package:get/get.dart';
import 'package:logger/logger.dart';

import 'page_state.dart';

abstract class BaseController extends GetxController {
  final isAuthenticated = false.obs;
  final isTopBgRequired = false.obs;
  final logger = Logger();
  final _pageSateController = PageState.defaultState.obs;

  PageState get pageState => _pageSateController.value;

  updatePageState(PageState state) => _pageSateController(state);

  resetPageState() => _pageSateController(PageState.defaultState);

  showLoading() => updatePageState(PageState.loading);

  hideLoading() => resetPageState();

  @override
  void onInit() {
    super.onInit();
  }

}
