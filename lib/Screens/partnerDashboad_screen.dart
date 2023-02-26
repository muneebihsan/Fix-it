import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Constants/reuseablity_items.dart';
class PartnerDashboard extends StatefulWidget {
  final String category;
PartnerDashboard(this.category);
  @override
  State<PartnerDashboard> createState() => _PartnerDashboardState();
}

class _PartnerDashboardState extends State<PartnerDashboard> {
  bool activeValue = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(Icons.menu)),
          centerTitle: true,
          title: Text("Partner"),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/Partner_background.jpeg'))),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 61),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/Profile_pic.jpeg'),
                  radius: 76,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Text(
                "Muneeb Ihsan",
                style: TextStyle(color: Colors.white, fontSize: 26),
              )),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                "Muneebihsan@gmail.com",
                style: TextStyle(
                    color: kprimaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Active",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    buildSwitch(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                    Text(
                      "${widget.category}",
                      style: TextStyle(color: Colors.white, fontSize: 23),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

              GestureDetector(
                child: Container(
                decoration: BoxDecoration(
                color: Colors.white30,
                  borderRadius: BorderRadius.circular(12),

                ),
                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                height: 132,
                width: 120,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                      child: Image.asset('images/partnermessage.png'),
                    ),
                    Text(
                      "Message",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              ),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(12),

                      ),
                      margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                      height: 132,
                      width: 120,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 25, 0, 20),
                            child: Image.asset('images/requestservice.png'),
                          ),
                          Text(
                            "Request",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSwitch() => Transform.scale(
        scale: 1.5,
        child: Switch.adaptive(
            splashRadius: 80,
            activeColor: Colors.green,
            value: activeValue,
            onChanged: (value) => setState(() {
                  this.activeValue = value;
                })),
      );
}
