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
  String time = 'Loading';

  Future<void> setuoWorldTime() async {
    WorldTime instance = WorldTime(
        'London',
        'data:image/png;base64,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',
        'Europe%2FLondon');
    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time
    });
  }

  @override
  void initState() {
    super.initState();
    setuoWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
