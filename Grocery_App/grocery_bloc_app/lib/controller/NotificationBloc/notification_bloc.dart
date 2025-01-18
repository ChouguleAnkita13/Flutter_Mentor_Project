import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_event.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(NotificationInitialState()) {
    on<NotificationInitialEvent>(notificationInitialEvent);
  }

  FutureOr<void> notificationInitialEvent(
      NotificationInitialEvent event, Emitter<NotificationState> emit) {
    emit(NotificationLoadingState());
    emit(NotificationLoadedSuccessState(notificationList: []));
  }
}
