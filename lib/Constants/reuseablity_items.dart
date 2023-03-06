import 'package:fixit/Screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
class ServicesContainer extends StatelessWidget {
  final Widget image;
  final String Textimage;
  final  currentuid =  FirebaseAuth.instance.currentUser!.uid;
  final ref =  FirebaseDatabase.instance.ref().child('uid').child('name').toString();
  ServicesContainer(this.image, this.Textimage);


 @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Dashboard(service: Textimage,serviceWidget: image,name: ref)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0.7, 0.7),
            )
          ],
        ),
        margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
        height: 132,
        width: 120,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
              child: image,
            ),
            Text(
              "$Textimage",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
