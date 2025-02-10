import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:organ_donation_app/controller/map_controller.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      body: GetBuilder<MapController>(
        initState: (_) async {
          await mapController.getCurrentLocation();
        },
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.userLocation ??
                  const LatLng(7.28652, 80.63142),
              zoom: 10,
            ),
            myLocationEnabled: true, // ✅ Shows the blue dot for user's location
            myLocationButtonEnabled: false, // ✅ Enables "My Location" button (optional)
            markers: controller.markers, // Keep your existing markers
            polylines: controller.polylines, // Keep existing route polylines
            onTap: (position) {
              controller.setMarker(position, "Custom Location");
              if (controller.userLocation != null) {
                controller.getRoute(position, null);
              }
            },
          );
        },
      ),
    );
  }
}
