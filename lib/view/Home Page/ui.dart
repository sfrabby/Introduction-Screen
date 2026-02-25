import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intorduction_screen/main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          "Local Notification ",
          "nottification",
          priority: Priority.max,
          enableVibration: true,
          importance: Importance.max,
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
     await notificationsPlugin.show(
      id: 0,
      body: "This is Local Notification",
      notificationDetails: notificationDetails,
      title: "Simple",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: showNotification, child: Text("Local Notification ")),
        ],
      ),
    );
  }
}
