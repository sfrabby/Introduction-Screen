import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class MapPracController extends GetxController {
  // অবজারভেবল ভ্যারিয়েবল (ম্যাপের কেন্দ্র)
  var currentCenter = LatLng(23.8103, 90.4125).obs;
  final MapController flutterMapController = MapController();

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.always || permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(accuracy: LocationAccuracy.high),
      );

      // ভ্যালু আপডেট করা
      currentCenter.value = LatLng(position.latitude, position.longitude);

      // ম্যাপকে মুভ করানো
      flutterMapController.move(currentCenter.value, 15.0);
    }
  }
}