import 'package:get/get.dart';

class Keuangan {
  int jumlah;
  String jenis; // "Pemasukan" atau "Pengeluaran"
  String keterangan;

  Keuangan(
      {required this.jumlah, required this.jenis, required this.keterangan});
}

class KeuanganController extends GetxController {
  var keuanganList = <Keuangan>[].obs;
  var filter = 'Semua'.obs;

  List<Keuangan> get filteredKeuangan {
    if (filter.value == 'Semua') return keuanganList;
    return keuanganList.where((item) => item.jenis == filter.value).toList();
  }

  void addKeuangan(
      {required int jumlah,
      required String jenis,
      required String keterangan}) {
    keuanganList
        .add(Keuangan(jumlah: jumlah, jenis: jenis, keterangan: keterangan));
  }

  void setFilter(String value) {
    filter.value = value;
  }
}
