import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoadingState();
  }
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Loading'),
    );
  }
}
