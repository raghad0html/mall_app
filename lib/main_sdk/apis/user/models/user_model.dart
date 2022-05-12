class UserModel {
  String? token;
  int? userId;
  String? name;
  String? email;
  int? cityId;
  String? cityName;

  UserModel(
      {this.token,
      this.userId,
      this.name,
      this.email,
      this.cityId,
      this.cityName});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    cityId = json['city_id'];
    cityName = json['city_name'] ?? '-';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['user_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['city_id'] = cityId;
    data['city_name'] = cityName;

    return data;
  }
}
