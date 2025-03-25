import 'package:get/get.dart';

import '../controllers/jadwal_ronda_controller.dart';

class JadwalRondaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JadwalRondaController>(
      () => JadwalRondaController(),
    );
  }
}
