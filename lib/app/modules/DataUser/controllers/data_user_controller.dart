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

  void addUser(
      String name, String address, String email, String password, String nik) {
    final newUser = User(
      id: users.length + 1,
      name: name,
      address: address,
      email: email,
      password: password,
      nik: nik,
    );
    // users.add(newUser);
    filterUsers(""); // Refresh daftar pengguna
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
