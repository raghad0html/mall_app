import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class AllGameParamsModel extends AuthModel {
  AllGameParamsModel({
    required String token,
    required String userid,
  }) : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": "getGames",
        'action': 'getActiveGames'
      }..removeWhere((key, value) => value == null);
}
