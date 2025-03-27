import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/colors.dart';

import '../controllers/pengumuman_user_controller.dart';

class PengumumanUserView extends GetView<PengumumanUserController> {
  const PengumumanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final PengumumanUserController controller =
        Get.put(PengumumanUserController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0), // Perbaiki ukuran AppBar

        child: AppBar(
          title: const Text('Pengumuman'),
          centerTitle: true,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: const Text(
              'Pengumuman',
              style: TextStyle(color: Colors.white, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10), // Tambahkan sedikit ruang

          Expanded(
            // Gunakan Expanded agar ListView bisa mengambil tinggi yang tersedia
            child: Obx(() {
              if (controller.pengumumanList.isEmpty) {
                return const Center(child: Text("Belum ada pengumuman"));
              }

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.pengumumanList.length,
                itemBuilder: (context, index) {
                  final pengumuman = controller.pengumumanList[index];

                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(
                        pengumuman.judul,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(pengumuman.deskripsi),
                      trailing: Text(
                        pengumuman.tanggal,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
