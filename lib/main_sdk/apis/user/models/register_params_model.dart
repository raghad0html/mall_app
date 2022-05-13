class RegisterParamsModel {
  String email;
  String password;
  String name;
  String phone;
  int cityId;

  RegisterParamsModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.cityId,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "city": cityId,
      }..removeWhere((key, value) => value == null);
}
