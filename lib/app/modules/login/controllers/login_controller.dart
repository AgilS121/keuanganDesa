import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final TextEditingController nohpController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final count = 0.obs;
  void login() {
    // jika tidak ada isinya tampilkan toast
    if (nohpController.text.isEmpty &&
        emailController.text.isEmpty &&
        passwordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    // buat else if jika no hp terisi maka arahkan ke halaman home
    else if (nohpController.text.isNotEmpty) {
      // kasih snackbar dlu baru arahkan ke home
      Get.snackbar(
        'Success',
        'Login Berhasil',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      // agar merplace laman ke home setelah login dan menghilangkan riwyat route

      Get.offNamed('/mainadmin');
    } else if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Get.snackbar(
        'Success',
        'Login Berhasil',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );

      Get.offNamed('/main');
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
