import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_bloc.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_event.dart';
import 'package:grocery_bloc_app/controller/NotificationBloc/notification_state.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationBloc noteficationBloc = NotificationBloc();

    return BlocProvider(
      create: (context) {
        return noteficationBloc..add(NotificationInitialEvent());
      },
      child: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
        if (state is NotificationLoadedSuccessState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppbar.customAppbar("Notifications"),
            body: state.notificationList.isEmpty
                ? const Center(
                    child: Text(
                      "No Notifications",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: state.notificationList.length,
                    padding: const EdgeInsets.all(15),
                    itemBuilder: (context, index) {
                      final notification = state.notificationList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(14, 161, 125, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Notification Icon
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.notifications,
                                  color: Color.fromRGBO(14, 161, 125, 1),
                                  size: 20,
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Notification Details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "#${notification.orderId} ${notification.message}",
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      notification.date,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Remove button
                              GestureDetector(
                                onTap: () {
                                  noteficationBloc.add(NotificationRemoveEvent(
                                      notification: notification));
                                },
                                child: const Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
