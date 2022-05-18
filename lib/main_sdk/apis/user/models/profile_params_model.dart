import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';


class ProfileParamsModel extends AuthModel {

  ProfileParamsModel(
      {
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'getProfile',
      }..removeWhere((key, value) => value == null);
}
