class UserModel {
  String? token;
  int? userId;
  String? name;
  String? email;

  UserModel({this.token, this.userId, this.name, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
