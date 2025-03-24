import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/app/components/custom_appbar.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/menu_admin_controller.dart';

class MenuAdminView extends GetView<MenuAdminController> {
  const MenuAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuAdminController controller = Get.put(MenuAdminController());
    return Scaffold(
      appBar: CustomAppBar(title: 'Menu Admin'),
      body: Center(
        child: Obx(() => GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.0, // Rasio aspek kotak
              ),
              itemCount: controller.menu.length,
              itemBuilder: (context, index) {
                final item = controller.menu[index];
                return _buildMenuItem(
                    item['icon'], item['name'], item['route']);
              },
            )),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, String route) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: () => {
          Get.toNamed(route),
        }, // Bisa diganti dengan navigasi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primary),
            const SizedBox(height: 10),
            Text(title,
                style: const TextStyle(
                    fontFamily: 'Archivo', fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
