import 'package:clinical_pharmacist_intervention/shared/styles/icons_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class BuildCalendarItem extends StatefulWidget {
  const BuildCalendarItem(BuildContext context, {super.key});

  @override
  State<BuildCalendarItem> createState() => _BuildCalendarItemState();
}

class _BuildCalendarItemState extends State<BuildCalendarItem> {

DateTime currentDate =DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
    height: MediaQuery.of(context).size.height*.5,
    width: MediaQuery.of(context).size.width*.7,
    child: Container(
      margin:const EdgeInsets.symmetric(horizontal: 16.0),
      child: drawCalendar(context),
    ),
  );
  }
  
  drawCalendar(BuildContext context) {
    return CalendarCarousel<Event>(
        
        onDayPressed: (DateTime date, List<Event> events) {
          setState(() {
            
          });
          currentDate = date;
        },
        weekendTextStyle:const TextStyle(
          color: Colors.red,
        ),
        thisMonthDayBorderColor: Colors.grey,
  
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
                child: Icon(IconBroken.Document),
              );
            } else {
              return null;
            }
        },
        weekFormat: false,
      // markedDatesMap: _markedDateMap,
        height: 420.0,
        selectedDateTime: currentDate,
        daysHaveCircularBorder: false, /// null for not rendering any border, true for circular border, false for rectangular border
      );
  }
}