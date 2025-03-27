import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/main_controller.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/PengumumanUser/views/pengumuman_user_view.dart';
import '../app/modules/riwayatkeuangan/views/riwayatkeuangan_view.dart';
import '../app/modules/kontak/views/kontak_view.dart';
import '../app/modules/User/views/user_view.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    final List<Widget> pages = [
      HomeView(),
      PengumumanUserView(),
      RiwayatkeuanganView(),
      UserView(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]), // Obx di sini
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.announcement), label: 'Pengumuman'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money), label: 'Keuangan'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profil'),
            ],
          )),
    );
  }
}
