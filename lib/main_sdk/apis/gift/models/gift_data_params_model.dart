import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class GiftDataParamsModel extends AuthModel {
  GiftDataParamsModel({required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'giftQuantity'
      }..removeWhere((key, value) => value == null);
}
