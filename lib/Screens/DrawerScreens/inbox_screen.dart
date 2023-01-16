import "package:flutter/material.dart";
import 'package:fixit/Constants/Constants.dart';
import'package:fixit/Constants/reuseablity_items.dart';
class Inbox_screen extends StatelessWidget {
  const Inbox_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              iconSize: 30,
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Chat"),
        ),
        body:PhysicalModel(
          color: Colors.black12,
          elevation: 3,
          shadowColor: Colors.grey,
          borderRadius: BorderRadius.circular(20),
          child: SizedBox.square(dimension: 150,
          child: Column(
              children: <Widget>[
              Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 20),
          child: Image.asset('images/plumber.png'),
        ),
        Text(
          "muneeb",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
        ],
      ),
            ),
          
        ),
      ),
    );
  }
}
