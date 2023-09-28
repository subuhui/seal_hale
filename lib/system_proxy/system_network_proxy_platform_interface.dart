import 'dart:async';

abstract class SystemNetworkProxyPlatform {
  SystemNetworkProxyPlatform();

  static late SystemNetworkProxyPlatform _instance;

  static SystemNetworkProxyPlatform get instance => _instance;

  static set instance(SystemNetworkProxyPlatform instance) {
    _instance = instance;
  }

  /// Returns `true` if this platform is able to getProxyEnable.
  Future<bool> getProxyEnable() {
    throw UnimplementedError('getProxyEnable() has not been implemented.');
  }

  /// Returns `true` if this platform is able to setProxyEnable [proxyEnable].
  Future<bool> setProxyEnable(bool proxyEnable) {
    throw UnimplementedError('setProxyEnable() has not been implemented.');
  }

  /// Returns `true` if this platform is able to getProxyServer.
  Future<String> getProxyServer() {
    throw UnimplementedError('getProxyServer() has not been implemented.');
  }

  /// Returns `true` if this platform is able to setProxyServer [proxyServer].
  Future<bool> setProxyServer(String proxyServer) {
    throw UnimplementedError('setProxyServer() has not been implemented.');
  }
}
