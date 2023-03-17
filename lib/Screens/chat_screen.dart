import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/AllWidegets/chatbox.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, icon: const Icon(Icons.arrow_back_ios_sharp)),
        title: const Text('Chat'),
        backgroundColor: kprimaryColor,
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
        child: Chatbox(),

      )
    );
  }
}
