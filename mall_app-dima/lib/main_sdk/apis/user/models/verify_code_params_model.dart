class VerifyCodeParamsModel {
  String email;
  String code;

  VerifyCodeParamsModel({
    required this.email,
    required this.code,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
        "code": code,
      }..removeWhere((key, value) => value == null);
}
