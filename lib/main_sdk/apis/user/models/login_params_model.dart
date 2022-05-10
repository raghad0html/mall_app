



class LoginParamsModel {
  String? email;
  String? password;

  LoginParamsModel({
    this.email,
    this.password,
  });

  Map<String, dynamic> toMap() => {
        "token": email,
        "userid": password,
      }..removeWhere((key, value) => value == null);
}
