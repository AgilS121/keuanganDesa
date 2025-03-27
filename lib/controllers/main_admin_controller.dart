import 'package:get/get.dart';

class MainAdminController extends GetxController {
  var selectedIndex = 0.obs; // Gunakan .obs untuk Obx

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
