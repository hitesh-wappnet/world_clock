import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // ignore: prefer_typing_uninitialized_variables
  var data;
  @override
  Widget build(BuildContext context) {
    data = data ?? ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: data["isDayTime"] == "Morning"
                  ? const AssetImage("lib/Images/Morning.jpg")
                  : data["isDayTime"] == "Afternoon"
                      ? const AssetImage("lib/Images/Afternoon.jpg")
                      : data["isDayTime"] == "Evening"
                          ? const AssetImage("lib/Images/Evening.jpeg")
                          : data["isDayTime"] == "Night"
                              ? const AssetImage("lib/Images/Night.jpg")
                              : const AssetImage("lib/Images/Dark_Night.jpg"),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    var result = await Navigator.pushNamed(context, "location");
                    setState(() {
                      data = result;
                    });
                  },
                  icon: const Icon(Icons.edit_location),
                  label: const Text(
                    "Edit Location",
                    style: TextStyle(
                        fontFamily: "new", fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: const TextStyle(
                          fontSize: 34,
                          color: Colors.white,
                          fontFamily: "new",
                          fontWeight: FontWeight.bold,
                          letterSpacing: 4.0),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data["time"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontFamily: "new",
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
