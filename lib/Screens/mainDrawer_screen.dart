
import 'package:fixit/Screens/DrawerScreens/profile_screen.dart';
import 'package:fixit/Screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Screens/DrawerScreens/verfication_screen.dart';
import 'package:fixit/Screens/DrawerScreens/notification_screen.dart';
import 'package:fixit/Screens/DrawerScreens/Review_screen.dart';
import 'package:fixit/Screens/DrawerScreens/complain_screen.dart';
import "package:fixit/Screens/DrawerScreens/aboutus_screen.dart";
import 'package:fixit/Screens/login_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/AllWidegets/requestCheckWidget.dart';
class MainDrawer extends StatefulWidget {



  @override

  State<MainDrawer> createState() => _MainDrawerState();


}
final imageURL = '';

class _MainDrawerState extends State<MainDrawer> {
  void initState(){

    profile_screen();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.indigo,
            child: Stack(children: [
profile_screen()

            ]),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.inbox,
                color: ksecondaryColor,
              ),
              title: Text(
                "Inbox",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => notification_screen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.notifications,
                color: ksecondaryColor,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Review_screen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.reviews,
                color: ksecondaryColor,
              ),
              title: Text(
                "Reviews",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ComplaintPage()));
            },
            child: ListTile(
              leading: Icon(
                Icons.add_box_sharp,
                color: ksecondaryColor,
              ),
              title: Text(
                "Complain",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => aboutus_screen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.comment_sharp,
                color: ksecondaryColor,
              ),
              title: Text(
                "About us",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              AwesomeDialog(
                context: context,
                title: 'Logout',
                descTextStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                desc: "Are your sure you want to log out?🤔 ",
                dialogType: DialogType.warning,
                showCloseIcon: true,
                btnCancelOnPress: (){},
                btnOkText: 'Logout😏',
                btnOkOnPress: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login_screen()),
                          (route) => false);
                },
              ).show();

            },
            child: ListTile(
              leading: Icon(
                Icons.logout,
                color: ksecondaryColor,
              ),
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),

          SizedBox(
            height: 100,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => VerficationScreen()));
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                color: ksecondaryColor,
                height: 50,
                child: Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 28),
                        child: Image.asset('images/partner.png')),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        " Become a Partner",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }


}
