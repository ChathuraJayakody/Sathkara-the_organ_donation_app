import 'dart:math';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  var markers = <Marker>[].obs;
  late GoogleMapController googleMapController;

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  /// Method to clear existing markers and add a new one at the specified position
  void setMarker(LatLng position, {String title = 'Marker'}) {
    // Clear all previous markers
    markers.clear();

    // Create a new marker
    Marker marker = Marker(
      markerId: const MarkerId('current_marker'),
      position: position,
      infoWindow: InfoWindow(
        title: title,
      ),
    );

    // Add the marker to the observable list
    markers.add(marker);

    // Animate camera to the marker's position
    animateToPosition(position);
  }

  /// Method to animate the camera to a given position
  void animateToPosition(LatLng position, {double zoom = 14.0}) {
    googleMapController.animateCamera(
      CameraUpdate.newLatLngZoom(position, zoom),
    );
  }

  /// Method to search for an address and navigate to it
  Future<void> searchAndNavigate(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng target = LatLng(location.latitude, location.longitude);

        // Use the setMarker method to update marker and animate the camera
        setMarker(target, title: 'Searched Location');
      }
    } catch (e) {
      print("Error occurred: $e");
    }
  }
}
