import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class ProductParamsModel extends AuthModel {
  String? action;

  String shopId;

  ProductParamsModel(
      {this.action = 'getProducts',
      required this.shopId,
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action,
        "shop_id": shopId
      }..removeWhere((key, value) => value == null);
}
