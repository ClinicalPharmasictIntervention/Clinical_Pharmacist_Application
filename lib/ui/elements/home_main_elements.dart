
import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

drawContainerItem(
      {required Widget child,
      required Color color,
      required double height,
      double? width,
      Gradient? gradient}) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: color,
        gradient: gradient,
        shape: BoxShape.rectangle,
      ),
      height: height,
      child: child,
    );
  }






  