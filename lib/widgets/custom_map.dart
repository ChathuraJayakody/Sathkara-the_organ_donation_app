import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart'; // Required for GetX
import 'package:organ_donation_app/controller/map_controller.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the MapController using Get.put for dependency injection
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      body: Obx(() => SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(7.28652, 80.63142), // Center of Sri Lanka
                zoom: 5, // Start with a lower zoom level
              ),
              onMapCreated: (controller) {
                mapController.onMapCreated(controller);

                // Trigger the smooth zoom animation to Kandy Hospital
                LatLng target = const LatLng(7.28652, 80.63142);
                mapController.animateCameraToLocation(controller, target);
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
