class DataUserModel {
  final int id;
  final String name;
  final String email;

  DataUserModel({
    required this.id,
    required this.name,
    required this.email,
  });

  factory DataUserModel.fromJson(Map<String, dynamic> json) {
    return DataUserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }

  static List<DataUserModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => DataUserModel.fromJson(json)).toList();
  }
}
