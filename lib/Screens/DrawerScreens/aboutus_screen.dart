import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';

class aboutus_screen extends StatelessWidget {
  const aboutus_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: ksecondaryColor,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                iconSize: 30,
                icon: Icon(Icons.arrow_back)),
            centerTitle: true,
            title: Text("About us"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Image.asset('images/Fix-it(logo).png'),
              Text("Home service maintenance and repair ",style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(
                height: 5,
              ),
              Text("Version 1.002",style: TextStyle(
                color: Colors.grey,

              ),),
            ],
          )),
    );
  }
}
