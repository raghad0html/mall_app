import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class AssingRandomGiftToUserParamsModel extends AuthModel {
  String mallId;
  String gameId;

  AssingRandomGiftToUserParamsModel(
      {required this.mallId,
      required this.gameId,
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'getRandomGift',
        "mall_id": mallId,
        "game_id": gameId,
      }..removeWhere((key, value) => value == null);
}
