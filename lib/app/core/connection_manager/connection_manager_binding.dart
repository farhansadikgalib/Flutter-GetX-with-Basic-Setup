import 'package:get/get.dart';

import 'connection_manager_controller.dart';

class ConnectionManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConnectionManagerController(), fenix: true);
  }
}
