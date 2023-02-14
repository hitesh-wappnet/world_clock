import 'package:flutter/material.dart';
import 'package:world_clock/Screens/Loading.dart';
import 'package:world_clock/Screens/home.dart';
import 'package:world_clock/Screens/locations.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Buddy Clock",
    initialRoute: "loading",
    routes: {
      "loading": (context) => MyLoading(),
      "home": (context) => MyHome(),
      "location": (context) => MyLocation(),
    },
  ));
}
