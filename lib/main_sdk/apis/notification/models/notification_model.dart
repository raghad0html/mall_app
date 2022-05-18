class ListOfNotificationModel {
  ListOfNotificationModel({
    this.data,
  });

  ListOfNotificationModel.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(NotificationModel.fromJson(v));
      });
    }
  }

  List<NotificationModel>? data;
}

class NotificationModel {
  int? notificationId;
  String? notificationTitle;
  String? notificationContent;
  DateTime? notificationDate;
  int? notificationSeen;
  int? userId;

  NotificationModel(
      {this.notificationId,
      this.notificationTitle,
      this.notificationContent,
      this.notificationDate,
      this.notificationSeen,
      this.userId});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    notificationId = json['noti_id'];
    notificationTitle = json['noti_title'];
    notificationContent = json['noti_content'];
    notificationDate = json['noti_date'] != null
        ? DateTime.parse(json['noti_date'] as String)
        : null;
    notificationSeen = json['noti_seen'];
    userId = json['user_id'];
  }
}
