import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class BuildCCalendar extends StatelessWidget {
  const BuildCCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarCarousel<Event>(
      onDayPressed: (DateTime date, List<Event> events) {
      },
      weekendTextStyle: const TextStyle(
        color: Colors.white,
      ),
      thisMonthDayBorderColor: Colors.grey,
      iconColor: Colors.white,
      daysTextStyle: const TextStyle(
        color: Colors.black,
      ),
      nextDaysTextStyle: const TextStyle(
        color: Colors.brown,
      ),
      prevDaysTextStyle: const TextStyle(
        color: Colors.brown,
      ),

      inactiveDaysTextStyle: const TextStyle(
        color: Colors.white,
      ),
      headerTextStyle: const TextStyle(
        color: Colors.black,
      ),

      weekdayTextStyle: const TextStyle(
        color: Colors.black,
      ),
      weekDayMargin: EdgeInsets.zero,
      weekDayPadding: EdgeInsets.zero,
      customDayBuilder: (
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day,
      ) {
        if (day.day == 28) {
          return const Center(
            child: Icon(IconBroken.Document, size: 18),
          );
        } else {
          return null;
        }
      },
      weekFormat: false,
      height: 160.0,
      headerMargin: EdgeInsets.zero,
      selectedDateTime: DateTime.now(),
      daysHaveCircularBorder: false,
      weekDayFormat: WeekdayFormat.narrow,
      childAspectRatio: 1,

      /// null for not rendering any border, true for circular border, false for rectangular border
    );
  }
}