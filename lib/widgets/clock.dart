import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock();

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
      alignment: Alignment.center,
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
                height: 2,
                color: Colors.red,
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
                height: 3,
                color: Colors.grey,
                width: 25,
              ),
            ],
          ),
        ),
        Container(
          width: 5,
          height: 5,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orangeAccent,
          ),
        ),
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
  DateTime time = DateTime.now();
  double value = 0.0;
  double percent = time.hour / 24;
  double minutePercent = time.minute / 60;
  value = percent + 0.75 + minutePercent / 100;

  if (value > 1) {
    value -= 1;
  }
  return value;
}
