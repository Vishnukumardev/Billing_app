import '../utils/path_provider.dart';

class NetworkService extends GetxService {
  NetworkService() {
    Connectivity().onConnectivityChanged.listen((statusList) async {
      if (statusList.isNotEmpty) {
        _getNetworkStatus(statusList.last);
      }
    });
  }

  void _getNetworkStatus(ConnectivityResult status) {
    if (status == ConnectivityResult.mobile ||
        status == ConnectivityResult.wifi) {
      // Online
      SnackNotification.success(message: "Online");
    } else {
      // Offline
      SnackNotification.error(message: "Offline");
    }
  }
}
