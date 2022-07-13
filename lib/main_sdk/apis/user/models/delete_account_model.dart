import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class DeleteAccountParamsModel extends AuthModel {
  String? email;

  DeleteAccountParamsModel(
      {required String token, required String userid, required this.email})
      : super(token: token, userid: userid);

  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "email": email,
      }..removeWhere((key, value) => value == null);
}
