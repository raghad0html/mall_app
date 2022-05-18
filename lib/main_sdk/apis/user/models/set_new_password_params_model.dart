class SetNewPasswordParamsModel {
  String email;
  String password;
  String code;

  SetNewPasswordParamsModel({
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "code": code,
      }..removeWhere((key, value) => value == null);
}
