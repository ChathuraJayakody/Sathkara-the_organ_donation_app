import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:organ_donation_app/controller/map_controller.dart';

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
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$hospitalName Location',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GetBuilder<MapController>(
        initState: (_) async {
          await mapController.getCurrentLocation();
        },
        builder: (controller) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: controller.userLocation ??
                  LatLng(latitude, longitude), 
              zoom: 10.0,
            ),
            myLocationEnabled: true, 
            myLocationButtonEnabled: false, 
            markers: controller.markers, 
            polylines: controller.polylines, 
            onMapCreated: (GoogleMapController googleMapController) {
                controller.markers.clear(); 
                controller.polylines.clear(); 
                controller.update(); 

                controller.setMarker(LatLng(latitude, longitude), hospitalName);

                if (controller.userLocation != null) {
                  controller.getRoute(LatLng(latitude, longitude), googleMapController);
                }
              },

          );
        },
      ),
    );
  }
}
