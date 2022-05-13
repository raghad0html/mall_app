import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class GetGiftByMallParamsModel extends AuthModel {
  String mallId;

  GetGiftByMallParamsModel(
      {required this.mallId, required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'getGifts',
        "mall_id": mallId
      }..removeWhere((key, value) => value == null);
}
