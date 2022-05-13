import 'package:mall_app/main_sdk/apis/core/models/common/result_class.dart';
import 'package:mall_app/main_sdk/apis/core/servisec/identity/api_identity.dart';
import 'package:mall_app/main_sdk/apis/notification/models/notification_model.dart';
import 'package:mall_app/main_sdk/apis/notification/models/notification_params_model.dart';

import 'package:mall_app/main_sdk/enum/http_enum.dart';

class NotificationIdentityApi extends ApiModelIdentity {
  Future<ResponseState<ListOfNotificationModel>> getNotifications(
      {required NotificationParamsModel notificationParamsModel}) async {
    return apiMethod('notifications.php',
        data: notificationParamsModel.toMap(),
        httpEnum: HttpEnum.post,
        parseJson: (json) => ListOfNotificationModel.fromJson(json));
  }
}
