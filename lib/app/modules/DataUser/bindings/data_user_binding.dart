import 'package:get/get.dart';

import '../controllers/data_user_controller.dart';

class DataUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataUserController>(
      () => DataUserController(),
    );
  }
}
