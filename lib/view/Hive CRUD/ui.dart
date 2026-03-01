import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HiveNoteApp extends StatelessWidget {
  const HiveNoteApp({super.key});

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
                    // এখানে নোট সেভ করার লজিক হবে
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
      body: const Center(
        child: Text("Click the + button to add a note"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddNoteSheet, // ফাংশন কল করা হলো
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}