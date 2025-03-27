import 'dart:convert';

import '../models/DataUserModel.dart';
import '../providers/user_provider.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<List<DataUserModel>> getUser() async {
    final response = await _userProvider.getUser();

    if (response.statusCode == 200) {
      final List<dynamic> data = response.body;
      return DataUserModel.fromJsonList(data);
    } else {
      throw Exception("Gagal mengambil data user");
    }
  }

  // Fungsi untuk STORE (POST) user baru
  Future<DataUserModel> storeUser(Map<String, dynamic> userData) async {
    final response = await _userProvider.storeUser(userData);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final responseData = response.body; // Ambil body response
      final userJson = responseData['data']; // Ambil hanya bagian 'data'

      return DataUserModel.fromJson(userJson); // Ubah ke model
    } else {
      throw Exception("Gagal menambahkan user: ${response.statusText}");
    }
  }
}
