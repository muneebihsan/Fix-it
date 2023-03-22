
import 'package:flutter/material.dart';
import 'package:fixit/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/Models/pickImage.dart';

class profile_screen extends StatefulWidget {
  @override
  State<profile_screen> createState() => _profile_screenState();
}
class _profile_screenState extends State<profile_screen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: databaseReference
            .child(FirebaseAuth.instance.currentUser!.uid.toString())
            .onValue,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData)
            return Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Profile_pic.jpg'),
                        radius: 50,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ],
                ),
              ],
            );
          else if (snapshot.hasData) {
            Map<dynamic, dynamic> map = snapshot.data.snapshot.value;
            return Stack(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 8, 0, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/Profile_pic.jpg'),
                        radius: 55,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        map['name'],
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        map['email'],
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ]),
                  ],
                ),
                Positioned(
                  left: 80,
                  bottom: 18,
                  //top: 40,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey),
                    child: IconButton(
                        onPressed: () {
                          pickuploadingImage();
                        },
                        icon: Icon(
                          Icons.linked_camera_outlined,
                          color: Colors.white,
                          size: 28,
                        )),
                  ),
                ),
              ],
            );
          } else
            return Text('Something went wrong');
        });
  }
}
/*
Positioned(
left: 12,
top: 22,
child: CircleAvatar(
backgroundImage: AssetImage('images/Profile_pic.jpeg'),
radius: 55,
),
),
Positioned(
left: 80,
bottom: 18,
child: Container(
decoration: BoxDecoration(
shape: BoxShape.circle, color: Colors.grey),
child: IconButton(
onPressed: () {
pickupLoadingImage();
},
icon: Icon(
Icons.linked_camera_outlined,
color: Colors.white,
size: 28,
)),
),
),
Positioned(
top: 48,
right: 60,
// ToDo: firebse dynamic name
child: Text(
'Muneeb Ihsan',
style: TextStyle(
color: Colors.white70,
fontSize: 18,
),
),
),
Positioned(
top: 72,
right: 10,
left: 125,
child: Text(
// ToDo: firebse dynamic email
'Muneebihsan@gmail.com',
style: TextStyle(
color: Colors.white70,
fontSize: 13,
fontWeight: FontWeight.w400),
),
),
],
);*/
