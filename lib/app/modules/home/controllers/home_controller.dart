import 'package:get/get.dart';

class HomeController extends GetxController {
  // Data tagihan dalam bentuk list observable
  var tagihanList = <Map<String, dynamic>>[].obs;

  // Data jadwal ronda dalam bentuk list observable
  var jadwalRondaList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTagihan(); // Ambil data tagihan saat controller diinisialisasi
    fetchJadwalRonda(); // Ambil data jadwal ronda
  }

  void fetchTagihan() {
    tagihanList.addAll([
      {
        "id": "1",
        "nama": "Iuran Kebersihan",
        "jumlah": 50000,
        "status": "Belum Lunas"
      },
      {"id": "2", "nama": "Iuran Keamanan", "jumlah": 30000, "status": "Lunas"},
      {"id": "3", "nama": "Kas RT", "jumlah": 20000, "status": "Belum Lunas"},
    ]);
  }

  void fetchJadwalRonda() {
    jadwalRondaList.addAll([
      {"id_user": "123", "nama": "Budi", "tanggal": "2025-03-26"},
      {"id_user": "456", "nama": "Andi", "tanggal": "2025-03-27"},
    ]);
  }

  bool isUserScheduled(String userId) {
    return jadwalRondaList.any((ronda) => ronda["id_user"] == userId);
  }
}
