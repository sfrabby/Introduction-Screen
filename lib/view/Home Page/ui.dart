import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intorduction_screen/main.dart';
import 'package:timezone/timezone.dart' as tz;

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
    DateTime? scheduldate = DateTime.now().add(Duration(seconds: 5));
    await notificationsPlugin.zonedSchedule(
      tz.TZDateTime.from(scheduldate, tz.local),
      id: 0,
      body: "This is Local Notification",
      notificationDetails: notificationDetails,
      title: "Simple",
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle, scheduledDate: scheduldate,

    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: showNotification,
            child: Text("Local Notification "),
          ),
          ElevatedButton(
            onPressed: () async {
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now(),
              );
              print(date);
            },
            child: Text("Date picker "),
          ),

          ElevatedButton(
            onPressed: showNotification,
            child: Text("Local Notification "),
          ),

          ElevatedButton(
            onPressed: showNotification,
            child: Text("Local Notification "),
          ),
        ],
      ),
    );
  }
}
