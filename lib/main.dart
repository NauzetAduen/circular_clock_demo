import 'dart:async';

import 'package:circular_clock_demo/widgets/clock.dart';
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
  double angle = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    DateTime time = DateTime.now();
    angle = 5;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                "${time.hour.toString()} : ${time.minute.toString()} : ${time.second.toString()}"),
            SizedBox(
              height: 50,
            ),
            Clock(
              angle: angle,
              color: Colors.red,
              width: 3,
            ),
          ],
        ),
      ),
    );
  }
}
