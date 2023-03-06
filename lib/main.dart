import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fixit/Screens/welcome_screen.dart';
import 'package:fixit/Screens/registor_screen.dart';
import 'package:fixit/Screens/login_screen.dart';
import 'package:fixit/Screens/dashboard_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
/* import 'package:animated_splash_screen/animated_splash_screen.dart';*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

bool loading = false;
DatabaseReference handymanRequest = FirebaseDatabase.instance.ref('Request');
DatabaseReference databaseReference =
    FirebaseDatabase.instance.ref().child('user');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomAnimation(),
      routes: {
        Welcome_screen.id: (context) => Welcome_screen(),
        Registor_screen.id: (context) => Registor_screen(),
        Login_screen.id: (context) => Login_screen(),
        Dashboard_screen.id: (context) => Dashboard_screen(),
      },
    );
  }


}

/*class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splashIconSize: 150,
        splash: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                'images/Fix-it(logo).png',
              ),
            ),
            Text(
              'Home services maintenance and repair',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
            ),
          ],
        ),
        nextScreen: Welcome_screen());
  }
}
{
  "rules": {
    ".read": "now < 1674586800000",  // 2023-1-25
    ".write": "now < 1674586800000",  // 2023-1-25
  }
}
*/

class CustomAnimation extends StatefulWidget {
  const CustomAnimation({Key? key}) : super(key: key);

  @override
  State<CustomAnimation> createState() => _CustomeAnimationState();
}

class _CustomeAnimationState extends State<CustomAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation animationColor;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(
        parent: controller, curve: Curves.fastLinearToSlowEaseIn);
    animationColor =
        ColorTween(begin: Colors.indigo, end: Colors.white).animate(controller);
    controller.forward();
    controller.addStatusListener((status) {});
    controller.addListener(() {
      setState(() {
        print(controller.value);
      });
    });

  Login(context);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationColor.value,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              'images/Fix-it(logo).png',
              height: animation.value * 150,
              opacity: controller,
            ),
          ),
          Center(
            child: Text(
              'Home services maintenance and repair',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontSize: controller.value * 15),
            ),
          ),
        ],
      ),
    );

  }
  Login(BuildContext context) {
    final auth = FirebaseAuth.instance.currentUser;
    if (auth != null) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
            context, Dashboard_screen.id, (route) => false);

      });
    } else
      Timer(Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
            context, Welcome_screen.id, (route) => false);

      });
  }

}
