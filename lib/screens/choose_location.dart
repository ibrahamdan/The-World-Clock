import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseLocation();
  }
}

class _ChooseLocation extends State<ChooseLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('hi'),
      ),
      body: Text('Choose Location'),
    );
  }
}
