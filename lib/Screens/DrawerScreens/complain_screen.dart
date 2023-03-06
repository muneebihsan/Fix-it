import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ComplaintPage extends StatefulWidget {
  @override
  _ComplaintPageState createState() => _ComplaintPageState();
}

class _ComplaintPageState extends State<ComplaintPage> {
  late String _title ;
  late String _comment;

  void _submitComplaint() {
    // Implement the functionality to submit the complaint
    // using the title and comment variables.
    print('Title: $_title');
    print('Comment: $_comment');
    if (_title.isNotEmpty && _comment.isNotEmpty) {
      Navigator.pop(context);
      displayMessage('Your complain has been sumbited', context);
    }
    else
  displayMessage('Fill the title and comment', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ksecondaryColor,
        centerTitle: true,
        title: Text('Complaint Page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
              ),
              Text(
                'Title',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _title = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Text(
                'Comment',
                style: TextStyle(fontSize: 18.0),
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    _comment = value;
                  });
                },
                maxLines: 5,
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 210.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ksecondaryColor,
                  ),
                  onPressed: _submitComplaint,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  displayMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

/*
import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
class Complain_screen extends StatelessWidget {
  const Complain_screen({Key? key}) : super(key: key);
//ToDo Url launcher with email address
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          },
              iconSize: 30,
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Complain"),
        ),
      ),
    );
  }
}
*/
