import 'package:get/get.dart';

import '../controllers/main_admin_controller.dart';

class MainAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainAdminController>(
      () => MainAdminController(),
    );
  }
}
