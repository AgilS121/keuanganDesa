import 'package:get/get.dart';

import '../controllers/pengumuman_user_controller.dart';

class PengumumanUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PengumumanUserController>(
      () => PengumumanUserController(),
    );
  }
}
