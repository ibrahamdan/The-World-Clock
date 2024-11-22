import 'package:flutter/material.dart';
import 'package:world_time/services/DayNightTheme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    final theme = data['isDaytime'] ? DayNightTheme.day : DayNightTheme.night;

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 1.5,
                      color: theme.textColor,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: theme.textColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: theme.buttonGradient,
                    borderRadius: const BorderRadius.all(Radius.circular(80.0))),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      backgroundColor: Colors.transparent),
                  icon: Icon(
                    Icons.location_pin,
                    color: theme.buttonTextColor,
                  ),
                  label: Text(
                    'Choose Location ',
                    style: TextStyle(color: theme.buttonTextColor),
                  ),
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(
                        context, '/location',
                        arguments: {
                          'theme': theme,
                        });
                    setState(() {
                      data = {
                        'location': result['location'],
                        'time': result['time'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                ),
              )
            ],
          ),
        ));
  }
}
