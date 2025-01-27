import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart'; // Required for GetX
import 'package:organ_donation_app/controller/map_controller.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  Future<void> zoomToPosition(GoogleMapController controller, LatLng target) async {
    // Define initial zoom level
    double initialZoom = 5.0;

    // Define the final zoom level
    double targetZoom = 17.0;

    // Define the duration for the animation
    int animationDuration = 4000; // in milliseconds

    // Define steps for the zoom increment
    int steps = 25;
    double zoomStep = (targetZoom - initialZoom) / steps;

    // Move camera to the target position
    controller.animateCamera(CameraUpdate.newLatLng(target));

    // Incrementally increase the zoom level
    for (int i = 0; i <= steps; i++) {
      double currentZoom = initialZoom + (zoomStep * i);
      await Future.delayed(Duration(milliseconds: animationDuration ~/ steps));
      controller.animateCamera(CameraUpdate.newLatLngZoom(target, currentZoom));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize the MapController using Get.put for dependency injection
    final MapController mapController = Get.put(MapController());

    return Scaffold(
    
      body: Obx(() => Container(
            width: double.infinity,
            height: 500,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(7.28652, 80.63142), // Center of Sri Lanka
                zoom: 5, // Start with a lower zoom level
              ),
              onMapCreated: (controller) {
                mapController.onMapCreated(controller);

                // Trigger the smooth zoom animation to Kandy Hospital
                LatLng target = const LatLng(7.28652, 80.63142);
                zoomToPosition(controller, target);
              },
              markers: mapController.markers.toSet(),
              onTap: (position) {
                mapController.setMarker(position); // Use the updated setMarker method
              },
            ),
          )),
    );
  }
}
