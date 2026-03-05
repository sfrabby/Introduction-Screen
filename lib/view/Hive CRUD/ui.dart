import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';

class HiveNoteApp extends StatefulWidget {
  const HiveNoteApp({super.key});

  @override
  State<HiveNoteApp> createState() => _HiveNoteAppState();
}

class _HiveNoteAppState extends State<HiveNoteApp> {
  TextEditingController titleC = TextEditingController();
  TextEditingController taskC = TextEditingController();

  var taskbox = Hive.box("task");
  List<Map<String, dynamic>> ourTask = [];

  // ১. ডাটা তৈরি (Create)
  createdData(Map<String, dynamic> data) async {
    data['time'] = DateTime.now().toString(); // সময় সেভ করছি
    await taskbox.add(data);
    readData();
  }

  // ২. ডাটা পড়া (Read)
  readData() async {
    var data = taskbox.keys.map((key) {
      final item = taskbox.get(key);
      return {
        'keys': key, // Hive এর নিজস্ব ইউনিক কি
        'title': item['title'],
        'task': item['task'],
        'time': item['time'] ?? DateTime.now().toString(),
      };
    }).toList();

    setState(() {
      ourTask = data.reversed.toList(); // নতুন নোট উপরে দেখাবে
    });
  }

  // ৩. ডাটা আপডেট (Update)
  updateData(int key, Map<String, dynamic> data) async {
    data['time'] = DateTime.now().toString(); // আপডেটের সময়ও আপডেট হবে
    await taskbox.put(key, data);
    readData();
  }

  // ৪. ডাটা ডিলিট (Delete)
  deleteData(int key) async {
    await taskbox.delete(key);
    readData();
    Get.snackbar("Deleted", "Note removed successfully", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void initState() {
    super.initState();
    readData();
  }

  // বটম শিট ফাংশন (Add/Update উভয়ের জন্য)
  void showAddNoteSheet({int? key}) {
    if (key != null) {
      // এডিট মোড: আগের ডাটা খুঁজে বের করা
      final item = ourTask.firstWhere((element) => element['keys'] == key);
      titleC.text = item['title'];
      taskC.text = item['task'];
    } else {
      // অ্যাড মোড: ইনপুট বক্স খালি করা
      titleC.clear();
      taskC.clear();
    }

    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(key == null ? "Add New Note" : "Update Note", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              TextField(controller: titleC, decoration: const InputDecoration(labelText: "Title", border: OutlineInputBorder())),
              const SizedBox(height: 15),
              TextField(controller: taskC, maxLines: 3, decoration: const InputDecoration(labelText: "Task", border: OutlineInputBorder())),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    var data = {'title': titleC.text, 'task': taskC.text};
                    if (key == null) {
                      createdData(data);
                    } else {
                      updateData(key, data);
                    }
                    Get.back();
                    Get.snackbar("Success", key == null ? "Note added" : "Note updated", snackPosition: SnackPosition.BOTTOM);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                  child: Text(key == null ? "Add Note" : "Update Note", style: const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, backgroundColor: Colors.teal, title: const Text("Hive Database", style: TextStyle(color: Colors.white))),
      body: ListView.builder(
        itemCount: ourTask.length,
        itemBuilder: (context, index) {
          var currentItem = ourTask[index];
          return Card(
            margin: const EdgeInsets.all(8),
            color: Colors.tealAccent.shade100,
            child: ListTile(
              title: Text(currentItem['title'] ?? '', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(currentItem['task'] ?? ''),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () => showAddNoteSheet(key: currentItem['keys']), icon: const Icon(Icons.edit, color: Colors.blue)),
                  IconButton(onPressed: () => deleteData(currentItem['keys']), icon: const Icon(Icons.delete, color: Colors.red)),
                  Text(
                    DateFormat('hh:mm a\ndd MMM').format(DateTime.parse(currentItem['time'])),
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showAddNoteSheet(),
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}