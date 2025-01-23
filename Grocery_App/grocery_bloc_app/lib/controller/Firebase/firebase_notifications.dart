import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/model/notification_model.dart';
import 'dart:developer';

class FirebaseNotifications {
  static List<NotificationModel> notificationList = [];
  static FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;

  static Future<void> getNotificationListFromFirebase() async {
    final docInstance =
        firebaseInstance.collection("Users").doc(SessionData.email);
    DocumentSnapshot userDoc = await docInstance.get();

    notificationList = List.generate(
        userDoc['notificationList'].length,
        (i) => NotificationModel(
            orderId: userDoc['notificationList'][i]['orderId'],
            message: userDoc['notificationList'][i]['message'],
            dateTime: userDoc['notificationList'][i]['dateTime']));
    log("${userDoc['notificationList']}");

    log("${notificationList.runtimeType}");
  }
}
