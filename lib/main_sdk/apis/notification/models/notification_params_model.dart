class NotificationParamsModel extends NotificationRequestModel {
  NotificationParamsModel({
    required String token,
    required String userid,
    required String action,
    required String notificationId,
  }) : super(
            token: token,
            userid: userid,
            action: action,
            notificationId: notificationId);

  @override
  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action ?? 'allNotifications',
        "noti_id": notificationId ?? '',
      }..removeWhere((key, value) => value == null);
}

class NotificationRequestModel {
  String? token;
  String? userid;
  String? action;
  String? notificationId;
  NotificationRequestModel(
      {this.token, this.userid, this.action, this.notificationId});

  Map<String, dynamic> toMap() => {
        "token": token,
        "userid": userid,
        "action": action,
        "noti_id": notificationId,
      }..removeWhere((key, value) => value == null);
}
