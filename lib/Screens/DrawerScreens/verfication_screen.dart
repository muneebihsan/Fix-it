import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Screens/partnerDashboad_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:fixit/Models/pickImage.dart';
class VerficationScreen extends StatefulWidget {
  @override
  State<VerficationScreen> createState() => _VerficationScreenState();
}

class _VerficationScreenState extends State<VerficationScreen> {
  String valueChoose = 'Ac Repair';

  List itemList = [
    'Ac Repair',
    'Electricain',
    'Plumber',
    'butchery',
    'Geyser',
    'Carpentery',
    'Quran Tutor',
    'Mechanic',
    'Lock Repair',
    'Networking',
    'Painting Wall',
    'Upholstery',
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: ksecondaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              iconSize: 30,
              icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          title: Text("Verification"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 148,
              ),
              verficationContainerWidget(
                  iconData: Icons.add_a_photo, text: ' Provide us your selfie'),
              SizedBox(
                height: 25,
              ),
              verficationContainerWidget(
                  iconData: Icons.add_card, text: 'Take a picture of Cnic'),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(23),
                      border: Border.all(color: kprimaryColor, width: 2.5)),
                  child: DropdownButton(
                    enableFeedback: true,
                    menuMaxHeight: 320,
                    value: valueChoose,
                    items: itemList.map((valueitem) {
                      return DropdownMenuItem(

                          value: valueitem, child: Center(child: Text(valueitem)));
                    }).toList(),
                    isExpanded: true,
                    iconEnabledColor: kprimaryColor,
                    onChanged: (newvalue) {
                      setState(() {
                        valueChoose = newvalue.toString();
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: kprimaryColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kprimaryColor,
                      ),
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          title: 'Confirmation',
                          desc: "Are you sure?😉 ",
                          dialogType: DialogType.question,
                          showCloseIcon: true,
                          btnCancelOnPress: (){},
                          btnCancelIcon: null,
                          btnOkText: 'Create it 😍 ',
                          btnOkOnPress: (){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PartnerDashboard(valueChoose,)), (route) => false);
                          },
                        ).show();

                      },
                      child: Text("Submit")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class verficationContainerWidget extends StatelessWidget {
  final IconData? iconData;
  final String? text;

  verficationContainerWidget({this.iconData, this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pickuploadingImage();
      },
      child: Container(
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(23),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey,
                  blurRadius: 18,
                  spreadRadius: 1,
                  offset: Offset(0.7, 0.7)),
            ]),
        child: Row(
          children: [
            SizedBox(
              width: 28,
            ),
            Icon(
              iconData,
              color: kprimaryColor,
              size: 25,
            ),
            Center(
              widthFactor: 1.2,
              child: Text(
                "$text",
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

