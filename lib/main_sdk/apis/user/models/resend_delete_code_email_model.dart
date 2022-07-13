import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class ResendDeleteCodeEmailModel extends AuthModel {
  String? email;

  ResendDeleteCodeEmailModel(
      {required String token, required String userid, required this.email})
      : super(token: token, userid: userid);

  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "email": email,
      }..removeWhere((key, value) => value == null);
}
