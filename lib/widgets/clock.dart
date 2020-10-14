import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  final double angle;
  final Color color;
  final double width;

  const Clock({this.angle, this.color, this.width});

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> with TickerProviderStateMixin {
  AnimationController minuteController;
  Animation<double> minuteAnimation;
  AnimationController hourController;
  Animation<double> hourAnimation;

  @override
  void initState() {
    minuteController =
        AnimationController(vsync: this, duration: const Duration(minutes: 60));
    hourController =
        AnimationController(vsync: this, duration: const Duration(hours: 24));
    minuteAnimation = CurvedAnimation(
      parent: minuteController,
      curve: Curves.linear,
    );
    hourAnimation = CurvedAnimation(
      parent: hourController,
      curve: Curves.linear,
    );

    double fromMinute = transformInitialMinutes();
    double fromHour = transformInitialHour();

    minuteController
      ..forward(from: fromMinute)
      ..repeat();
    hourController
      ..forward(from: fromHour)
      ..repeat(); // minuteController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    minuteController.dispose();
    hourController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RotationTransition(
          turns: minuteAnimation,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                width: 25,
              ),
              Container(
                height: widget.width,
                color: widget.color,
                width: 25,
              ),
            ],
          ),
        ),
        RotationTransition(
          turns: hourAnimation,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                color: Colors.transparent,
                width: 25,
              ),
              Container(
                height: widget.width,
                color: Colors.grey,
                width: 25,
              ),
            ],
          ),
        )
      ],
    );
  }
}

double transformInitialMinutes() {
  int minutes = DateTime.now().minute;
  double value = 0.0;

  //percent is the percent of the circle starting from 0 (up)
  double percent = minutes / 60;
  value = percent + 0.75;
  if (value > 1) {
    value -= 1;
  }
  return value;
}

double transformInitialHour() {
  //TODO
  //we need to add how much minutes
  int hour = DateTime.now().hour;
  double value = 0.0;
  double percent = hour / 24;
  print("percent $percent");
  value = percent + 0.75;

  if (value > 1) {
    value -= 1;
  }
  print("value $value");
  return value;
}
