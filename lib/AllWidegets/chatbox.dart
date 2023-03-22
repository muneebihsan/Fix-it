import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fixit/Screens/chatPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Chatbox extends StatefulWidget {
  const Chatbox({Key? key}) : super(key: key);

  @override
  State<Chatbox> createState() => _ChatboxState();
}

final auth = FirebaseAuth.instance.currentUser!.uid;
final fireStore = FirebaseFirestore.instance.collection('users').snapshots();

class _ChatboxState extends State<Chatbox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: StreamBuilder<Object>(
          stream: fireStore,
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  else if(!snapshot.hasData){
                    return Container();
                  }
                  else if (snapshot.hasError) {
                    return Text("something error : ${snapshot.error}");
                  }
                  else if(snapshot !=null && snapshot.hasData ) {

                    return ListTile(
                      leading: CircleAvatar(child: Icon(CupertinoIcons
                          .person)),
                      title:
                      InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    chatPage(email: snapshot.data!
                                        .docs[index]['name'].toString())));
                          },
                          child: Text(snapshot.data!.docs[index]['name']
                              .toString())),
                      subtitle: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) =>
                                    chatPage(email: snapshot.data!
                                        .docs[index]['name'].toString())));
                          },
                          child: Text('last message')),
                      trailing: Text(
                        "2:00",
                        style: TextStyle(color: Colors.black54),
                      ),
                    );
                  }
                    else
                       return Container();
                });
          }),
    );
  }
}

/*

if(snapshot.hasData)
              return ListTile(
                leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
                title: Text(''),
                subtitle: Text(''),
                trailing: Text("2:00",style: TextStyle(color: Colors.black54),),
              );
              return const ListTile(
              leading: CircleAvatar(child: Icon(CupertinoIcons.person)),
              title: Text("Demo person"),
              subtitle: Text("Last message"),
              trailing: Text("2:00",style: TextStyle(color: Colors.black54),),
            );*/
