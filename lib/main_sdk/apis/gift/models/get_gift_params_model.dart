import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class GetGiftParamsModel extends AuthModel {
  GetGiftParamsModel({required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'getGifts',
      }..removeWhere((key, value) => value == null);
}
