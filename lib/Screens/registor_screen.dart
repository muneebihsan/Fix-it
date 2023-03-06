import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fixit/AllWidegets/dialogboxWidget.dart';
import 'package:fixit/Screens/login_screen.dart';
import 'package:fixit/main.dart';
class Registor_screen extends StatefulWidget {
  const Registor_screen({Key? key}) : super(key: key);
  static String id = "Registor_screen";

  @override
  State<Registor_screen> createState() => _Registor_screenState();
}

class _Registor_screenState extends State<Registor_screen> {
  final _formKey = GlobalKey<FormState>();
  RegExp emailCheck = RegExp(r'\S+@\S+\.\S+');
  RegExp passwordCheck = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  TextEditingController TextEditingControllerEmaill = TextEditingController();
  TextEditingController TextEditingControllerPassword = TextEditingController();
  TextEditingController TextEditingControllerName = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        controller: TextEditingControllerName,
                        onChanged: (value) {
                          _formKey.currentState?.validate();
                          },
                        decoration: const InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kprimaryColor)),
                          hintText: 'What people call you',
                          labelText: 'Name*',
                          labelStyle: TextStyle(color: ksecondaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: TextEditingControllerEmaill,
                        onChanged: (value) {
                          _formKey.currentState?.validate();
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Enter the email address";
                          } else {
                            bool result = email_valid(value);
                            if (result == true) {
                              password_valid(value);
                            } else {
                              return "Enter the Correct Email";
                            }
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter the Email address',
                          labelText: 'Email address*',
                          labelStyle: TextStyle(color: Colors.indigo),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: TextEditingControllerPassword,
                        onChanged: (value) {
                          _formKey.currentState?.validate();
                        },
                        validator: (value) {
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
                        decoration: const InputDecoration(
                          hintText: 'Enter the Password',
                          labelText: 'Password*',
                          labelStyle: TextStyle(color: Colors.indigo),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.indigo)),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(180, 20, 0, 0),
                  child: Material(
                    elevation: 5,
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(15),
                    child: MaterialButton(
                      onPressed: () {
                        if (TextEditingControllerName.text.length < 4) {
                          displayMessage(
                              "Name must be at least 4 Character", context);
                        } else if (TextEditingControllerName.text.length>12 ){
                          displayMessage(
                              "Name must be at max 8 Character", context);
                        }
                        else
                          createAccount();
                      },
                      textColor: Colors.white,
                      child: Text("Submit"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
  final FirebaseAuth _firebase = FirebaseAuth.instance;

  createAccount() async {
    showDialog(context: context, builder: (BuildContext context){
      return DialogBoxWidget('Registering');
    });
    User? newUser = (await _firebase
        .createUserWithEmailAndPassword(
        email: TextEditingControllerEmaill.text,
        password: TextEditingControllerPassword.text)
        .catchError((error) {
      displayMessage("Error" + error.toString(), context);
    })).user;
    if (newUser != null) {
      Map UserDataMap = {
        "name": TextEditingControllerName.text.trim(),
        "email": TextEditingControllerEmaill.text.trim(),
        "password": TextEditingControllerPassword.text.trim(),
      };

      databaseReference.child(newUser.uid).set(UserDataMap);
      Navigator.pushNamedAndRemoveUntil(
          context, Login_screen.id, (route) => false);
      displayMessage("Congratulations, You account has been Created", context);

    } else {
      Navigator.pop(context);
      displayMessage("Opss, New user not has been Created", context);
    }
  }
}
displayMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}