import 'package:flutter/foundation.dart';

import '../../constants/app_constants.dart';

/// [Level]s to control logging output. Logging can be enabled to include all
/// levels above certain [Level].
///
const showAllDebug = true;
const singleKey = "112324";
//todo change level to enum
printLog(massage, {String level = "i", key = "1"}) {
  // verbose,
  // debug,
  // info,
  // warning,
  // error,
  // wtf,
  // nothing,
  if (kDebugMode) {
    if (showAllDebug && singleKey != key) {
      switch (level) {
        case "v":
          {
            logger.v(massage);
          }
          break;

        case "i":
          {
            logger.i(massage);
          }
          break;

        case "w":
          {
            logger.w(massage);
          }
          break;

        case "e":
          {
            logger.e(massage);
          }
          break;
        case "d":
          {
            logger.d(massage);
          }
          break;
        case "wtf":
          {
            logger.wtf(massage);
          }
          break;

        default:
          {
            logger.d(massage);
          }
          break;
      }
    }
  }
}
