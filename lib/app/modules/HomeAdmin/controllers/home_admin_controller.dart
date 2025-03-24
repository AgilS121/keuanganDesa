import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeAdminController extends GetxController {
  // Data keterangan waktu
  String getKeteranganWaktu() {
    int hour = DateTime.now().hour;
    if (hour >= 5 && hour < 12) {
      return "Pagi";
    } else if (hour >= 12 && hour < 15) {
      return "Siang";
    } else if (hour >= 15 && hour < 18) {
      return "Sore";
    } else {
      return "Malam";
    }
  }

  // Data observasi untuk pemasukan dan pengeluaran
  var pemasukanData = <FlSpot>[].obs;
  var pengeluaranData = <FlSpot>[].obs;
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

  @override
  void onInit() {
    super.onInit();

    // Inisialisasi data grafik pemasukan dan pengeluaran
    // harus pake assign value
    pemasukanData.assignAll([
      FlSpot(0, 5),
      FlSpot(1, 8),
      FlSpot(2, 6),
      FlSpot(3, 10),
      FlSpot(4, 7),
    ]);
    pengeluaranData.assignAll([
      FlSpot(0, 3),
      FlSpot(1, 5),
      FlSpot(2, 4),
      FlSpot(3, 6),
      FlSpot(4, 8),
    ]);
    // pemasukanData.value = [
    //   FlSpot(0, 5),
    //   FlSpot(1, 8),
    //   FlSpot(2, 6),
    //   FlSpot(3, 10),
    //   FlSpot(4, 7),
    // ];

    // pengeluaranData.value = [
    //   FlSpot(0, 2),
    //   FlSpot(1, 4),
    //   FlSpot(2, 3),
    //   FlSpot(3, 5),
    //   FlSpot(4, 4),
    // ];
  }

  // Update data pemasukan dan pengeluaran
  void updateChartData() {
    pemasukanData.value = [
      FlSpot(0, 6),
      FlSpot(1, 10),
      FlSpot(2, 7),
      FlSpot(3, 12),
      FlSpot(4, 9),
    ];

    pengeluaranData.value = [
      FlSpot(0, 3),
      FlSpot(1, 5),
      FlSpot(2, 4),
      FlSpot(3, 6),
      FlSpot(4, 5),
    ];
    // tambahkan snacbar bahwa data terupdate
    Get.snackbar(
      'Success',
      'Data Terupdate',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      // kasih biar ke atas dikit
      // margin: EdgeInsets.only(top: 20),
    );
  }

  // Menambah titik data pemasukan
  void addPemasukan(double x, double y) {
    pemasukanData.add(FlSpot(x, y));
  }

  // Menambah titik data pengeluaran
  void addPengeluaran(double x, double y) {
    pengeluaranData.add(FlSpot(x, y));
  }
}
