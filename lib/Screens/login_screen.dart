import 'package:flutter/material.dart';
import 'package:fixit/main.dart';
import 'package:flutter/services.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Screens/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixit/Screens/registor_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fixit/AllWidegets/dialogboxWidget.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);
  static String id = 'Login_screen';

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  RegExp emailCheck = RegExp(r'\S+@\S+\.\S+');

  RegExp passwordCheck = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

  TextEditingController TextEditingControllerEmaill = TextEditingController();

  TextEditingController TextEditingControllerPassword = TextEditingController();

  FocusNode focus = FocusNode();

  bool email_valid(String email) {
    String _email = email.trim();
    if (emailCheck.hasMatch(_email)) {
      return true;
    } else
      return false;
  }

  bool password_valid(String password) {
    String _password = password.trim();
    if (passwordCheck.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 25,
                ),
                Hero(
                  tag: 'first',
                  child: Image.asset(
                    'images/Fix-it(logo).png',
                    height: 200,
                  ),
                ),
                Text(
                  "Home services maintenance and repair",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black54),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          _formKey.currentState?.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Enter the email address";
                          } else {
                            bool result = email_valid(value);
                            if (result == true) {
                              return null;
                            } else {
                              return "Enter the Correct Email";
                            }
                          }
                        },
                        controller: TextEditingControllerEmaill,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: kprimaryColor,
                          hintText: "Email address",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: kprimaryColor,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: kprimaryColor, width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: TextEditingControllerPassword,
                        onChanged: (value) {
                          _formKey.currentState?.validate();
                        },
                        validator: (value) {
                          print(value);
                          if (value!.isEmpty) {
                            return "Please enter password";
                          } else {
                            bool result = password_valid(value);
                            if (result) {
                              return null;
                            } else {
                              return "Password should contains Capital,Number & Special";
                            }
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          prefixIconColor: kprimaryColor,
                          hintText: "Password",
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kprimaryColor, width: 2),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32))),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: kprimaryColor, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(32),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 130),
                      backgroundColor: kprimaryColor,
                    ),
                    onPressed: () {
                      LoginWithAuth();
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Registor_screen()));
                  },
                  child: Text(
                    "Do not have an Account? Register Here.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebase = FirebaseAuth.instance;

  LoginWithAuth() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBoxWidget('Authenticating , please wait ...');
      },
    );
    User? newUser = (await _firebase
            .signInWithEmailAndPassword(
                email: TextEditingControllerEmaill.text,
                password: TextEditingControllerPassword.text)
            .catchError((error) {
      Navigator.pop(context);
      displayMessage("Error " + error.toString(), context);
    }))
        .user;
    if (newUser != null) {
      databaseReference.child(newUser.uid).once();
      displayMessage("Congratulations, You are login into Fixit", context);
      Navigator.pushNamedAndRemoveUntil(
          context, Dashboard_screen.id, (route) => false);
    } else {
      Navigator.pop(context);
      _firebase.signOut();
      displayMessage("Opss, not login  Error is $Error ", context);
    }
  }
}

displayMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
