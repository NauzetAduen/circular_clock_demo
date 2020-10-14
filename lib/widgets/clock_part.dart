import 'package:flutter/material.dart';

class ClockPart extends StatefulWidget {
  final double angle;
  final Color color;
  final double width;

  const ClockPart({this.angle, this.color, this.width});

  @override
  _ClockPartState createState() => _ClockPartState();
}

class _ClockPartState extends State<ClockPart>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 60));
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: Container(
        height: widget.width,
        color: widget.color,
        width: 75,
      ),
    );
  }
}
