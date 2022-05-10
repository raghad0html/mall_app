import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';
import 'package:mall_app/main_sdk/apis/game/models/game_action_enums_model.dart';

class GameParamsModel extends AuthModel {
  GameActionEnumsModel action;
  int mallId;

  GameParamsModel(
      {required this.action,required this.mallId, required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action.toShortString(),
        "mall_id": mallId
      }..removeWhere((key, value) => value == null);
}
