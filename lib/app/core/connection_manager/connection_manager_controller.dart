import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../core/constants/app_constants.dart';
import '../../core/widgets/app_widgets.dart';
import 'connection_type.dart';

class ConnectionManagerController extends GetxController {
  final isInternetConnected = true.obs;
  final connectedStatusMessage = "No Internet Connection".obs;

  /// use if [connectionType] is required.
  final connectionType = ConnectionType.wifi.obs;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    _getConnectivityType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }

  Future<void> _getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      if (kDebugMode) {
        logger.d("PlatformException: $e");
      }
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionType.value = ConnectionType.wifi;
        isInternetConnected.value = true;
        connectedStatusMessage.value = "Wifi Connected";
        break;
      case ConnectivityResult.mobile:
        connectionType.value = ConnectionType.mobileData;
        isInternetConnected.value = true;

        connectedStatusMessage.value = "Mobile Data Connected";

        break;
      case ConnectivityResult.none:
        connectionType.value = ConnectionType.noInternet;
        isInternetConnected.value = false;

        connectedStatusMessage.value = "No Internet Connection";
        break;
      default:
        AppWidgets().getSnackBar(
            title: 'Error', message: 'Failed to get connection type');
        break;
    }
  }
}
