import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';
import 'package:mall_app/main_sdk/apis/mall/models/mall_action_enums_model.dart';

class MallParamsModel extends AuthModel {
  MallActionEnumsModel? action;
  String? cityId;

  MallParamsModel(
      {this.action, this.cityId, required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action?.toShortString(),
        "city_id": cityId
      }..removeWhere((key, value) => value == null);
}
