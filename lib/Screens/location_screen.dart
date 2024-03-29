
import 'package:fixit/Screens/login_screen.dart';
import 'package:fixit/main.dart';
import 'dart:async';
import 'package:fixit/Networking/networking.dart';
import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:fixit/AllWidegets/divider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/AllWidegets/requestCheckWidget.dart';
class Dashboard extends StatefulWidget {
  static String id = "locationScreen";
  final String service;
  final Widget serviceWidget;
  final String name;

  Dashboard(
      {required this.service, required this.serviceWidget, required this.name});

  @override
  State<Dashboard> createState() => _DashboardState();
}



class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  void initState() {
    super.initState();
    location(context).getCurrentLocation();
    userCurrentLocation().CurrentLocation();
    setState(() {
      task=false;
    });
  }

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late GoogleMapController newGoogleMapController;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  bool request = false;


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ksecondaryColor,
            leading: IconButton(
                iconSize: 30,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                )),
            centerTitle: true,
            title: Text(
              'Search Fixers',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controllerGoogleMap.complete(controller);
                  newGoogleMapController = controller;
                  userLocation();
                },
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: klocationHeightContainer,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(22),
                          topRight: Radius.circular(22)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black45,
                            blurRadius: 16.0,
                            spreadRadius: 4,
                            offset: Offset(0.7, 0.7)),
                      ]),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 230),
                            child: Text(
                              'Hi,there',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 225),
                            child: Text(
                              "Where to fix?",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: Colors.grey,
                                  size: 35,
                                ),
                                SizedBox(
                                  width: 12.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Home',
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3.0,
                                    ),
                                    Text(
                                      'Your living home address',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: DividerWidget(),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            height: 50,
                            width: 300,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              onPressed: () {
                                serviceRequest();
                                displayContainer();
                                setState(() {
                                  task=true;
                                });
                                /*Timer(Duration(seconds: 10), () async {
                                  if(request =false)
                                  {
                                  displayContainer();
                                  AwesomeDialog(
                                  context: context,
                                  title: 'Opss',
                                  desc: " No fixer is available right now",
                                  dialogType: DialogType.error,
                                  btnOkColor: Colors.red,
                                  btnOkText: 'Okay 🙄 ',
                                  btnOkOnPress: () {

                                  handymanRequest
                                      .child(requestid.toString())
                                      .remove();
                                  },
                                  ).show();
                                  }
                                });*/
                              },
                              child: Text(
                                'Create Task!',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Container(
                  height: krequestHeightContainer,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black45,
                          blurRadius: 16.0,
                          spreadRadius: 4,
                          offset: Offset(0.7, 0.7)),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ColorizeAnimatedText(
                                'Requesting a handyman... ',
                                textStyle: kcolorizeTextStyle,
                                textAlign: TextAlign.center,
                                colors: kcolorizeColors,
                              ),
                              ColorizeAnimatedText(
                                'Please wait . . . ',
                                textStyle: kcolorizeTextStyle,
                                colors: kcolorizeColors,
                                textAlign: TextAlign.center,
                              ),
                              ColorizeAnimatedText(
                                'Finding a handyman...',
                                textStyle: kcolorizeTextStyle,
                                colors: kcolorizeColors,
                                textAlign: TextAlign.center,
                              ),
                            ],
                            isRepeatingAnimation: true,
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                    color: ksecondaryColor, width: 2.0)),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  task=false;
                                });
                                handymanRequest
                                    .child(uid)
                                    .remove();
                                displayMessage(
                                    'Cancling your request...', context);
                                displayContainer();
                              },
                              child: Icon(
                                Icons.close,
                                color: Colors.grey,
                                size: 33,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text(
                            "Cancel a service ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 240,
                right: 20,
                left: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 125.0),
                  child: Container(
                    height: kserviceHeightContainer,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        widget.serviceWidget,
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${widget.service}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              task ? RequestCheckWidget(): Container(),
            ],
          ),
        ),
      ),
    );
  }

  void userLocation() async {
    LatLng currentUserPosition = await userCurrentLocation().CurrentLocation();
    CameraPosition newCameraPosition =
    CameraPosition(target: currentUserPosition, zoom: 0);
    newGoogleMapController
        .animateCamera(CameraUpdate.newCameraPosition(newCameraPosition));
    Position position = await userCurrentLocation().CurrentLocation();
  }

  displayContainer() {
    setState(() {
      if (klocationHeightContainer == 300) {
        klocationHeightContainer = 0;
        kserviceHeightContainer = 0;
        krequestHeightContainer = 280;
      } else if (krequestHeightContainer == 280) {
        klocationHeightContainer = 300;
        kserviceHeightContainer = 120;
        krequestHeightContainer = 0;
      }
    });
  }

  serviceRequest() async {
    handymanRequest
        .child(
      FirebaseAuth.instance.currentUser!.uid,
    )
        .set({
      "request": false,
      "id": FirebaseAuth.instance.currentUser!.uid,
      "name": FirebaseAuth.instance.currentUser!.email,
      'service': widget.service,
      'location': await userCurrentLocation().CurrentLocation(),
      'time':DateTime.now().hour.toString()+':'+DateTime.now().minute.toString(),
    }).then((value) {
      displayMessage('Your request has been sending...', context);
    }).onError((error, stackTrace) {
      displayMessage('Some error occur', context);
    });
  }
}
/*
Timer(Duration(seconds: 10), () async {

                                 print("this is check bro $checkrequest ");
                                  if (checkrequest == true) {
                                    displayContainer();
                                    AwesomeDialog(
                                      context: context,
                                      title: 'Congratulataion',
                                      desc: "Fixer accpet your request ",
                                      dialogType: DialogType.success,
                                      btnOkText: 'Okay 😍 ',
                                      btnOkOnPress: () {},
                                    ).show();
                                  } else  if (checkrequest ==false){
                                    displayContainer();
                                    AwesomeDialog(
                                      context: context,
                                      title: 'Opss',
                                      desc: " No fixer is available right now",
                                      dialogType: DialogType.error,
                                      btnOkColor: Colors.red,
                                      btnOkText: 'Okay 🙄 ',
                                      btnOkOnPress: () {
                                        handymanRequest
                                            .child(requestid.toString())
                                            .remove();
                                      },
                                    ).show();
                                  }
                                });



                                Timer(Duration(seconds: 10), () async {
                                  bool checkrequest = true;
                                  print("this is check bro $checkrequest ");
                                  if (checkrequest == true) {
                                    displayContainer();
                                    AwesomeDialog(
                                      context: context,
                                      title: 'Congratulataion',
                                      desc: "Fixer accpet your request ",
                                      dialogType: DialogType.success,
                                      btnOkText: 'Okay 😍 ',
                                      btnOkOnPress: () {},
                                    ).show();
                                  } else  if (checkrequest ==false){
                                    displayContainer();
                                    AwesomeDialog(
                                      context: context,
                                      title: 'Opss',
                                      desc: " No fixer is available right now",
                                      dialogType: DialogType.error,
                                      btnOkColor: Colors.red,
                                      btnOkText: 'Okay 🙄 ',
                                      btnOkOnPress: () {
                                        handymanRequest
                                            .child(requestid.toString())
                                            .remove();
                                      },
                                    ).show();
                                  }
                                });
*/
