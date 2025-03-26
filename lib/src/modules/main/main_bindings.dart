import 'package:billing_app/src/modules/main/main_controller.dart';

import '../../utils/path_provider.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MainController());
  }
}
