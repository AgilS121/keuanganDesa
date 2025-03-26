import '../models/UserModel.dart';
import '../providers/auth_provider.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();
  final box = GetStorage();
  Future<UserModel> login(String username, String password) async {
    final response = await _authProvider.login(username, password);
    if (response.statusCode == 200) {
      final data = response.body;

      final user = UserModel.fromJson(data);
      box.write('token', user.token);
      return user;
    } else {
      throw Exception(
          'Gagal login: ${response.statusText}'); // Ubah sesuai kebutuhan
    }
  }
}
