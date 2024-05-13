import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _internetConnectionChecker;

  NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get isConnected async {
    // return false;
    // if (Platform.isAndroid || Platform.isIOS) {
    return await _internetConnectionChecker.hasInternetAccess;
    // } else {
    //   return Future(() => true);
    // }
  }
}
