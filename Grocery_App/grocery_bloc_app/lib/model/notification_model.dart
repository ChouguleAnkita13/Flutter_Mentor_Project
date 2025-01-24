import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String orderId;
  final String message;
  final String date;
  final Timestamp time;

  NotificationModel(
      {required this.orderId,
      required this.message,
      required this.date,
      required this.time});

  // Map<String, dynamic> notificationMap() {
  //   return {
  //     "message": message,
  //     "dateTime": dateTime,
  //     "orderId": orderId,
  //   };
  // }
}
