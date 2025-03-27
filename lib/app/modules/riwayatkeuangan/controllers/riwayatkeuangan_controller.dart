import 'package:get/get.dart';

class RiwayatkeuanganController extends GetxController {
  //TODO: Implement RiwayatkeuanganController
  var pemasukan = <Map<String, dynamic>>[
    {
      "id": 1,
      "tanggal": "2024-03-01",
      "sumber": "Iuran Warga",
      "jumlah": 500000,
      "keterangan": "Iuran bulan Maret",
    },
    {
      "id": 2,
      "tanggal": "2024-03-05",
      "sumber": "Sumbangan",
      "jumlah": 200000,
      "keterangan": "Donasi dari Pak Budi",
    },
    {
      "id": 3,
      "tanggal": "2024-03-10",
      "sumber": "Denda",
      "jumlah": 50000,
      "keterangan": "Terlambat bayar iuran",
    },
  ].obs; // Menggunakan `obs` agar reaktif

  var pengeluaran = <Map<String, dynamic>>[
    {
      "id": 1,
      "tanggal": "2024-03-02",
      "sumber": "Biaya Kebersihan",
      "jumlah": 150000,
      "keterangan": "Pembayaran petugas kebersihan",
    },
    {
      "id": 2,
      "tanggal": "2024-03-07",
      "sumber": "Pembelian Alat",
      "jumlah": 300000,
      "keterangan": "Pembelian sapu dan tempat sampah",
    },
    {
      "id": 3,
      "tanggal": "2024-03-12",
      "sumber": "Acara RT",
      "jumlah": 250000,
      "keterangan": "Biaya konsumsi rapat warga",
    },
  ].obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
