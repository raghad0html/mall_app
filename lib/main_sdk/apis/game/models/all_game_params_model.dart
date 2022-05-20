import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

import 'game_action_enums_model.dart';

class AllGameParamsModel extends AuthModel {
  GameActionEnumsModel action;

  AllGameParamsModel({
    required this.action,
    required String token,
    required String userid,
  }) : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        // "action": "getGames",
        "action": action.toShortString(),
      }..removeWhere((key, value) => value == null);
}
