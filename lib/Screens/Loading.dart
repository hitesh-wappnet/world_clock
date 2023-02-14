// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:world_clock/Screens/class.dart';

// ignore: use_key_in_widget_constructors
class MyLoading extends StatefulWidget {
  @override
  State<MyLoading> createState() => _MyLoadingState();
}

class _MyLoadingState extends State<MyLoading> {
  getClock() async {
    WorldClock obj = WorldClock(
        location: "Los_Angeles", url: "Australia/Sydney", flag: "india.png");
    await obj.getdata();
    //print("domnee");
    Navigator.pushReplacementNamed(context, "home", arguments: {
      "location": obj.location,
      "flag": obj.flag,
      "time": obj.time,
      "isDayTime": obj.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    getClock();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
        SpinKitFadingCube(
          color: Colors.amber,
          size: 80,
          duration: Duration(seconds: 5),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          "Loading...",
          style: TextStyle(
            fontSize: 20,
            color: Colors.amberAccent,
            fontFamily: "new",
            fontWeight: FontWeight.bold,
          ),
        )
      ]),
    );
  }
}
