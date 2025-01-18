import 'package:grocery_bloc_app/model/notification_model.dart';

abstract class NotificationState {}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationLoadedSuccessState extends NotificationState {
  final List<NotificationModel> notificationList;

  NotificationLoadedSuccessState({required this.notificationList});
}
