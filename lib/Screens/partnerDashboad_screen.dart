import 'package:fixit/Screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Screens/Requestservices_screen.dart';
import 'package:fixit/Screens/chat_screen.dart';
import 'package:fixit/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard_screen()), (route) => false);
              },
              iconSize: 30,
              icon: Icon(Icons.logout)),
          centerTitle: true,
          title: Text("Partner"),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/Partner_background.jpeg'))),
            child: StreamBuilder<Object>(
              stream: databaseReference
                  .child(FirebaseAuth.instance.currentUser!.uid.toString())
                  .onValue,
              builder: (context,AsyncSnapshot snapshot) {
                if(!snapshot.hasData)
                  {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 61),
                          child: CircleAvatar(
                            backgroundImage:NetworkImage('https://thumbs.dreamstime.com/b/man-profile-cartoon-smiling-round-icon-vector-illustration-graphic-design-135443422.jpg'),
                            radius: 68,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: Text(
                              " ",
                              style: TextStyle(color: Colors.white, fontSize: 26),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                              " ",
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
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                              },
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
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => request_screen()));
                              },
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
                    );
                  }
                else if(snapshot.hasData)

                  {
                    Map<dynamic,dynamic> map = snapshot.data.snapshot.value;
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 61),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('images/Profile_pic2.jpg'),
                            radius: 78,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: Text(
                              map['name'],
                              style: TextStyle(color: Colors.white, fontSize: 26),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: Text(
                              map['email'],
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
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                              },
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
                              onTap: (){
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => request_screen()));
                              },
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
                    );
                  }
                else

                    return Center(child: Text('Something Wrong '));


              }
            ),
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
