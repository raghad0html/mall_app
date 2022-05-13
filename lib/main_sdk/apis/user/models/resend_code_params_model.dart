class ResendCodeParamsModel {
  String email;
  String password;

  ResendCodeParamsModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
      }..removeWhere((key, value) => value == null);
}
