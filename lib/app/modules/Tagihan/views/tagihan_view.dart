import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:keuangandesa/app/components/custom_appbar.dart';

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
        backgroundColor: Colors.blue,
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // _tambahTagihan();
                  Navigator.pop(
                      context); // Tutup bottom sheet setelah tambah data
                },
                child: Text("Simpan"),
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
              leading:
                  Icon(Icons.receipt_long, color: Colors.blue), // Icon tagihan
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
                    icon: Icon(Icons.edit, color: Colors.blue),
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
