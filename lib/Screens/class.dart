import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WorldClock {
  late String time;
  String flag;
  String location;
  String url;
  late String isDayTime;

  WorldClock({required this.location, required this.url, required this.flag});

  Future<void> getdata() async {
    var site = Uri.http("worldtimeapi.org", "api/timezone/$url");
    //var site = Uri.http("worldtimeapi.org", "api/timezone/Asia/Kolkata");
    http.Response jsonData = await http.get(site);
    Map mapData = jsonDecode(jsonData.body);
    String dateTime = mapData['datetime'];
    String offset = mapData['utc_offset'];
    String offHour = offset.substring(0, 3);
    String offMin = offset.substring(4, 6);
    int ss = int.parse(offHour) * 60 + int.parse(offMin);
    DateTime dt = DateTime.parse(dateTime).add(Duration(minutes: ss));
    isDayTime = dt.hour > 5 && dt.hour < 12
        ? "Morning"
        : dt.hour >= 12 && dt.hour < 16
            ? "Afternoon"
            : dt.hour >= 16 && dt.hour < 20
                ? "Evening"
                : dt.hour >= 20 && dt.hour < 24
                    ? "Night"
                    : "Dark_Night";
    //print(isDayTime);
    time = DateFormat.jm().format(dt);
    //print(dateTime.substring(0, 10));
    //time = dateTime.substring(0, 10) + " " + dateTime.substring(11, 19);
  }
}
