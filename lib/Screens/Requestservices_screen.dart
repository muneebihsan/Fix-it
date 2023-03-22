import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:fixit/main.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fixit/Screens/chatPage.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class request_screen extends StatefulWidget {
  @override
  final String category;

  request_screen(@required this.category);

  State<request_screen> createState() => _request_screenState();
}

final service = FirebaseDatabase.instance.ref('Request');
final searchfilter = TextEditingController();

class _request_screenState extends State<request_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          title: Text('Services'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 20),
              color: Colors.white,
              child: TextField(
                  controller: searchfilter,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: kSearchDecoration),
            ),
            Expanded(
              child: FirebaseAnimatedList(
                  defaultChild: Center(
                      child: Text(
                    'Loading. . .',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  )),
                  query: handymanRequest,
                  itemBuilder: (context, snapshot, animation, index) {
                    final id = snapshot.child('id').value.toString();
                    final service = snapshot
                        .child(
                          'service',
                        )
                        .value
                        .toString();
                    if (searchfilter.text.isEmpty) {
                      if (widget.category ==
                          snapshot
                              .child(
                                'service',
                              )
                              .value
                              .toString()) {
                        return GestureDetector(
                          onDoubleTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chatPage(
                                        email: snapshot
                                            .child('name')
                                            .value
                                            .toString())));
                          },
                          child: ListTile(
                            iconColor: ksecondaryColor,
                            contentPadding: EdgeInsets.all(5),
                            dense: true,
                            leading: Column(
                              children: [
                                Text(
                                  snapshot
                                      .child(
                                        'service',
                                      )
                                      .value
                                      .toString(),
                                  style: TextStyle(color: kprimaryColor),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Time " + snapshot.child('time').value.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),),
                              ],
                            ),
                            title:
                                Text(snapshot.child('name').value.toString()),
                            subtitle:
                                Text(snapshot.child('location').value.toString()),


                            trailing: IconButton(
                              onPressed: () {
                                handymanRequest
                                    .child(id)
                                    .update({'request': true});
                                AwesomeDialog(
                                  context: context,
                                  title: 'Accepted',
                                  desc: "You accept  ${snapshot
                                      .child('name')
                                      .value
                                      .toString().substring(0,6)} request",
                                  dialogType: DialogType.noHeader,
                                  btnOkColor: Colors.green,
                                  btnOkText: 'Ok',
                                  btnOkOnPress: () {},
                                ).show();
                              },
                              icon: Icon(Icons.check),
                              color: Colors.green,
                            ),
                          ),
                        );
                      }
                    } else if (service
                        .toLowerCase()
                        .contains(searchfilter.text.toLowerCase())) {
                      return GestureDetector(
                        onDoubleTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => chatPage(
                                      email: snapshot
                                          .child('name')
                                          .value
                                          .toString())));
                        },
                        child: ListTile(
                          iconColor: ksecondaryColor,
                          contentPadding: EdgeInsets.all(5),
                          dense: true,
                          leading: Text(
                            snapshot
                                .child(
                                  'service',
                                )
                                .value
                                .toString(),
                            style: TextStyle(color: kprimaryColor),
                          ),
                          title: Text(snapshot.child('name').value.toString()),
                          subtitle:
                              Row(
                                children: [
                                  Text(snapshot.child('location').value.toString()),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(snapshot.child('time').value.toString(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),),
                                ],
                              ),
                          trailing: IconButton(
                            onPressed: () {
                              handymanRequest
                                  .child(id)
                                  .update({'request': true});
                              print('this is id $id');
                            },
                            icon: Icon(Icons.check, color: Colors.green),
                          ),
                        ),
                      );
                    }
                    return Container();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
/*
FirebaseAnimatedList(
sort: ,
scrollDirection: axisDirectionToAxis(AxisDirection.down),

defaultChild: Center(child: Text('Loading. . .',style: TextStyle(
fontWeight: FontWeight.bold,
fontSize: 18,
),)),
query: handymanRequest, itemBuilder: (context,snapshot,animation,index){
return ListTile(
dense: true,
isThreeLine: true,
leading: Text(snapshot.child('service').value.toString()),
title: Text(snapshot.child('name').value.toString()),
subtitle: Text(snapshot.child('location').value.toString()),
trailing: Text('12:30'),
);
})
*/

////
/*
StreamBuilder(
stream: service.onValue,
builder: (context,AsyncSnapshot<DatabaseEvent> snapshot){
if(!snapshot.hasData)
return Text('Loading . . .');
else
Map<dynamic,dynamic> map1 =snapshot.data!.snapshot.value as dynamic ;
List<dynamic> list =[];
list.clear();
list=map1.values.toList();
return ListView.builder(
itemCount: snapshot.data!.snapshot.children.length,
itemBuilder: (context,index){

return ListTile(
leading: Text(list[index]['service']),*/
/*
                    title: Text(list[index]['name']),
                    subtitle:Text(list[index]['location']),
                    trailing: Text('12:30'),*/ /*


);
});
},
)*/
