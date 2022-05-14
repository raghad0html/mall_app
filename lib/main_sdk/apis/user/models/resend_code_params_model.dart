class ResendCodeParamsModel {
  String email;

  ResendCodeParamsModel({
    required this.email,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
      }..removeWhere((key, value) => value == null);
}
