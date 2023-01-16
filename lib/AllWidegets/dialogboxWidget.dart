import 'package:flutter/material.dart';

class DialogBoxWidget extends StatelessWidget {
  String message;
  DialogBoxWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        margin: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child:Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              SizedBox( width:6.0),
              CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Colors.black),),
              SizedBox(width: 6.0),
              Text(message,style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
