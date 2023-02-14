import 'package:flutter/material.dart';
import 'package:world_clock/Screens/class.dart';

// use_key_in_widget_constructors
// ignore: use_key_in_widget_constructors, must_be_immutable
class MyLocation extends StatefulWidget {
  @override
  State<MyLocation> createState() => _MyLocationState();
}

class _MyLocationState extends State<MyLocation> {
  List<WorldClock> locations = [
    WorldClock(location: "Sydney", url: "Australia/Sydney", flag: "sydney.jpg"),
    WorldClock(
        location: "San Miguel",
        url: "America/Argentina/Buenos_Aires",
        flag: "San_Miguel.jpg"),
    WorldClock(location: "Berlin", url: "Europe/Berlin", flag: "berlin.png"),
    WorldClock(location: "Mumbai", url: "Asia/Kolkata", flag: "mumbai.jpg"),
    WorldClock(
        location: "Hong Kong", url: "Asia/Hong_Kong", flag: "Hong_Kong.png"),
    WorldClock(location: "Tokyo", url: "Asia/Tokyo", flag: "tokyo.png"),
    WorldClock(location: "London", url: "Europe/London", flag: "london.jpg"),
    WorldClock(
        location: "São Paulo", url: "America/Sao_Paulo", flag: "São_Paulo.png"),
    WorldClock(
        location: "New York City",
        url: "America/New_York",
        flag: "New_York_City.png"),
    WorldClock(
        location: "Mexico City",
        url: "America/Mexico_City",
        flag: "mexico.png"),
    WorldClock(
        location: "Los Angeles",
        url: "America/Los_Angeles",
        flag: "Los_Angeles.png"),
    // WorldClock(location: "Nanjing", url: "Asia/Shanghai", flag: "nanjing.jpg"),
    WorldClock(location: "Tehran", url: "Asia/Tehran", flag: "tehran.png"),
    WorldClock(location: "Jakarta", url: "Asia/Jakarta", flag: "jakarta.png"),
    WorldClock(location: "Lagos", url: "Africa/Lagos", flag: "lagos.png"),
  ];

  loc(index) async {
    WorldClock obj = locations[index];
    await obj.getdata();
    print("jaaa");
    Navigator.pop(context, {
      "location": obj.location,
      "flag": obj.flag,
      "time": obj.time,
      "isDayTime": obj.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select Location",
          style: TextStyle(fontFamily: "new", fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        //titleSpacing: 4.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  loc(index);
                },
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("lib/country/${locations[index].flag}"),
                ),
                title: Text(
                  locations[index].location,
                  style:
                      TextStyle(fontFamily: "new", fontWeight: FontWeight.bold),
                ),
              ),
            );
          }),
    );
  }
}
