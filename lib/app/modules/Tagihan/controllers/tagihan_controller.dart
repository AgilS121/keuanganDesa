import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';

class TagihanController extends GetxController {
  //TODO: Implement TagihanController

  final TextEditingController namaTagihanController = TextEditingController();
  final TextEditingController jumlahController = TextEditingController();
  final TextEditingController tanggalJatuhTempoController =
      TextEditingController();
  final TextEditingController tambahTagihanController = TextEditingController();

  final count = 0.obs;
  var tagihanList = <Map<String, dynamic>>[
    {
      "id": 1,
      "nama": "Iuran Bulanan",
      "jumlah": 50000,
      "tanggalJatuhTempo": "2024-04-01",
      "statusLunas": false,
    },
    {
      "id": 2,
      "nama": "Uang Keamanan",
      "jumlah": 20000,
      "tanggalJatuhTempo": "2024-04-10",
      "statusLunas": true,
    },
    {
      "id": 3,
      "nama": "Sumbangan RT",
      "jumlah": 100000,
      "tanggalJatuhTempo": "2024-04-15",
      "statusLunas": false,
    },
  ].obs;

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      tanggalJatuhTempoController.text =
          "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  var wargaList = <Map<String, String>>[
    {"id": "1", "nama": "Budi Santoso"},
    {"id": "2", "nama": "Siti Aminah"},
    {"id": "3", "nama": "Rudi Hartono"},
  ].obs;

  var selectedWarga = "".obs;

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
