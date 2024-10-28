import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';
import 'package:world_time/services/DayNightTheme.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseLocation();
  }
}

class _ChooseLocation extends State<ChooseLocation> {
  List<String> locationsView = [];
  List<String> locationsApi = [];

  Future<void> fetchAndFormatLocations() async {
    List<String> locations = await fetchLocations();
    setState(() {
      locationsApi = apiFormatLocation(locations);
      locationsView = viewFormatLocation(locations);
    });
  }

  Future<List<String>> fetchLocations() async {
    Response response = await get(
        Uri.parse('https://timeapi.io/api/timezone/availabletimezones'));

    List<dynamic> timezones = jsonDecode(response.body);
    return timezones.cast<String>();
  }

  List<String> viewFormatLocation(List<String> list) {
    List<String> formatted = [];
    for (int i = 0; i < list.length; i++) {
      formatted.add(list[i].replaceAll('/', ' - ').replaceAll('_', ' '));
    }
    return formatted;
  }

  List<String> apiFormatLocation(List<String> list) {
    List<String> formatted = [];
    for (int i = 0; i < list.length; i++) {
      formatted.add(list[i].replaceAll('/', '%2f'));
    }
    return formatted;
  }

  void updateTime(index) async {
    WorldTime instance =
        WorldTime(locationsView[index].split(' - ').last, locationsApi[index]);
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    fetchAndFormatLocations();
  }

  Map data = {};

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;

    final DayNightTheme theme = data['theme'] == DayNightTheme.day
        ? DayNightTheme.night
        : DayNightTheme.day;

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: ListView.builder(
        itemCount: locationsView.length,
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
            child: Container(
              decoration: BoxDecoration(
                gradient: theme.buttonGradient,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(
                  locationsView[index],
                  style: TextStyle(
                    color: theme.buttonTextColor,
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
              ),
            ),
          );
        },
      ),
    );
  }
}
