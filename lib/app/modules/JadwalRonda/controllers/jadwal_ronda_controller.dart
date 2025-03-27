import 'package:get/get.dart';

class JadwalRondaController extends GetxController {
  var jadwalRonda = <Map<String, dynamic>>[].obs;

  // Daftar hari dan petugas
  final hariList = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
    "Sabtu",
    "Minggu"
  ];
  final petugasList = ["Andi", "Budi", "Citra", "Doni", "Eka"];
  // Menyimpan pilihan petugas
  var selectedPetugas = Rx<String?>(null); // Bisa null di awal

  // Fungsi untuk mengubah pilihan petugas
  void setSelectedPetugas(String? value) {
    selectedPetugas.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    _loadJadwalAwal();
  }

  // 🔹 Simulasi Data Awal
  void _loadJadwalAwal() {
    jadwalRonda.addAll([
      {
        "hari": "Senin",
        "waktu": "Malam",
        "petugas": ["Andi", "Budi"]
      },
      {
        "hari": "Rabu",
        "waktu": "Malam",
        "petugas": ["Citra", "Doni"]
      },
    ]);
  }

  // 🔹 Ambil hari ini
  String getHariIni() {
    final now = DateTime.now();
    return hariList[now.weekday - 1]; // 1 = Senin, 7 = Minggu
  }

  // 🔹 Ambil jadwal berdasarkan hari
  List<Map<String, dynamic>> getJadwalByHari(String hari) {
    return jadwalRonda.where((item) => item["hari"] == hari).toList();
  }

  // 🔹 Tambah jadwal baru
  void tambahJadwal(String hari, String petugas) {
    bool sudahAda = jadwalRonda.any((j) => j["hari"] == hari);

    if (sudahAda) {
      // Jika hari sudah ada, tambahkan petugas ke daftar
      jadwalRonda.firstWhere((j) => j["hari"] == hari)["petugas"].add(petugas);
    } else {
      // Jika belum ada, buat entri baru
      jadwalRonda.add({
        "hari": hari,
        "waktu": "Malam",
        "petugas": [petugas],
      });
    }
  }
}
