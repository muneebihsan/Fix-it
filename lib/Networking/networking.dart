import 'package:fixit/Screens/location_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geocoding/geocoding.dart';
class location {
  late double latitude;
  late double longitude;

  void getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (isLocationServiceEnabled == true &&
        permission == LocationPermission.always)
      CurrentLocation();
    else if (isLocationServiceEnabled == false)
      OpenlocationSetting();
    else if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.deniedForever) OpenSetting();
  }

  Future CurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
    String convertPosition = '';
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    convertPosition = 'location ' +
        placemarks.reversed.last.locality.toString() +
        ' ' +
        placemarks.reversed.last.subThoroughfare.toString() +
        ' ' +
        placemarks.reversed.last.subAdministrativeArea.toString() +
        ' ' +
        placemarks.reversed.last.isoCountryCode.toString();
print(convertPosition);
    return convertPosition;
  }

  void OpenSetting() async {
    await Geolocator.openAppSettings();
  }

  void OpenlocationSetting() async {
    await Geolocator.openLocationSettings();
  }
}
