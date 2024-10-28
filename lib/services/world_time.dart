import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  late String time;
  String url;
  late bool isDaytime;

  WorldTime(this.location, this.url);

  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['dateTime'];
      DateTime now = DateTime.parse(datetime);
      time = DateFormat.jm().format(now);
      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
    } catch (e) {
      time = 'Could not get time data';
    }
  }
}
