import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class ShopParamsModel extends AuthModel {
  String? action;

  String mallId;

  ShopParamsModel(
      {this.action = 'getShops',
      required this.mallId,
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action,
        "mall_id": mallId
      }..removeWhere((key, value) => value == null);
}
