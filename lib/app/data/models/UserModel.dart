class UserModel {
  String? name;
  String? email;
  String? role;
  String? token;

  UserModel({this.name, this.email, this.role, this.token});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['user']['name'],
      email: json['user']['email'],
      role: json['user']['role'],
      token: json['token'],
    );
  }
}
