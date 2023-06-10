import 'package:get/get.dart';

import '../controllers/cards_controller.dart';

class CardsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardsController>(
      () => CardsController(),
    );
  }
}
