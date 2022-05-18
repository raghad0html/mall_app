import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class UpdateProfileParamsModel extends AuthModel {
  String email;

  String name;
  String phone;
  int cityId;

  UpdateProfileParamsModel(
      {required this.email,
      required this.name,
      required this.phone,
      required this.cityId,
      required String token,
      required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "email": email,
        "name": name,
        "phone": phone,
        "city_id": cityId,
        "token": token,
        "userid": userid,
        "action": 'updateProfile',
      }..removeWhere((key, value) => value == null);
}
