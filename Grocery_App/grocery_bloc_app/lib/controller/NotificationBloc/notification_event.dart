import 'package:grocery_bloc_app/model/notification_model.dart';

abstract class NotificationEvent {}

class NotificationInitialEvent extends NotificationEvent {}

class NotificationRemoveEvent extends NotificationEvent {
  final NotificationModel notification;

  NotificationRemoveEvent({required this.notification});
}
