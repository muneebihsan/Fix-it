import 'package:fixit/Provider/AppData.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class location {
  final BuildContext context;


  location( this.context);
  void getCurrentLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    if (isLocationServiceEnabled == true &&
        permission == LocationPermission.always)
      userCurrentLocation().CurrentLocation();
    else if (isLocationServiceEnabled == false)
      AwesomeDialog(

        context:context,
        title: 'Location service ',
        desc: "Please turn on location for better experience ",
        dialogType: DialogType.info,
        btnOkText: 'Turn on the location ',
        btnOkOnPress: () async{
            OpenlocationSetting();
        },
      ).show();
    else if (permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine ||
        permission == LocationPermission.deniedForever)
      AwesomeDialog(

        context:context,
        title: 'Permission',
        desc: "Please grant location service permission   ",
        dialogType: DialogType.warning,
        btnOkText: 'Click here to open the Setting ',
        btnOkOnPress: () async{
          OpenSetting();
        },
      ).show();
  }

  void OpenSetting() async {
        await Geolocator.openAppSettings();

  }

  void OpenlocationSetting() async {

        await Geolocator.openLocationSettings();



  }
}
class userCurrentLocation{
  late double latitude;
  late double longitude;
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
}
/*
class dialogbox extends StatefulWidget {
  const dialogbox({Key? key}) : super(key: key);

  @override
  State<dialogbox> createState() => _dialogboxState();
}

class _dialogboxState extends State<dialogbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        AwesomeDialog(
          context:,
          title: 'Confirmation',
          desc: "Are you sure?😉 ",
          dialogType: DialogType.question,
          btnOkText: 'Create it 😍 ',
          btnOkOnPress: () async{
            await Geolocator.openAppSettings();
          },
        ).show();
      },
    );
  }
}
context:context,
        title: 'Permission',
        desc: "Please grant location service permission   ",
        dialogType: DialogType.warning,
        btnOkText: 'Click here to open the Setting ',
*/
