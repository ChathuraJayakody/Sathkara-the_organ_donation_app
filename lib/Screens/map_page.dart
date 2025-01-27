import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:organ_donation_app/controller/map_controller.dart';
import 'package:get/get.dart';

class MapPage extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String hospitalName;

  const MapPage({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.hospitalName,
  });

  @override
  Widget build(BuildContext context) {
    // Use MapController to manage map and zoom
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(
        title: Text('$hospitalName Location',
        style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 10.0, // Initial zoom level
        ),
        onMapCreated: (controller) {
          // Trigger the zoom animation on map creation
          mapController.animateCameraToLocation(controller, LatLng(latitude, longitude));
        },
        markers: {
          Marker(
            markerId: MarkerId(hospitalName),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: hospitalName),
          ),
        },
      ),
    );
  }
}
