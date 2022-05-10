import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class MallParamsModel extends AuthModel {
  String? action;
  String? cityId;

  MallParamsModel(
      {this.action, this.cityId, required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action,
        "city_id": cityId
      }..removeWhere((key, value) => value == null);
}
