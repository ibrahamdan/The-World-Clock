import 'package:flutter/material.dart';

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
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        backgroundColor: const Color(0xffD9C5B2),
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
                      color: Color(0xff34312D),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  color: Color(0xff34312D),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xff34312D), Color(0xff14110F)]),
                    borderRadius: BorderRadius.all(Radius.circular(80.0))),
                child: TextButton.icon(
                  style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(80.0))),
                      backgroundColor: Colors.transparent),
                  icon: Icon(
                    Icons.location_pin,
                    color: Color(0xffD9C5B2),
                  ),
                  label: Text(
                    'Choose Location ',
                    style: TextStyle(color: Color(0xffD9C5B2)),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/location');
                  },
                ),
              )
            ],
          ),
        ));
  }
}
