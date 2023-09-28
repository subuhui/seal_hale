import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:seal_hale/system_proxy/system_network_proxy_linux.dart';
import 'package:seal_hale/system_proxy/system_network_proxy_macos.dart';
import 'package:seal_hale/system_proxy/system_network_proxy_platform_interface.dart';
import 'package:seal_hale/system_proxy/system_network_proxy_windows.dart';

class SystemNetworkProxy {
  static bool _manualDartRegistrationNeeded = true;
  static init() {
    // This is to manually endorse Dart implementations until automatic
    // registration of Dart plugins is implemented. For details see
    // https://github.com/flutter/flutter/issues/52267.
    if (_manualDartRegistrationNeeded) {
      // Only do the initial registration if it hasn't already been overridden
      // with a non-default instance.
      if (!kIsWeb) {
        if (Platform.isMacOS) {
          SystemNetworkProxyPlatform.instance = SystemNetworkProxyMacos();
        } else if (Platform.isLinux) {
          SystemNetworkProxyPlatform.instance = SystemNetworkProxyLinux();
        } else if (Platform.isWindows) {
          SystemNetworkProxyPlatform.instance = SystemNetworkProxyWindows();
        }
      }
      _manualDartRegistrationNeeded = false;
    }
  }

  static Future<bool> getProxyEnable() async {
    return SystemNetworkProxyPlatform.instance.getProxyEnable();
  }

  static Future<bool> setProxyEnable(bool proxyEnable) async {
    return SystemNetworkProxyPlatform.instance.setProxyEnable(proxyEnable);
  }

  static Future<String> getProxyServer() async {
    return SystemNetworkProxyPlatform.instance.getProxyServer();
  }

  static Future<bool> setProxyServer(String proxyServer) async {
    return SystemNetworkProxyPlatform.instance.setProxyServer(proxyServer);
  }
}
