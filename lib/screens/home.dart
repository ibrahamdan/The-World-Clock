import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff7E7F83),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff34312D), Color(0xff14110F)]),
                      borderRadius: BorderRadius.all(Radius.circular(80.0))),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(80.0))),
                        backgroundColor: Colors.transparent),
                    onPressed: () {
                      Navigator.pushNamed(context, '/location');
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.location_pin,
                          color: Color(0xff7E7F83),
                        ),
                        Text(
                          'Choose Location',
                          style: TextStyle(color: Color(0xff7E7F83)),
                        ),
                        SizedBox(
                          width: 3.0,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
