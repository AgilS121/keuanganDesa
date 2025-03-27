import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/app/modules/Warga/controllers/warga_controller.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/warga_controller.dart';

class WargaView extends GetView<WargaController> {
  const WargaView({super.key});

  @override
  Widget build(BuildContext context) {
    final WargaController controller = Get.put(WargaController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Warga'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Input Pencarian
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Cari warga...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (value) => controller.filterWarga(value),
            ),
          ),

          // ListView Data Warga
          Expanded(
            child: Obx(() => ListView.builder(
                  itemCount: controller.filteredWarga.length,
                  itemBuilder: (context, index) {
                    final warga = controller.filteredWarga[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(warga.name),
                      subtitle: Text("NIK: ${warga.nik}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => controller.editWarga(
                              index,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => controller.deleteWarga(index),
                          ),
                        ],
                      ),
                      onTap: () => Get.to(() => WargaDetailView(warga: warga)),
                    );
                  },
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddWargaSheet(context, controller),
        child: const Icon(Icons.add),
      ),
    );
  }
}

void _showAddWargaSheet(BuildContext context, WargaController controller) {
  Get.bottomSheet(
    Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("Tambah Warga",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          TextField(
              controller: controller.nameController,
              decoration: const InputDecoration(labelText: "Nama")),
          TextField(
              controller: controller.nikController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "NIK")),
          TextField(
              controller: controller.addressController,
              decoration: const InputDecoration(labelText: "Alamat")),
          TextField(
              controller: controller.genderController,
              decoration: const InputDecoration(labelText: "Jenis Kelamin")),
          TextField(
              controller: controller.tanggalLahirController,
              decoration: const InputDecoration(labelText: "Tanggal Lahir")),
          TextField(
              controller: controller.pekerjaanController,
              decoration: const InputDecoration(labelText: "Pekerjaan")),
          TextField(
              controller: controller.statusPernikahanController,
              decoration:
                  const InputDecoration(labelText: "Status Pernikahan")),
          TextField(
              controller: controller.agamaController,
              decoration: const InputDecoration(labelText: "Agama")),
          TextField(
              controller: controller.phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(labelText: "Nomor HP")),
          const SizedBox(height: 15),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
            onPressed: () {
              if (controller.nameController.text.isNotEmpty &&
                  controller.nikController.text.isNotEmpty) {
                controller.addWarga();
                Get.back();
              } else {
                Get.snackbar("Error", "Nama dan NIK harus diisi!",
                    backgroundColor: Colors.red, colorText: Colors.white);
              }
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.save, color: Colors.white),
                SizedBox(width: 8),
                Text("Simpan Data", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    ),
    isScrollControlled: true,
  );
}

class WargaDetailView extends StatelessWidget {
  final Warga warga;

  const WargaDetailView({super.key, required this.warga});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(warga.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nama: ${warga.name}", style: const TextStyle(fontSize: 18)),
            Text("NIK: ${warga.nik}", style: const TextStyle(fontSize: 18)),
            Text("Alamat: ${warga.address}",
                style: const TextStyle(fontSize: 18)),
            Text("Jenis Kelamin: ${warga.gender}",
                style: const TextStyle(fontSize: 18)),
            Text("Tanggal Lahir: ${warga.tanggalLahir}",
                style: const TextStyle(fontSize: 18)),
            Text("Pekerjaan: ${warga.pekerjaan}",
                style: const TextStyle(fontSize: 18)),
            Text("Status Pernikahan: ${warga.statusPernikahan}",
                style: const TextStyle(fontSize: 18)),
            Text("Agama: ${warga.agama}", style: const TextStyle(fontSize: 18)),
            Text("Nomor HP: ${warga.phone}",
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
