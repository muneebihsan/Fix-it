import 'package:fixit/Screens/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/main.dart';
import 'package:fixit/Constants/Constants.dart';

class RequestCheckWidget extends StatefulWidget {
  const RequestCheckWidget({Key? key}) : super(key: key);

  @override
  State<RequestCheckWidget> createState() => _RequestCheckWidgetState();
}

String uid = auth.currentUser!.uid;

class _RequestCheckWidgetState extends State<RequestCheckWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: handymanRequest
            .child(FirebaseAuth.instance.currentUser!.uid.toString())
            .onValue,
        builder: (context, AsyncSnapshot snapshot) {
          print('thisssssssssss is builderrrrrrrrrrrr');
          if (!snapshot.hasData) {
            print('thissssssssss waitng');
            return Container();
          }
          else if (!snapshot.hasData == null) {
            task=false;
            return Container();
          } else if (snapshot.hasData) {
            Map<dynamic, dynamic>? map = snapshot.data.snapshot.value;
            if (map!['request'] == true) {

              print('thissssssssss accccccccept');
              return Dialog(
                child: Container(
                  height: 200,
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //    mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 60,
                              ),
                              Text(
                                "Congratulation",
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Fixer accpet your request",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -50,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/tick.jpg'),
                          radius: 50,
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () {
                              displayContainer();
                              setState(() {
                                task=false;
                              });
                              handymanRequest.child(uid).remove();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Dashboard_screen()));
                            },
                            child: Text('okay😍')),
                      )
                    ],
                  ),
                ),
              );
            }
            if (map['request'] == false) {
              print("no fail");
              Center(
                child: Container(
                  width: 120,
                  height: 80,
                  child: Text("nooooooooooooooooooo fail"),
                ),
              );
            }
          }

            return Container();

        });
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
}
