import 'package:flutter/material.dart';
import 'package:world_time/screens/home.dart';
import 'package:world_time/screens/loading.dart';
import 'package:world_time/screens/choose_location.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation()
    },
  ));
}
