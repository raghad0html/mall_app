class ResendPasswordParamsModel {
  String email;

  ResendPasswordParamsModel({
    required this.email,
  });

  Map<String, dynamic> toMap() => {
        "email": email,
      }..removeWhere((key, value) => value == null);
}
