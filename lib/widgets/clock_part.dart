import 'package:flutter/material.dart';

class ClockPart extends StatelessWidget {
  final double angle;
  final Color color;
  final double width;

  const ClockPart({this.angle, this.color, this.width});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        height: width,
        color: color,
        width: 150,
      ),
    );
  }
}
