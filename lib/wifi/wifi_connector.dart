import 'dart:developer';

import 'package:flutter/services.dart';

class WifiConnector {
  static const platform = MethodChannel('wificonnector/wifiworks');

  static Future<int> connectWifi(String ssid, String password) async {
    int? connectionStatus;
    try {
      connectionStatus = await platform.invokeMethod<int>('connectWifi');
    } on PlatformException catch (e) {
      log("An error appedned");
      log(e.message!);
    }
    log("Connection Done: $connectionStatus");
    return connectionStatus!;
  }
}
