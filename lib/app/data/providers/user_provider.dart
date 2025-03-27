import 'package:get/get.dart';
import '../../utils/constants.dart';
import '../providers/auth_provider.dart';

class UserProvider extends GetConnect {
// ambil baseurl dari constants
  var token = AuthProvider().getToken();

  Future<Response> getUser() async {
    // gimana kalo get data
    return get(
      '${baseUrl}api/getuser',
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
  }

  // buatkan function untuk store// Fungsi untuk POST (store) data user
  Future<Response> storeUser(Map<String, dynamic> data) async {
    return post(
      '${baseUrl}api/postuser',
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      data, // Pastikan data dikirim dengan benar
    );
  }
}
