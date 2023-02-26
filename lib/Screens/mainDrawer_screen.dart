import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Screens/DrawerScreens/verfication_screen.dart';
import 'package:fixit/Screens/DrawerScreens/inbox_screen.dart';
import 'package:fixit/Screens/DrawerScreens/notification_screen.dart';
import 'package:fixit/Screens/DrawerScreens/Review_screen.dart';
import 'package:fixit/Screens/DrawerScreens/complain_screen.dart';
import 'package:fixit/Screens/DrawerScreens/setting_screen.dart';
import 'package:fixit/Screens/login_screen.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 160,
            width: double.infinity,
            color: Colors.indigo,
            child: Stack(
              children: [
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
                          //ToDo: Change pic
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
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Inbox_screen()));
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
                      builder: (context) => Notification_Screen()));
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
            onTap: () {},
            child: ListTile(
              leading: Icon(
                Icons.help_center,
                color: ksecondaryColor,
              ),
              title: Text(
                "Help",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Complain_screen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.comment_sharp,
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
              // ToDo: Url Launcher
            },
            child: ListTile(
              leading: Icon(
                Icons.info,
                color: ksecondaryColor,
              ),
              title: Text(
                "Info",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Setting_screen()));
            },
            child: ListTile(
              leading: Icon(
                Icons.settings,
                color: ksecondaryColor,
              ),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              //  ToDo: Url Launcher
            },
            child: ListTile(
              leading: Icon(
                Icons.question_answer,
                color: ksecondaryColor,
              ),
              title: Text(
                "Faqs",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // ToDo: Logout firebase

              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Login_screen()),
                  (route) => false);
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
            height: 50,
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
