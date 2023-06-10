 import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../utils/helper/shared_value_helper.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 4;

  @override
  RouteSettings? redirect(String? route) =>
      isLoggedIn.$ == false ? const RouteSettings(name: Routes.home) : null;
}
