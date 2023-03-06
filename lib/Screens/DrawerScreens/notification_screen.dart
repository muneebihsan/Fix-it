import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
class notification_screen extends StatelessWidget {
  const notification_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              iconSize: 30,
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Notification"),
        ),
        body: Center(
          child: Container(
            child: Image.asset('images/notification.jpg'),
          ),
        )
      ),
    );
  }
}
