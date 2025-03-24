import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/main_admin_controller.dart';
import '../app/modules/HomeAdmin/views/home_admin_view.dart';
import '../app/modules/Tagihan/views/tagihan_view.dart';
import '../app/modules/Keuangan/views/keuangan_view.dart';
import '../app/modules/Warga/views/warga_view.dart';
import '../app/modules/User/views/user_view.dart';
import '../app/modules/MenuAdmin/views/menu_admin_view.dart';

class MainAdminView extends GetView<MainAdminController> {
  @override
  Widget build(BuildContext context) {
    final MainAdminController controller = Get.put(MainAdminController());

    final List<Widget> pages = [
      HomeAdminView(),
      MenuAdminView(),
      KeuanganView(),
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
                  icon: Icon(Icons.pages_sharp), label: 'Menu'),
              //  icon untuk uang
              BottomNavigationBarItem(
                  icon: Icon(Icons.money), label: 'Keuangan'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
            ],
          )),
    );
  }
}
