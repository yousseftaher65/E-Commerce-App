import 'dart:async';

import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternetConnection {
  CheckInternetConnection._();
  static final CheckInternetConnection _instance = CheckInternetConnection._();
  factory CheckInternetConnection() => _instance;

  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  Stream<bool> connectionStream() => _controller.stream;

  final InternetConnection _checkConnection = InternetConnection();

  Future<bool> checkConnectivity() async {
    final InternetStatus status = await _checkConnection.internetStatus;
    return _updateConnectionStatus(status);
  }

  bool _updateConnectionStatus(InternetStatus status) {
    bool isConnected = true;
    if (status == InternetStatus.disconnected) {
      isConnected = false;
    } else {
      isConnected = true;
    }
    _controller.add(isConnected);
    debugPrint('..............isConnected: $isConnected');
    return isConnected;
  }

  void init() {
    _checkConnection.checkInterval;
    _checkConnection.onStatusChange.listen((status) {
      _updateConnectionStatus(status);
    });
  }

  void dispose() => _controller.close();
}
