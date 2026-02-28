import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import '../../Controller/Map Controller.dart';

class MapPracScreen extends StatelessWidget {
  MapPracScreen({super.key});

  // কন্ট্রোলার ইনজেক্ট করা
  final MapPracController controller = Get.put(MapPracController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("GetX Free Map")),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => controller.getCurrentLocation(),
            child: const Text("Get My Location"),
          ),
          Expanded(
            child: Obx(() => FlutterMap(
              mapController: controller.flutterMapController,
              options: MapOptions(
                initialCenter: controller.currentCenter.value,
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.intorduction_screen',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.currentCenter.value,
                      width: 50,
                      height: 50,
                      child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                    ),
                  ],
                ),
              ],
            )),
          ),
        ],
      ),
    );
  }
}