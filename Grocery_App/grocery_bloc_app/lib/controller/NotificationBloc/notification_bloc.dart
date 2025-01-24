import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/Firebase/firebase_notifications.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_event.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState()) {
    on<NotificationInitialEvent>(notificationInitialEvent);
    on<NotificationRemoveEvent>(notificationRemoveEvent);
  }

  FutureOr<void> notificationInitialEvent(
      NotificationInitialEvent event, Emitter<NotificationState> emit) async {
    emit(NotificationLoadingState());
    await FirebaseNotifications.getNotificationListFromFirebase();
    emit(NotificationLoadedSuccessState(
        notificationList: FirebaseNotifications.notificationList));
  }

  FutureOr<void> notificationRemoveEvent(
      NotificationRemoveEvent event, Emitter<NotificationState> emit) async {
    await FirebaseNotifications.removeNotificationFromFirebase(
        event.notification);

    emit(NotificationLoadedSuccessState(
        notificationList: FirebaseNotifications.notificationList));
  }
}
