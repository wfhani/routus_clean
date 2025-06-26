import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:routus_clean/features/tracking/presentation/tracking_cubit.dart';
import 'package:routus_clean/features/tracking/presentation/tracking_state.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'delay_message.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  @override
  void initState() {
    super.initState();
    loadBusIcon();
  }

  BitmapDescriptor? busIcon;

  void loadBusIcon() async {
    busIcon = await getBusIcon();
    setState(() {});
  }

  Future<BitmapDescriptor> getBusIcon() async {
    final ByteData data = await rootBundle.load('assets/icons/bus_marker.png');
    final Uint8List bytes = data.buffer.asUint8List();
    final codec = await ui.instantiateImageCodec(bytes, targetWidth: 100);
    final frame = await codec.getNextFrame();
    final byteData =
        await frame.image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List resizedBytes = byteData!.buffer.asUint8List();
    return BitmapDescriptor.fromBytes(resizedBytes);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrackingCubit, TrackingState>(
      builder: (context, state) {
        final cubit = BlocProvider.of<TrackingCubit>(context);
        if (busIcon == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return LayoutBuilder(builder: (context, constraints) {
          return Stack(
            alignment: Alignment.center,
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(cubit.lat!, cubit.lng!),
                  zoom: 15.0,
                ),
                zoomControlsEnabled: false,
                zoomGesturesEnabled: false,
                mapType: MapType.normal,
                mapToolbarEnabled: false,
                compassEnabled: true,
                buildingsEnabled: false,
                myLocationButtonEnabled: false,
                myLocationEnabled: true,
                scrollGesturesEnabled: false,
                rotateGesturesEnabled: false,
                tiltGesturesEnabled: false,
                onMapCreated: (controller) =>
                    cubit.googleMapController = controller,
                markers: {
                  Marker(
                    markerId: const MarkerId('busIcon'),
                    position: LatLng(cubit.lat!, cubit.lng!),
                    icon: busIcon!,
                  ),
                },
                onTap: (latLng) => cubit.updateLocation(latLng),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 200),
                child: DelayMessage(),
              )
            ],
          );
        });
      },
    );
  }
}
