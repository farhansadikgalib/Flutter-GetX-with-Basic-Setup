import 'package:get/get.dart';
import '../controller/main_menu_controller.dart';

class MainMenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => MainMenuController(),
      fenix: true,
    );

  }
}
