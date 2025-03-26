import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../utils/constants.dart';

class AuthProvider extends GetConnect {
  final box = GetStorage();
// ambil baseurl dari constants

  Future<Response> login(String username, String password) async {
    return post('${baseUrl}api/login', {
      'email': username,
      'password': password,
    });
  }

  // get token nya dimana
  String? getToken() => box.read('token');
}
