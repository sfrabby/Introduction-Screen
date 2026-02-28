import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:intorduction_screen/view/Inrtroduction%20Page/ui.dart';
import 'package:timezone/data/latest.dart' ;



FlutterLocalNotificationsPlugin notificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   initializeTimeZones();
  AndroidInitializationSettings androidInitializationSettings =
      AndroidInitializationSettings("@mipmap/ic_launcher");

  InitializationSettings initializationSettings = InitializationSettings(
    android: androidInitializationSettings,
  );
  bool? initialized = await notificationsPlugin.initialize(
    settings: initializationSettings,
  );
  log("Notification = $initialized");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: IntroductionPage(),
    );
  }
}
