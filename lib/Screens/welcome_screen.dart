import 'package:fixit/Screens/login_screen.dart';
import 'package:fixit/Screens/registor_screen.dart';
import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';

class Welcome_screen extends StatefulWidget {
  const Welcome_screen({Key? key}) : super(key: key);
  static String id = "Welcome_screen";

  @override
  State<Welcome_screen> createState() => _Welcome_screenState();
}

class _Welcome_screenState extends State<Welcome_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'first',
              child: Image.asset(
                'images/Fix-it(logo).png',
                height: 120,
              ),
            ),
            const Center(
              child: Text(
                "Home services maintenance and repair",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black54),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              backgroundcolor: ksecondaryColor,
              textcolor: Colors.white,
              title: "Login here",
              onPressed: () {
                Navigator.pushNamed(context, Login_screen.id);
              },
            ),
            RoundedButton(
              backgroundcolor: kprimaryColor,
              title: "Registor here",
              textcolor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, Registor_screen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  @override
  final Color? backgroundcolor;
  final String? title;
  final VoidCallback? onPressed;
  final Color? textcolor;

  RoundedButton(
      {this.textcolor,
      @required this.onPressed,
      this.backgroundcolor,
      this.title});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Material(
        elevation: 5.0,
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(30),
        child: MaterialButton(
          textColor: textcolor,
          onPressed: onPressed,
          child: Text("$title"),
        ),
      ),
    );
  }
}

// Text("Registor Here"),
// Colors.white
