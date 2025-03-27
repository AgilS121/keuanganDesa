import 'package:get/get.dart';

class PengumumanController extends GetxController {
  // List pengumuman menggunakan Map<String, dynamic>
  final pengumumanList = <Map<String, dynamic>>[
    {
      "id": 1,
      "title": "Jadwal Pembayaran Iuran Bulanan",
      "content":
          "Iuran RT bulan ini jatuh tempo pada tanggal 10. Harap melakukan pembayaran tepat waktu.",
      "date": "2024-03-01",
    },
    {
      "id": 2,
      "title": "Laporan Keuangan RT",
      "content":
          "Laporan keuangan RT bulan Februari sudah tersedia. Silakan cek di menu laporan keuangan.",
      "date": "2024-03-05",
    },
    {
      "id": 3,
      "title": "Rapat Warga Bulanan",
      "content":
          "Rapat warga akan diadakan pada tanggal 15 di balai warga. Harap hadir tepat waktu.",
      "date": "2024-03-10",
    },
  ].obs;

  // Tambah pengumuman baru
  void addPengumuman(String title, String content, String date) {
    pengumumanList.add({
      "id": pengumumanList.length + 1,
      "title": title,
      "content": content,
      "date": date,
    });
  }

  // Hapus pengumuman berdasarkan ID
  void removePengumuman(int id) {
    pengumumanList.removeWhere((item) => item["id"] == id);
  }
}
