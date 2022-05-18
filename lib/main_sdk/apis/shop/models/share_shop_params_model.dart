import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class ShareShopParamsModel extends AuthModel {
  String? action;

  String mallId;
  String cityId;
  ShareShopParamsModel(
      {this.action = 'getShops',
      required this.mallId,
      required String token,
      required String userid,
      required this.cityId})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action,
        "mall_id": mallId,
        "city_id": cityId,
      }..removeWhere((key, value) => value == null);
}
