import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:organ_donation_app/controller/map_controller.dart';
import 'package:get/get.dart';
import 'package:organ_donation_app/theme/ThemeProvider.dart';
import 'package:provider/provider.dart';

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
    final themeProvider = Provider.of<Themeprovider>(context);
    final bool isDarkMode = themeProvider.isDarkMode;
    // Use MapController to manage map and zoom
    final MapController mapController = Get.put(MapController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$hospitalName Location',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: isDarkMode ? Colors.black : const Color.fromRGBO(1, 31, 75, 1),
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
