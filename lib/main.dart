import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CircularCLock(),
    );
  }
}

class CircularCLock extends StatefulWidget {
  @override
  _CircularCLockState createState() => _CircularCLockState();
}

class _CircularCLockState extends State<CircularCLock> {
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}

class Minutero extends StatelessWidget {
  final double angle;
  const Minutero(this.angle);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        height: 2,
        color: Colors.red,
        width: 150,
      ),
    );
  }
}
