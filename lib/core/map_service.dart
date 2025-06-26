import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapServices {
  static LatLng? selectedCurrentLocation;
  static bool manuallyLocationDialogShown = false;
  static LatLng? currentLocation;

  static Future<LatLng?> getCurrentDeviceLocation() async {
    bool accepted = false;
    while (!accepted) {
      await Geolocator.requestPermission();
      final permissionStatus = await Geolocator.checkPermission();
      final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
      if (permissionStatus == LocationPermission.always ||
          permissionStatus == LocationPermission.whileInUse) {
        accepted = true;
      } else if (permissionStatus == LocationPermission.denied) {
        await Geolocator.requestPermission();
      } else if (selectedCurrentLocation != null) {
        return selectedCurrentLocation;
      } else if (isLocationEnabled ||
          permissionStatus == LocationPermission.deniedForever) {
      }
    }
    Position position = await Geolocator.getCurrentPosition();
    currentLocation = LatLng(position.latitude, position.longitude);
    return LatLng(position.latitude, position.longitude);
  }
}
