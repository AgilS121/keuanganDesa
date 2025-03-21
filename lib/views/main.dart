import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/main_controller.dart';
import '../app/modules/home/views/home_view.dart';
import '../app/modules/pengumuman/views/pengumuman_view.dart';
import '../app/modules/acara/views/acara_view.dart';
import '../app/modules/kontak/views/kontak_view.dart';

class MainView extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    final MainController controller = Get.put(MainController());

    final List<Widget> pages = [
      HomeView(),
      PengumumanView(),
      AcaraView(),
      KontakView(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]), // Obx di sini
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTab,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.announcement), label: 'Pengumuman'),
              BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Acara'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.contact_phone), label: 'Kontak'),
            ],
          )),
    );
  }
}
