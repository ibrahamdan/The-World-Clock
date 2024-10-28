import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:world_time/services/world_time.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: locationsView.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              },
              title: Text(locationsView[index]),
            ),
          );
        },
      ),
    );
  }
}
