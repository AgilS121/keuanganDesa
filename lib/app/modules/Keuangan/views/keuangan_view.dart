import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/keuangan_controller.dart';

class KeuanganView extends GetView<KeuanganController> {
  const KeuanganView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keuangan'),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              controller.setFilter(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'Semua', child: Text('Semua')),
              const PopupMenuItem(value: 'Pemasukan', child: Text('Pemasukan')),
              const PopupMenuItem(
                  value: 'Pengeluaran', child: Text('Pengeluaran')),
            ],
          ),
        ],
      ),
      body: Obx(() {
        final dataKeuangan = controller.filteredKeuangan;
        return ListView.builder(
          itemCount: dataKeuangan.length,
          itemBuilder: (context, index) {
            final item = dataKeuangan[index];
            return Card(
              elevation: 2,
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor:
                      item.jenis == 'Pemasukan' ? Colors.green : Colors.red,
                  child: Icon(
                    item.jenis == 'Pemasukan'
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Rp ${item.jumlah.toString()}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.keterangan),
                trailing: Text(
                  item.jenis,
                  style: TextStyle(
                    color:
                        item.jenis == 'Pemasukan' ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () => _showDetailDialog(context, item),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddKeuanganDialog(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // Dialog untuk menambah data keuangan
  void _showAddKeuanganDialog(BuildContext context) {
    final jumlahController = TextEditingController();
    final keteranganController = TextEditingController();
    String jenis = 'Pemasukan';

    Get.defaultDialog(
      title: "Tambah Data Keuangan",
      content: Column(
        children: [
          TextField(
            controller: jumlahController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Jumlah"),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: keteranganController,
            decoration: const InputDecoration(labelText: "Keterangan"),
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              // labelText: "Pilih Jenis", // Label sesuai konteks
              border: OutlineInputBorder(),
            ),
            value: jenis.isNotEmpty ? jenis : null, // Pastikan tidak null
            items: ['Pemasukan', 'Pengeluaran'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                jenis = value;
              }
            },
          )
        ],
      ),
      textConfirm: "Simpan",
      textCancel: "Batal",
      onConfirm: () {
        controller.addKeuangan(
          jumlah: int.tryParse(jumlahController.text) ?? 0,
          keterangan: keteranganController.text,
          jenis: jenis,
        );
        Get.back();
      },
    );
  }

  // Dialog untuk detail keuangan
  void _showDetailDialog(BuildContext context, var item) {
    Get.defaultDialog(
      title: "Detail Keuangan",
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jumlah: Rp ${item.jumlah}"),
          Text("Jenis: ${item.jenis}"),
          Text("Keterangan: ${item.keterangan}"),
        ],
      ),
      textConfirm: "Tutup",
      onConfirm: () => Get.back(),
    );
  }
}
