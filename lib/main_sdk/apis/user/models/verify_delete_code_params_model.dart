import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class VerifyDeleteCodeParamsModel extends AuthModel {
  String? email;
  String code;

  VerifyDeleteCodeParamsModel(
      {required String token,
      required String userid,
      required this.email,
      required this.code})
      : super(token: token, userid: userid);

  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "email": email,
        "code": code,
      }..removeWhere((key, value) => value == null);
}
