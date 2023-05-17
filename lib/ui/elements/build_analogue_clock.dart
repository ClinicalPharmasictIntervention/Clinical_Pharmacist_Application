import 'package:analog_clock/analog_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BuildAnalogueClock extends StatelessWidget {
   BuildAnalogueClock({super.key});

  var timeNow = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      DateTime.now().hour,
      DateTime.now().minute,
      DateTime.now().second,
      DateTime.now().millisecond,
      DateTime.now().microsecond);

  @override
  Widget build(BuildContext context) {
    return  AnalogClock(
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Colors.black),
        color: Colors.transparent,
        shape: BoxShape.circle,
      ),
      useMilitaryTime: false,
      isLive: true,
      hourHandColor: Colors.black,
      minuteHandColor: Colors.black,
      showSecondHand: true,
      numberColor: Colors.black87,
      showNumbers: true,
      showAllNumbers: false,
      textScaleFactor: 1.4,
      showTicks: true,
      tickColor: Colors.white,
      showDigitalClock: true,
      datetime: timeNow,
    );
  }
}