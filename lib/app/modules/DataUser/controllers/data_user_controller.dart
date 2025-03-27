import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:keuangandesa/app/data/models/DataUserModel.dart';
import 'package:keuangandesa/app/data/repositories/user_repository.dart';

class User {
  final int id;
  final String name;
  final String address;
  final String email;
  final String password;
  final String nik;

  User({
    required this.id,
    required this.name,
    required this.address,
    required this.email,
    required this.password,
    required this.nik,
  });
}

class DataUserController extends GetxController {
  // repositori
  final UserRepository _userRepository = UserRepository();

  // loading
  var isLoading = true.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nikController = TextEditingController();

  var selectedRole = "User".obs; // Default role
  var roleList = ["Admin", "User"].obs; // Daftar role

  void setRole(String role) {
    selectedRole.value = role;
  }

  var users = <DataUserModel>[].obs;
  var filteredUsers = <DataUserModel>[].obs;

  void getUser() async {
    final response = await _userRepository.getUser();
    // print(response);
    users.assignAll(response);
    isLoading.value = false;
    response.forEach((user) {
      print('ID: ${user.id}, Name: ${user.name}, Email: ${user.email}');
    });
  }

  @override
  void onInit() {
    super.onInit();
    getUser();
    // Jangan langsung assign sebelum users terisi
    ever(users, (callback) {
      filteredUsers.assignAll(users);
    });
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers.assignAll(users);
    } else {
      filteredUsers.assignAll(users.where(
          (user) => user.name.toLowerCase().contains(query.toLowerCase())));
    }
  }

  Future<void> addUser() async {
    try {
      final userData = {
        "name": nameController.text,
        // "address": addressController.text,
        "email": emailController.text,
        "password": passwordController.text,
        // "nik": nikController.text,
        "role": selectedRole.value
      };

      final newUser = await _userRepository.storeUser(userData);
      users.add(newUser);
      filterUsers(""); // Refresh daftar user

      // Kosongkan field setelah berhasil submit
      nameController.clear();
      addressController.clear();
      emailController.clear();
      passwordController.clear();
      nikController.clear();

      Get.snackbar("Sukses", "User berhasil ditambahkan",
          // posisi bottom
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Gagal menambah user: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void editUser(User user) {
    Get.snackbar("Info", "Fitur edit ${user.name} akan segera hadir!");
  }

  void deleteUser(User user) {
    users.remove(user);
    filterUsers(""); // Perbarui daftar yang ditampilkan
    Get.snackbar("Info", "${user.name} telah dihapus",
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
