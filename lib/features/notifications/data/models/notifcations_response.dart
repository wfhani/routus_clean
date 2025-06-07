class NotificationsResponse {
  List<NotificationItem>? notifications;

  NotificationsResponse({this.notifications});

  NotificationsResponse.fromJson(Map<String, dynamic> json) {
    if (json['notifications'] != null) {
      notifications = <NotificationItem>[];
      json['notifications'].forEach((v) {
        notifications!.add(NotificationItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationItem {
  String? id;
  String? title;
  String? body;
  String? modelType;
  String? createdAt;
  String? readAt;

  NotificationItem(
      {this.id,
      this.title,
      this.body,
      this.modelType,
      this.createdAt,
      this.readAt});

  NotificationItem.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title'];
    body = json['body'];
    modelType = json['model_type'];
    createdAt = json['created_at'];
    readAt = json['read_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['model_type'] = modelType;
    data['created_at'] = createdAt;
    data['read_at'] = readAt;
    return data;
  }
}
