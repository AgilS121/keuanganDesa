import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MenuAdminController extends GetxController {
  //TODO: Implement MenuAdminController

  // buatkan List Menu di sini
  var menu = <Map<String, dynamic>>[
    {
      'id': 1,
      'name': 'Warga',
      'icon': Icons.person,
      'route': '/warga',
    },
    {
      'id': 2,
      'name': 'Tagihan',
      'icon': Icons.monetization_on,
      'route': '/tagihan',
    },
    {
      'id': 3,
      'name': 'Pengumuman',
      'icon': Icons.announcement,
      'route': '/pengumuman',
    },
    {
      'id': 4,
      'name': 'Acara',
      'icon': Icons.event,
      'route': '/acara',
    },
    {
      'id': 5,
      'name': 'Keuangan',
      'icon': Icons.money,
      'route': '/keuangan',
    },
    {
      'id': 6,
      'name': 'User',
      'icon': Icons.person,
      'route': '/user',
    },
  ].obs; // Menggunakan .obs tanpa tanda kurung
  final count = 0.obs;
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
