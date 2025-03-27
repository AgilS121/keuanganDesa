import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/user_controller.dart';

class UserView extends GetView<UserController> {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 80), // Spasi untuk menggantikan AppBar
            const Text(
              "Profil Pengguna",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 30),
            ClipOval(
              child: Image.asset(
                'assets/image/profile.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),
            Obx(() => Text(
                  controller.username.value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                )),
            const SizedBox(height: 5),
            const Text(
              "Pengguna Terdaftar",
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Get.snackbar(
                  "Info",
                  "Fitur edit profil akan segera hadir!",
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: Colors.white,
                  colorText: Colors.black,
                );
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "Edit Profil",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const Spacer(), // Mendorong tombol logout ke bawah
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton.icon(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Konfirmasi Logout",
                    middleText: "Apakah Anda yakin ingin keluar?",
                    textConfirm: "Logout",
                    textCancel: "Batal",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      Get.offAllNamed('/login'); // Aksi logout
                    },
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.white),
                label: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
