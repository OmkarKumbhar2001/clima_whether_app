import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      print(permission);
      if (permission == LocationPermission.deniedForever) {
        print("Location permissions are permanently denied.");
        return;
      } else if (permission == LocationPermission.denied) {
        print("Location permissions are denied.");
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude;
      longitude = position.longitude;
      print("Latitude: $latitude, Longitude: $longitude");
    } catch (e) {
      print(e);
      print("Failed to get location or permission denied");
    }
  }
}

void main() async {
  Location location = Location();
  await location.getCurrentLocation();
}
