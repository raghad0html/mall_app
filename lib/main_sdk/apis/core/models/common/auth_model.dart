

class AuthModel {
  String? token;
  String? userid;

  AuthModel({
    this.token,
    this.userid,
  });

  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
      }..removeWhere((key, value) => value == null);
}
