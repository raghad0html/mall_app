class RegisterParamsModel {
  String? email;
  String? password;
  String? name;
  String? phone;
  int? cityId;

  RegisterParamsModel({
    this.email,
    this.password,
    this.name,
    this.phone,
    this.cityId,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "name": name,
        "phone": phone,
        "city": cityId,
      }..removeWhere((key, value) => value == null);
}
