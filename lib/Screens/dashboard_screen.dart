import 'package:flutter/material.dart';
import 'package:fixit/Constants/Constants.dart';
import 'package:fixit/Constants/reuseablity_items.dart';
import 'package:fixit/Screens/mainDrawer_screen.dart';

class Dashboard_screen extends StatefulWidget {
  const Dashboard_screen({Key? key}) : super(key: key);
  static String id = 'Dashboard_screen';

  @override
  State<Dashboard_screen> createState() => _Dashboard_screenState();
}

class _Dashboard_screenState extends State<Dashboard_screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: kprimaryColor,
            centerTitle: true,
            title: Text(
              "Dashboard",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  letterSpacing: 1),
            ),
          ),
          drawer: MainDrawer(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      color: kprimaryColor,
                      height: 140,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(100, 25, 0, 0),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 70, 2),
                        child: Text(
                          ''' How Can We Help 
 You Today? ''',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: 22,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 115, 20, 0),
                      color: Colors.white,
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for services',
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ServicesContainer(
                          Image.asset('images/ac.png'), 'Ac Repair'),
                      ServicesContainer(
                          Image.asset('images/electrician.png'), 'Electrician'),
                      ServicesContainer(
                          Image.asset('images/plumber.png'), 'Plumber'),
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ServicesContainer(
                          Image.asset('images/butcher.png'), 'butchery'),
                      ServicesContainer(
                          Image.asset('images/waterboiler.png'), 'Geyser'),
                      ServicesContainer(
                          Image.asset('images/carpenter.png'), 'Carpentery'),
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ServicesContainer(
                          Image.asset('images/quran.png'), 'Quran Tutor'),
                      ServicesContainer(
                          Image.asset('images/carservice.png'), 'Mechanic'),
                      ServicesContainer(
                          Image.asset('images/door.png'), 'Lock Repair'),
                    ],
                  ),
                ),
                FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ServicesContainer(
                          Image.asset('images/networking.png'), 'Networking'),
                      ServicesContainer(
                          Image.asset('images/tailor.png'), 'Home tailor'),
                      ServicesContainer(Image.asset('images/paintingwall.png'),
                          'Painting Wall'),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ServicesContainer(Image.asset('images/waterfilter.png'),
                          'Water Filter'),
                      ServicesContainer(
                          Image.asset('images/sofa.png'), 'Upholstery'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
