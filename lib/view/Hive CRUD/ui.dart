import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class HiveNoteApp extends StatelessWidget {
  const HiveNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(
          "Hive Database",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
