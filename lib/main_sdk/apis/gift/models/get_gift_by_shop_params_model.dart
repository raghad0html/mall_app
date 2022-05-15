import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class GetGiftByShopParamsModel extends AuthModel {
  String shopId;

  GetGiftByShopParamsModel(
      {required this.shopId, required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'getGiftsByShop',
        "shop_id": shopId
      }..removeWhere((key, value) => value == null);
}
