import '../utils/path_provider.dart';

class DependencyInjection {
  static void init() async {
    Get.put<Apihelper>(Apihelper());
    if (GetPlatform.isAndroid) {
      Get.put<NetworkService>(NetworkService(), permanent: true);
    }
  }
}
