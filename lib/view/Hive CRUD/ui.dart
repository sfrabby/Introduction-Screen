import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class HiveNoteApp extends StatefulWidget {
  HiveNoteApp({super.key});

  @override
  State<HiveNoteApp> createState() => _HiveNoteAppState();
}

class _HiveNoteAppState extends State<HiveNoteApp> {
  TextEditingController titleC = TextEditingController();

  TextEditingController taskC = TextEditingController();

  var taskbox = Hive.box("task");

  List<Map<String, dynamic>> ourTask = [];

  createdData(Map<String, dynamic> data) async {
    await taskbox.add(data);
    readData();
    log(taskbox.length.toString());
  }

  readData() async {
    var data = taskbox.keys.map((keys) {
      final item = taskbox.get(keys);
      return {'keys': keys, 'title': item['title'], 'task': item['task']};
    }).toList();

    setState(() {
      ourTask = data.reversed.toList();
      log(ourTask.toString());

    });

     var index = 0;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  // বটম শিট ওপেন করার ফাংশন
  void showAddNoteSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Add New Note",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              // Title TextField
              TextField(
                controller: titleC,
                decoration: InputDecoration(
                  labelText: "Title",
                  hintText: "Enter note title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.title),
                ),
              ),
              const SizedBox(height: 15),
              // Task TextField
              TextField(
                controller: taskC,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Task",
                  hintText: "Write your task here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.description),
                ),
              ),
              const SizedBox(height: 20),
              // Add Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    var data = {'title': titleC.text, 'task': taskC.text};
                    createdData(data);
                    Get.back(); // বটম শিট বন্ধ করা
                    Get.snackbar(
                      "Success",
                      "Note added successfully",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.teal,
                      colorText: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Add Note",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      isScrollControlled: true, // কিবোর্ড আসলে যেন স্ক্রিন উপরে উঠে
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 0,
        title: const Text(
          "Hive Database",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: ourTask.length,

        itemBuilder: (context, index) {
          var currentItem = ourTask[index];
        return Card(
          color: Colors.tealAccent,
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.teal,radius: 50, child: Text("${index +1}"),),
            title: Text(currentItem['task'], style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
            subtitle: Text(currentItem['task']),
            trailing: Text(
              DateFormat('hh:mm a \n dd-MMM-yyyy').format(DateTime.now()),
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),          ),
        );
      },),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showAddNoteSheet();
          titleC.clear();
          taskC.clear();
        } ,
        // ফাংশন কল করা হলো
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
