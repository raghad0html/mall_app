import 'package:mall_app/main_sdk/apis/core/models/common/auth_model.dart';

class NotificationParamsModel extends AuthModel {
  NotificationParamsModel({required String token, required String userid})
      : super(token: token, userid: userid);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": 'allNotifications'
      }..removeWhere((key, value) => value == null);
}
