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
}
