import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Warga {
  final String name;
  final String nik;
  final String address;
  final String gender;
  final String phone;
  final String tanggalLahir;
  final String pekerjaan;
  final String agama;
  final String statusPernikahan;

  Warga({
    required this.name,
    required this.nik,
    required this.address,
    required this.gender,
    required this.phone,
    required this.tanggalLahir,
    required this.pekerjaan,
    required this.agama,
    required this.statusPernikahan,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'nik': nik,
      'address': address,
      'gender': gender,
      'phone': phone,
      'tanggalLahir': tanggalLahir,
      'pekerjaan': pekerjaan,
      'agama': agama,
      'statusPernikahan': statusPernikahan,
    };
  }
}

class WargaController extends GetxController {
  var wargaList = <Warga>[].obs;
  var filteredWarga = <Warga>[].obs;
  void loadDummyData() {
    wargaList.assignAll([
      Warga(
        name: "Budi Santoso",
        nik: "3276010101010001",
        address: "Jl. Merdeka No. 10, Jakarta",
        gender: "Laki-laki",
        phone: "081234567890",
        tanggalLahir: "01-01-1990",
        pekerjaan: "Pegawai Negeri",
        agama: "Islam",
        statusPernikahan: "Menikah",
      ),
      Warga(
        name: "Siti Aisyah",
        nik: "3276010202020002",
        address: "Jl. Sudirman No. 5, Bandung",
        gender: "Perempuan",
        phone: "082345678901",
        tanggalLahir: "02-02-1995",
        pekerjaan: "Guru",
        agama: "Islam",
        statusPernikahan: "Belum Menikah",
      ),
      Warga(
        name: "Andi Wijaya",
        nik: "3276010303030003",
        address: "Jl. Diponegoro No. 15, Surabaya",
        gender: "Laki-laki",
        phone: "083456789012",
        tanggalLahir: "03-03-1985",
        pekerjaan: "Wiraswasta",
        agama: "Kristen",
        statusPernikahan: "Menikah",
      ),
      Warga(
        name: "Rina Kusuma",
        nik: "3276010404040004",
        address: "Jl. Thamrin No. 7, Yogyakarta",
        gender: "Perempuan",
        phone: "084567890123",
        tanggalLahir: "04-04-1998",
        pekerjaan: "Mahasiswa",
        agama: "Hindu",
        statusPernikahan: "Belum Menikah",
      ),
      Warga(
        name: "Joko Priyono",
        nik: "3276010505050005",
        address: "Jl. Gajah Mada No. 20, Semarang",
        gender: "Laki-laki",
        phone: "085678901234",
        tanggalLahir: "05-05-1975",
        pekerjaan: "Petani",
        agama: "Buddha",
        statusPernikahan: "Menikah",
      ),
    ]);
  }

  // Controllers untuk input form
  final TextEditingController nameController = TextEditingController();
  final TextEditingController nikController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController pekerjaanController = TextEditingController();
  final TextEditingController agamaController = TextEditingController();
  final TextEditingController statusPernikahanController =
      TextEditingController();

  @override
  void onInit() {
    super.onInit();
    loadDummyData();
    filteredWarga.assignAll(wargaList);
  }

  void filterWarga(String query) {
    if (query.isEmpty) {
      filteredWarga.assignAll(wargaList);
    } else {
      filteredWarga.assignAll(
        wargaList.where((warga) =>
            warga.name.toLowerCase().contains(query.toLowerCase()) ||
            warga.nik.contains(query)),
      );
    }
  }

  void addWarga() {
    final newWarga = Warga(
      name: nameController.text,
      nik: nikController.text,
      address: addressController.text,
      gender: genderController.text,
      phone: phoneController.text,
      tanggalLahir: tanggalLahirController.text,
      pekerjaan: pekerjaanController.text,
      agama: agamaController.text,
      statusPernikahan: statusPernikahanController.text,
    );

    wargaList.add(newWarga);
    filteredWarga.assignAll(wargaList);
    Get.snackbar("Sukses", "Data warga berhasil ditambahkan",
        backgroundColor: Colors.green, colorText: Colors.white);
    clearForm();
  }

  void editWarga(int index) {
    wargaList[index] = Warga(
      name: nameController.text,
      nik: nikController.text,
      address: addressController.text,
      gender: genderController.text,
      phone: phoneController.text,
      tanggalLahir: tanggalLahirController.text,
      pekerjaan: pekerjaanController.text,
      agama: agamaController.text,
      statusPernikahan: statusPernikahanController.text,
    );

    filteredWarga.assignAll(wargaList);
    Get.snackbar("Berhasil", "Data warga diperbarui",
        backgroundColor: Colors.blue, colorText: Colors.white);
  }

  void deleteWarga(int index) {
    wargaList.removeAt(index);
    filteredWarga.assignAll(wargaList);
    Get.snackbar("Dihapus", "Data warga telah dihapus",
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  void clearForm() {
    nameController.clear();
    nikController.clear();
    addressController.clear();
    genderController.clear();
    phoneController.clear();
    tanggalLahirController.clear();
    pekerjaanController.clear();
    agamaController.clear();
    statusPernikahanController.clear();
  }
}
