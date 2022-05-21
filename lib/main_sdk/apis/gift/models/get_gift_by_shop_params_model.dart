import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class GetGiftByShopParamsModel extends AuthModel {
  String shopId;
  String action;

  GetGiftByShopParamsModel(
      {required this.shopId,
      required String token,
      required String userid,
      required this.action})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action, //'getGiftsByShop',
        "shop_id": shopId
      }..removeWhere((key, value) => value == null);
}
