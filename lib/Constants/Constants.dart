import 'package:flutter/material.dart';
String kmapKey = 'AIzaSyBX8ZlixaYqU6EemGpcF4AZnSuuTTMi-WA';
const Color kprimaryColor = Colors.indigo;
const Color ksecondaryColor = Colors.indigoAccent;

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);
 double klocationHeightContainer = 300;
 double krequestHeightContainer = 0;
 double kserviceHeightContainer = 120;

final kcolorizeColors = [
  kprimaryColor,
  Colors.red,
  Colors.yellow,
  ksecondaryColor,
];

const kcolorizeTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Horizon',
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kSearchDecoration = InputDecoration(

enabledBorder: OutlineInputBorder(
borderSide: BorderSide(
color: kprimaryColor,
width: 2,
),
borderRadius: BorderRadius.all(
Radius.circular(10.0),
),
),
focusedBorder: OutlineInputBorder(
borderSide:
BorderSide(color: kprimaryColor, width: 2.0),
borderRadius: BorderRadius.all(
Radius.circular(32.0),
),
),
hintText: 'Search for services',
prefixIcon: Icon(
Icons.search,
color: kprimaryColor,
),

);