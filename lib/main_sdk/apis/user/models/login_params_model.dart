



class LoginParamsModel {
  String? email;
  String? password;

  LoginParamsModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      }..removeWhere((key, value) => value == null);
}
