import 'package:get/get.dart';

class Pengumuman {
  String judul;
  String deskripsi;
  String tanggal;

  Pengumuman(
      {required this.judul, required this.deskripsi, required this.tanggal});
}

class PengumumanUserController extends GetxController {
  var pengumumanList = <Pengumuman>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPengumuman();
  }

  void fetchPengumuman() {
    // Simulasi data (nanti bisa diganti dengan API)
    pengumumanList.addAll([
      Pengumuman(
          judul: "Update Aplikasi",
          deskripsi: "Aplikasi telah diperbarui ke versi terbaru.",
          tanggal: "25 Maret 2025"),
      Pengumuman(
          judul: "Jadwal Rapat",
          deskripsi: "Rapat akan dilaksanakan pada hari Jumat.",
          tanggal: "26 Maret 2025"),
    ]);
  }
}
