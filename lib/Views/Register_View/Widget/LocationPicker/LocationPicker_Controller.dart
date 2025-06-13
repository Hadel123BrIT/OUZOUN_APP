import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geocoding/geocoding.dart' as google_geocoding;

class LocationPickerController extends GetxController {
  late GoogleMapController mapController;
  var selectedLocation = Rxn<LatLng>();
  var locationName = 'Tap your location'.obs;
  String placeM = "";
  bool useOSM = true; // قيمة افتراضية

  Future<void> onMapTapped(LatLng latLng) async {
    selectedLocation.value = latLng;
    await _getLocationName(latLng);
  }

  Future<void> _getLocationName(LatLng latLng) async {
    try {
      if (useOSM) {
        await _getOSMLocationName(latLng);
      } else {
        await _getGoogleLocationName(latLng);
      }
    } catch (e) {
      locationName.value = '${latLng.latitude.toStringAsFixed(4)}, ${latLng.longitude.toStringAsFixed(4)}';
      debugPrint('Geocoding error: $e');
    }
  }

  Future<void> _getOSMLocationName(LatLng latLng) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://nominatim.openstreetmap.org/reverse?format=json&lat=${latLng.latitude}&lon=${latLng.longitude}&accept-language=${Get.locale?.languageCode ?? 'en'}'
        ),
        headers: {'User-Agent': 'OuzounApp/1.0 (com.ouzoun.app)'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final address = data['display_name'] ?? 'Location: ${latLng.latitude.toStringAsFixed(4)}, ${latLng.longitude.toStringAsFixed(4)}';
        _updateLocationInfo(address);
      } else {
        throw Exception('API request failed: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('OSM Geocoding error: $e');
      _updateLocationInfo('Location: ${latLng.latitude.toStringAsFixed(4)}, ${latLng.longitude.toStringAsFixed(4)}');
    }
  }

  Future<void> _getGoogleLocationName(LatLng latLng) async {
    final placemarks = await google_geocoding.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    if (placemarks.isNotEmpty) {
      final place = placemarks.first;
      final address = '${place.country},${place.street}, ${place.locality}';
      _updateLocationInfo(address);
    } else {
      throw Exception('No address found');
    }
  }

  void _updateLocationInfo(String address) {
    placeM = address;
    locationName.value = address;
  }
}