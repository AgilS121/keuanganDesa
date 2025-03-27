class DataUserModel {
  final int id;
  final String name;
  final String email;
  final String role;

  DataUserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
  });

  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
    );
  }

  static List<DataUserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DataUserModel.fromJson(json)).toList();
  }
}
