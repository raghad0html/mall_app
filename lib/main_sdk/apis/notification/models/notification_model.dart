class ListOfNotificationModel {
  int? count;
  List<NotificationModel>? notifications;

  ListOfNotificationModel({
    this.count,
    this.notifications,
  });

  ListOfNotificationModel.fromJson(Map<String, dynamic> json) {
    count = json['count'] ?? 0;

    notifications = json['notifications'] != null
        ? List.from(json['notifications'])
            .map((element) => NotificationModel.fromJson(element))
            .toList()
        : [];
  }
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
