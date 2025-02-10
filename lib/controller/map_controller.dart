import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class MapController extends GetxController {
  var markers = <Marker>{}.obs;
  var polylines = <Polyline>{}.obs;
  LatLng? userLocation;

  // Function to get the user's current location
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      userLocation = LatLng(position.latitude, position.longitude);
      update();
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  // Function to set a marker
  void setMarker(LatLng position, String title) {
    markers.add(
      Marker(
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: InfoWindow(title: title),
      ),
    );
    update();
  }

  // Function to fetch route from OSRM API
  Future<void> getRoute(LatLng destination, GoogleMapController? mapController) async {
    if (userLocation == null) {
      print("Error: User location is null");
      return;
    }

    // Clear previous markers and polylines for a fresh start
    markers.clear();
    polylines.clear();
    update();

    // Add markers for start and destination
    setMarker(userLocation!, "Your Location");
    setMarker(destination, "Destination");

    final String url =
        "http://router.project-osrm.org/route/v1/driving/"
        "${userLocation!.longitude},${userLocation!.latitude};"
        "${destination.longitude},${destination.latitude}?overview=full&geometries=polyline";

    print("Fetching directions from OSRM API...");

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print("OSRM API Response: $data");

        if (data.containsKey('routes') && data['routes'].isNotEmpty) {
          final geometry = data['routes'][0]['geometry'];
          final List<LatLng> routePolyline = _decodePolyline(geometry);

          // Add the new route polyline
          polylines.add(
            Polyline(
              polylineId: const PolylineId("route"),
              points: routePolyline,
              color: const Color.fromARGB(255, 38, 14, 252),
              width: 5,
            ),
          );

          update();

          // Adjust camera to fit the entire route
          _adjustCameraToRoute(routePolyline, mapController);
        } else {
          print("Error: No route found in OSRM response.");
        }
      } else {
        print("Failed to load directions. Status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching directions: $e");
    }
  }

  // Function to adjust the map to show the full route
  void _adjustCameraToRoute(List<LatLng> route, GoogleMapController? mapController) {
    if (route.isEmpty || mapController == null) return;

    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(
        route.reduce((a, b) => a.latitude < b.latitude ? a : b).latitude,
        route.reduce((a, b) => a.longitude < b.longitude ? a : b).longitude,
      ),
      northeast: LatLng(
        route.reduce((a, b) => a.latitude > b.latitude ? a : b).latitude,
        route.reduce((a, b) => a.longitude > b.longitude ? a : b).longitude,
      ),
    );

    mapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
  }

  // Function to decode OSRM polyline
  List<LatLng> _decodePolyline(String polyline) {
    const factor = 1e5;
    List<LatLng> points = [];
    int index = 0;
    int len = polyline.length;
    int lat = 0;
    int lon = 0;

    while (index < len) {
      int shift = 0;
      int result = 0;
      int byte;
      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : result >> 1;
      lat += dlat;
      shift = 0;
      result = 0;

      do {
        byte = polyline.codeUnitAt(index++) - 63;
        result |= (byte & 0x1f) << shift;
        shift += 5;
      } while (byte >= 0x20);

      int dlng = (result & 1) != 0 ? ~(result >> 1) : result >> 1;
      lon += dlng;
      points.add(LatLng(lat / factor, lon / factor));
    }
    return points;
  }
}
