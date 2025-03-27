import 'package:get/get.dart';

import '../controllers/menu_admin_controller.dart';

class MenuAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MenuAdminController>(
      () => MenuAdminController(),
    );
  }
}
