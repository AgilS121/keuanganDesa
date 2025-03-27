import 'package:get/get.dart';

import '../controllers/riwayatkeuangan_controller.dart';

class RiwayatkeuanganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatkeuanganController>(
      () => RiwayatkeuanganController(),
    );
  }
}
