import 'package:get/get.dart';

import '../connection_manager/connection_manager_binding.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    ConnectionManagerBinding().dependencies();
  }
}
