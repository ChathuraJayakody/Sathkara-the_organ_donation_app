import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  // Markers will be controlled here
  var markers = <Marker>{}.obs;

  // This function is used to set the marker on the map
  void setMarker(LatLng position) {
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: const InfoWindow(title: "Hospital Location"),
      ),
    );
  }

  // This function is used to animate the zoom effect
  Future<void> animateCameraToLocation(
      GoogleMapController controller, LatLng target) async {
    double initialZoom = 5.0;
    double targetZoom = 15.5;

    int animationDuration = 4000;
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

  void onMapCreated(GoogleMapController controller) {
    // Initialize map controller
  }
}
