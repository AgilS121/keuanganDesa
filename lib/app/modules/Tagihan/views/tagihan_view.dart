import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keuangandesa/app/components/custom_appbar.dart';
import 'package:keuangandesa/colors.dart';
import '../controllers/tagihan_controller.dart';

class TagihanView extends GetView<TagihanController> {
  const TagihanView({super.key});
  @override
  Widget build(BuildContext context) {
    final TagihanController controller = Get.put(TagihanController());
    return Scaffold(
      appBar: CustomAppBar(title: 'Tagihan'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTagihanBottomSheet(context);
        },
        child: Icon(Icons.add),
        backgroundColor: AppColors.fourth,
        foregroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: _fetchTagihan(),
      ),
    );
  }

  void _showAddTagihanBottomSheet(BuildContext context) {
    final TagihanController controller = Get.put(TagihanController());
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Agar bisa scroll jika form panjang
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16, right: 16, top: 16,
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Agar tidak tertutup keyboard
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Tambah Tagihan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(labelText: "Nama Tagihan"),
                controller: controller.namaTagihanController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Jumlah"),
                keyboardType: TextInputType.number,
                controller: controller.jumlahController,
              ),
              TextField(
                controller: controller.tanggalJatuhTempoController,
                decoration: InputDecoration(
                  labelText: "Pilih Tanggal",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () => controller.selectDate(context),
              ),
              SizedBox(height: 15),
              Obx(() => DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Pilih Warga",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.selectedWarga.value.isNotEmpty
                        ? controller.selectedWarga.value
                        : null,
                    // hint: Text("Pilih Warga"),
                    items: controller.wargaList.map((warga) {
                      return DropdownMenuItem<String>(
                        value: warga['id'], // Ambil ID warga sebagai value
                        child: Text(warga['nama']!), // Tampilkan nama warga
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedWarga.value = value!;
                    },
                  )),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Radius sudut
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onPressed: () => {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.save,
                        color: Colors.white), // Tambahkan icon refresh
                    const SizedBox(width: 8), // Spasi antara icon dan teks
                    const Text("Simpan Data",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void _confirmDelete(int id) {
    Get.defaultDialog(
      title: "Hapus Tagihan",
      middleText: "Apakah Anda yakin ingin menghapus tagihan ini?",
      textConfirm: "Ya",
      textCancel: "Batal",
      confirmTextColor: Colors.white,
      onConfirm: () {
        print('ok'); // Fungsi hapus di controller
        Get.back(); // Tutup dialog
      },
    );
  }

  Widget _fetchTagihan() {
    return Obx(() {
      if (controller.tagihanList.isEmpty) {
        return Center(
            child:
                CircularProgressIndicator()); // Tampilkan loading jika data masih kosong
      }

      return ListView.builder(
        itemCount: controller.tagihanList.length,
        itemBuilder: (context, index) {
          var tagihan = controller.tagihanList[index];

          return Card(
            elevation: 3, // Efek bayangan
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              leading: Icon(Icons.receipt_long,
                  color: AppColors.fourth), // Icon tagihan
              title: Text(
                tagihan["nama"], // Nama tagihan
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Jatuh Tempo: ${tagihan["tanggalJatuhTempo"]}"),
                  Text(
                    "Rp ${tagihan["jumlah"]}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    iconSize: 17,
                    icon: Icon(Icons.edit,
                        color: const Color.fromARGB(255, 184, 168, 24)),
                    onPressed: () {
                      Get.toNamed('/tagihan/edit', arguments: tagihan);
                    },
                  ),
                  IconButton(
                    iconSize: 17,
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _confirmDelete(tagihan[
                          "id"]); // Panggil fungsi hapus dengan konfirmasi
                    },
                  ),
                ],
              ),
              onTap: () {
                Get.toNamed('/tagihan/detail',
                    arguments: tagihan); // Navigasi ke detail tagihan
              },
            ),
          );
        },
      );
    });
  }
}
