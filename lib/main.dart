import 'dart:async';

import 'package:circular_clock_demo/widgets/clock_part.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Clock Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
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
    return Center(
      child: ClockPart(
        angle: 0,
        color: Colors.red,
        width: 3,
      ),
    );
  }
}
