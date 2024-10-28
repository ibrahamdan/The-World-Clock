import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    WorldTime instance = WorldTime(
      'London',
      'Europe%2FLondon',
    );
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff34312D),
      body: Center(
        child: SpinKitWave(
          color: Color(0xffD9C5B2),
          size: 50.0,
        ),
      ),
    );
  }
}
