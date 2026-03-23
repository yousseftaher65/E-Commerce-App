import 'dart:async';
import 'dart:developer';

import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class CheckInternetConnection {
  CheckInternetConnection._();

  static final CheckInternetConnection _instance = CheckInternetConnection._();

  factory CheckInternetConnection() => _instance;

  /// Custom configuration for the internet checker to be more robust.
  /// We include multiple reliable endpoints.
  final InternetConnection _checkConnection = InternetConnection.createInstance(
    checkInterval: const Duration(seconds: 5),
    customCheckOptions: [
      InternetCheckOption(uri: Uri.parse('https://1.1.1.1')),
      InternetCheckOption(uri: Uri.parse('https://www.google.com')),
      InternetCheckOption(uri: Uri.parse('https://www.cloudflare.com')),
    ],
  );

  final StreamController<bool> _controller = StreamController<bool>.broadcast();

  StreamSubscription<InternetStatus>? _subscription;

  Stream<bool> get connectionStream => _controller.stream;

  /// Checks the current internet connectivity status.
  Future<bool> checkConnectivity() async {
    try {
      final InternetStatus status = await _checkConnection.internetStatus;
      return _updateConnectionStatus(status);
    } catch (e) {
      log('Error checking connectivity: $e',
          name: 'CheckInternetConnection', error: e);
      return _updateConnectionStatus(InternetStatus.disconnected);
    }
  }

  bool _updateConnectionStatus(InternetStatus status) {
    final bool isConnected = status == InternetStatus.connected;

    if (!_controller.isClosed) {
      _controller.add(isConnected);
    }

    log('Connection status updated: ${isConnected ? "CONNECTED" : "DISCONNECTED"}',
        name: 'CheckInternetConnection');

    return isConnected;
  }

  /// Initializes the listener for connection status changes.
  void init() {
    // Avoid double initialization
    _subscription?.cancel();
    _subscription =
        _checkConnection.onStatusChange.listen(_updateConnectionStatus);
  }

  /// Disposes resources.
  void dispose() {
    _subscription?.cancel();
    _subscription = null;
    if (!_controller.isClosed) {
      _controller.close();
    }
  }
}
