import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class MapPrac extends StatelessWidget {
  const MapPrac({super.key});
  getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      log("Location Not given");
      Geolocator.requestPermission();
    }
    else{
      Position currentPossition = await Geolocator.getCurrentPosition(locationSettings: LocationSettings(accuracy: LocationAccuracy.high));
      log("Latitude ${currentPossition.latitude.toString()}");
      log("Longitude ${currentPossition.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          ElevatedButton(onPressed: (){
            getCurrentLocation();
          }, child: Text("Flutter Map")),
          SizedBox(height: 30,),
          Container(
            height: 300,
            width: 300,
            child: FlutterMa,
          )
        ],
      )),
    );
  }
}
