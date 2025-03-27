import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangandesa/colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import '../controllers/jadwal_ronda_controller.dart';

class JadwalRondaView extends GetView<JadwalRondaController> {
  const JadwalRondaView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jadwal Ronda'),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        if (controller.jadwalRonda.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Dapatkan hari ini
        String hariIni = controller.getHariIni();
        List<Map<String, dynamic>> jadwalHariIni =
            controller.getJadwalByHari(hariIni);

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Menampilkan Jadwal Hari Ini
              Text(
                "Jadwal Ronda Hari Ini: $hariIni",
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              jadwalHariIni.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: jadwalHariIni.length,
                      itemBuilder: (context, index) {
                        var jadwal = jadwalHariIni[index];
                        return _buildJadwalCard(jadwal);
                      },
                    )
                  : const Center(
                      child: Text(
                        "Tidak ada jadwal hari ini",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),

              const SizedBox(height: 20),

              // 🔹 Menampilkan Semua Jadwal Ronda
              const Text(
                "Semua Jadwal Ronda",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: controller.jadwalRonda.length,
                  itemBuilder: (context, index) {
                    var jadwal = controller.jadwalRonda[index];
                    return _buildJadwalCard(jadwal);
                  },
                ),
              ),
            ],
          ),
        );
      }),

      // 🔹 Floating Action Button untuk menambah jadwal
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddJadwalBottomSheet(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  // 🔹 Widget untuk menampilkan Card Jadwal
  Widget _buildJadwalCard(Map<String, dynamic> jadwal) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text("Hari: ${jadwal["hari"]}",
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Waktu: ${jadwal["waktu"]}"),
            Text("Petugas: ${jadwal["petugas"].join(", ")}"),
          ],
        ),
      ),
    );
  }

  // 🔹 Show Bottom Sheet untuk menambah jadwal ronda
  void _showAddJadwalBottomSheet(BuildContext context) {
    String selectedHari = "Senin"; // Default pilihan pertama
    String selectedPetugas = "Andi"; // Default pilihan pertama

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Tambah Jadwal Ronda",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // 🔹 Dropdown Pilih Hari
              DropdownButtonFormField<String>(
                value: selectedHari,
                items: controller.hariList
                    .map((hari) => DropdownMenuItem(
                          value: hari,
                          child: Text(hari),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) selectedHari = value;
                },
                decoration: const InputDecoration(
                  labelText: "Pilih Hari",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),

              // 🔹 Dropdown Pilih Petugas
              DropdownSearch<String>(
                  popupProps: PopupProps.menu(
                    showSearchBox: true, // Aktifkan fitur pencarian
                  ),
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Cari Petugas",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  items: controller.petugasList, // Data dari controller
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedPetugas.value = value;
                    }
                  },
                  selectedItem: controller.selectedPetugas.value),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, // Warna tombol
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Radius sudut
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                onPressed: () {
                  controller.tambahJadwal(selectedHari, selectedPetugas);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.save,
                        color: Colors.white), // Tambahkan icon refresh
                    const SizedBox(width: 8), // Spasi antara icon dan teks
                    const Text("Simpan Data",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
              // 🔹 Tombol Simpan
            ],
          ),
        );
      },
    );
  }
}
