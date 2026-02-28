import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intorduction_screen/main.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intorduction_screen/main.dart';
import 'package:get/get.dart';

import '../Map/map.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void showNotification() async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
          "Local Notification ",
          "notification",
          priority: Priority.max,
          enableVibration: true,
          importance: Importance.max,
        );
    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    DateTime scheduledTime = tz.TZDateTime.now(
      tz.local,
    ).add(Duration(seconds: 5));
    await notificationsPlugin.zonedSchedule(
      id: 1,
      title: "Simple",
      body: "This is Local Notification",
      scheduledDate: tz.TZDateTime.from(scheduledTime, tz.local),
      notificationDetails: notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
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
            onPressed: (){
              Get.to(()=>MapPrac());
            },
            child: Text("Map screen "),
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
