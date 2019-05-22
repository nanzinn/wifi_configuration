import 'dart:async';

import 'package:flutter/services.dart';

class WifiConfiguration {
  static const MethodChannel _channel =
      const MethodChannel('wifi_configuration');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');

    return version;
  }



  static Future<bool> connectToWifi(String ssid, String password,) async {
    final bool isConnected = await _channel.invokeMethod('connectToWifi', <String, dynamic>{"ssid" : ssid, "password" : password});
    return isConnected;
  }

  static Future<List<dynamic>> getWifiList() async {

    final List<dynamic> wifiList = await _channel.invokeMethod('getWifiList');
    return wifiList;
  }

}