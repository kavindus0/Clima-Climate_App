import 'package:geolocator/geolocator.dart';

class Location {
  late double latitudeForMain;
  late double longitudeForMain;

  Future<void> getCurrentLocation() async {
    try {
      Position positionObj = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.medium);
      latitudeForMain = (positionObj.latitude);
      longitudeForMain = (positionObj.longitude);
    } catch (e) {
      print("error: Location Permission error |\n\n| $e".toUpperCase());
    }
  }
}
