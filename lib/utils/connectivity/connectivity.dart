import 'package:connectivity/connectivity.dart';

class ConnectionUtils {
  static Future<bool> getActiveStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    return true;
  }
}
