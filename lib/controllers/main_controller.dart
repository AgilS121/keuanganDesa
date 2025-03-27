import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs; // Gunakan .obs untuk Obx

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
