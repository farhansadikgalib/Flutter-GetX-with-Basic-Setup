import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shared_value/shared_value.dart';

import 'app/core/binding/initial_binding.dart';
import 'app/core/utils/helper/localizationService.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(
    ScreenUtilInit(  designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
        // dark status bar text color
        SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
        return SharedValue.wrapApp(GetMaterialApp(
          title: "GetX Architecture",
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          initialBinding: InitialBinding(),
          translations: LocalizationService(),
          getPages: AppPages.routes,
        ), );
      })
  );
}
