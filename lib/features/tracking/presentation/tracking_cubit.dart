import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:routus_clean/core/map_service.dart';
import 'tracking_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackingCubit extends Cubit<TrackingState> {
  TrackingCubit() : super(TrackingInitState()) {
    getCurrentLocation();
  }

  GoogleMapController? googleMapController;

  double? lat, lng;
  String? nearestPlace;

  getCurrentLocation() {
    emit(TrackingLoadingState());
    MapServices.getCurrentDeviceLocation().then((latLng) async {
      lat = latLng!.latitude;
      lng = latLng.longitude;
      emit(TrackingSuccessState());
      log('kjkjkjkj lat $lat, lng $lng');
      // await _getAddressFromCoordinates(latLng);
    }).catchError((e) {
      emit(TrackingErrorState(e.toString()));
    });
  }

  Future<void> _getAddressFromCoordinates(LatLng latLng) async {
    // List<Placemark> placeMarks =
    //     await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
    // Placemark place = placeMarks[0];
    // nearestPlace =
    //     '${place.locality},${place.subAdministrativeArea}, ${place.country}';
    // emit(TrackingSuccessState());
  }

  updateLocation(LatLng latLng) {
    lat = latLng.latitude;
    lng = latLng.longitude;
    googleMapController?.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 15),
    );
    _getAddressFromCoordinates(latLng);
    emit(TrackingSuccessState());
  }
}
