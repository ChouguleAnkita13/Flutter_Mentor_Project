class NotificationModel {
  final String orderId;
  final String message;
  final String dateTime;

  NotificationModel({
    required this.orderId,
    required this.message,
    required this.dateTime,
  });

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      orderId: map['orderId'] as String,
      message: map['message'] as String,
      dateTime: map['dateTime'] as String,
    );
  }
}
