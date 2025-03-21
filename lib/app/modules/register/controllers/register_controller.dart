import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  final TextEditingController namalengkapController = TextEditingController();
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final count = 0.obs;
  void register() {
    // cek dlu jika semua data kosong maka muncul snackbar
    if (namalengkapController.text.isEmpty &&
        nohpController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Success',
        'Register Berhasil',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.offNamed('/login');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
